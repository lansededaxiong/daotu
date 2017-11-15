<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\model;

use think\Model;
use think\Db;

class PortalExaminationModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    /**
     * 关联 user表
     * @return $this
     */
    public function user()
    {
        return $this->belongsTo('UserModel', 'user_id')->setEagerlyType(1);
    }
    /**
     * 关联 portal_point表
     * @return $this
     */
    public function point()
    {
        return $this->belongsTo('PortalPointModel', 'exam_id','',array(),'LEFT');
    }
    /**
     * 关联分类表
     */
    public function categories()
    {
        return $this->belongsToMany('PortalCategoryModel', 'portal_category_exam', 'category_id', 'exam_id');
    }

    /**
     * post_content 自动转化
     * @param $value
     * @return string
     */
    public function getExamContentAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    /**
     * post_content 自动转化
     * @param $value
     * @return string
     */
    public function setExamContentAttr($value)
    {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }

    /**
     * published_time 自动完成
     * @param $value
     * @return false|int
     */
    public function setPublishedTimeAttr($value)
    {
        return strtotime($value);
    }

    /**
     * 后台管理添加试题
     * @param array $data 试题数据
     * @param array|string $categories 试题分类 id
     * @param string $examPoints
     * @return $this
     */
    public function adminAddExam($data, $categories)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        if (is_string($categories)) {
            $categories = explode(',', $categories);
        }

        $this->categories()->save($categories);

        $data['exam_keywords'] = str_replace('，', ',', $data['exam_keywords']);
        $keywords = explode(',', $data['exam_keywords']);
        $this->addTags($keywords, $this->id);
        return $this;

    }

    /**
     * 后台管理编辑试题
     * @param array $data 试题数据
     * @param array|string $categories 试题分类 id
     * @param string $examPoints
     * @return $this
     */
    public function adminEditExam($data, $categories)
    {

        unset($data['user_id']);

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $data['exam_status'] = empty($data['exam_status']) ? 0 : 1;
        $data['is_top']      = empty($data['is_top']) ? 0 : 1;
        $data['recommended'] = empty($data['recommended']) ? 0 : 1;

        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        if (is_string($categories)) {
            $categories = explode(',', $categories);
        }

        $oldCategoryIds        = $this->categories()->column('category_id');
        $sameCategoryIds       = array_intersect($categories, $oldCategoryIds);
        $needDeleteCategoryIds = array_diff($oldCategoryIds, $sameCategoryIds);
        $newCategoryIds        = array_diff($categories, $sameCategoryIds);

        if (!empty($needDeleteCategoryIds)) {
            $this->categories()->detach($needDeleteCategoryIds);
        }

        if (!empty($newCategoryIds)) {
            $this->categories()->attach(array_values($newCategoryIds));
        }
        $data['exam_keywords'] = str_replace('，', ',', $data['exam_keywords']);
        $keywords = explode(',', $data['exam_keywords']);
        $this->addTags($keywords, $data['id']);

        return $this;

    }

    public function addTags($keywords, $examId)
    {
        $portalTagModel = new PortalTagModel();

        $tagIds = [];

        $data = [];

        if (!empty($keywords)) {

            $oldTagIds = Db::name('portal_tag_exam')->where('exam_id', $examId)->column('tag_id');

            foreach ($keywords as $keyword) {
                $keyword = trim($keyword);
                if (!empty($keyword)) {
                    $findTag = $portalTagModel->where('name', $keyword)->find();
                    if (empty($findTag)) {
                        $tagId = $portalTagModel->insertGetId([
                            'name' => $keyword
                        ]);
                    } else {
                        $tagId = $findTag['id'];
                    }

                    if (!in_array($tagId, $oldTagIds)) {
                        array_push($data, ['tag_id' => $tagId, 'exam_id' => $examId]);
                    }

                    array_push($tagIds, $tagId);

                }
            }


            if (empty($tagIds) && !empty($oldTagIds)) {
                Db::name('portal_tag_exam')->where('exam_id', $examId)->delete();
            }

            $sameTagIds = array_intersect($oldTagIds, $tagIds);

            $shouldDeleteTagIds = array_diff($oldTagIds, $sameTagIds);

            if (!empty($shouldDeleteTagIds)) {
                Db::name('portal_tag_exam')->where(['exam_id' => $examId, 'tag_id' => ['in', $shouldDeleteTagIds]])->delete();
            }

            if (!empty($data)) {
                Db::name('portal_tag_exam')->insertAll($data);
            }


        } else {
            Db::name('portal_tag_exam')->where('exam_id', $examId)->delete();
        }
    }

    /*public function addPoints($examPoints,$examId){
        $data = [];
        if($examPoints){
            $oldPointNames  =  Db::name('portal_point')->where('exam_id='.$examId)->column('point_name');
            $samePointNames       = array_intersect($examPoints, $oldPointNames);
            $needDeletePointNames = array_diff($oldPointNames, $samePointNames);
            $newPointNames        = array_diff($examPoints, $samePointNames);
            foreach ($newPointNames as $newPointName){
                $newPointName = trim($newPointName);
                if (!empty($newPointName)) {
                    array_push($data, ['point_name' => $newPointName, 'exam_id' => $examId,'create_time' => time()]);
                }
            }
            if (!empty($needDeletePointNames)) {
                Db::name('portal_point')->where(['exam_id' => $examId, 'point_name' => ['in', $needDeletePointNames]])->delete();
            }

            if (!empty($data)) {
                Db::name('portal_point')->insertAll($data);
            }

        } else {
            Db::name('portal_point')->where('exam_id', $examId)->delete();
        }
    }*/
}
