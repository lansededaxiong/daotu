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

class PortalPointModel extends Model
{

    /**
     * 关联试题知识点表
     */
    public function knowledges()
    {
        return $this->belongsToMany('PortalKnowledgeModel', 'portal_knowledge_point', 'knowledge_id', 'point_id');
    }
    /**
     * 关联分类表
     */
    public function categories()
    {
        return $this->belongsToMany('PortalCategoryModel', 'portal_category_exam', 'category_id', 'exam_id');
    }
    /**
     * 试题知识点列表
     */
    public function PointList($filter)
    {
        $where = [];

        $join = [['__PORTAL_EXAMINATION__ e','a.exam_id = e.id'],
            ['__PORTAL_CATEGORY_EXAM__ ce', 'ce.exam_id = e.id'],
            ['__PORTAL_CATEGORY__ c', 'ce.category_id = c.id']];

        $field = 'a.*,e.exam_title';
        $category = empty($filter['category']) ? 0 : intval($filter['category']);
        if (!empty($category)) {
            $portalCategoryModel = new PortalCategoryModel();
            $categoryIds = $portalCategoryModel->where('parent_id='.$category)->column('id');
            if(empty($categoryIds)){
                $where['ce.category_id'] = ['eq', $category];
            }else{
                $category = implode(',', $categoryIds);
                $where['ce.category_id'] = ['in', $category];
            }

        }
        $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
        if (!empty($keyword)) {
            $where['e.exam_title'] = ['like', "%$keyword%"];
        }

        $portalPointModel = new PortalPointModel();
        $points        = $portalPointModel->alias('a')->field($field)
            ->join($join)
            ->where($where)
            ->order('a.create_time', 'DESC')
            ->paginate(10);

        return $points;
    }
    /**
     * 修改试题知识点
     */
    public function editPoint($pointData,$knowledgeIds){
        $pointId = $pointData['id'];
        if (is_string($knowledgeIds)) {
            $knowledgeIds = explode(',', $knowledgeIds);
        }
        $data = [];
        if($knowledgeIds){
            $oldPointIds  =  Db::name('portal_knowledge_point')->where('point_id='.$pointId)->column('id');
            $samePointIds       = array_intersect($knowledgeIds, $oldPointIds);
            $needDeletePointIds = array_diff($oldPointIds, $samePointIds);
            $newPointIds        = array_diff($knowledgeIds, $samePointIds);
            foreach ($newPointIds as $newPointId){
                $newPointId = trim($newPointId);
                if (!empty($newPointId)) {
                    array_push($data, ['point_id' => $pointId, 'knowledge_id' => $newPointId]);
                }
            }
            if (!empty($needDeletePointIds)) {
                Db::name('portal_knowledge_point')->where(['point_id' => $pointId, 'knowledge_id' => ['in', $needDeletePointIds]])->delete();
            }

            if (!empty($data)) {
                Db::name('portal_knowledge_point')->insertAll($data);
            }

        } else {
            Db::name('portal_knowledge_point')->where('point_id', $pointId)->delete();
        }

    }
}