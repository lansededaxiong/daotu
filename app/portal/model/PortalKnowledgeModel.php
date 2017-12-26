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

use app\admin\model\RouteModel;
use think\Model;
use tree\Tree;

class PortalKnowledgeModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    /**
     * 关联分类表
     */
    public function classifications()
    {
        return $this->belongsToMany('PortalClassificationModel', 'portal_classification_knowledge', 'classification_id', 'knowledge_id');
    }


    /**
     * 添加试题知识点
     * @param $data
     * @return bool
     */
    public function adminAddKnowledge($data, $classifications)
    {
        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        if (is_string($classifications)) {
            $classifications = explode(',', $classifications);
        }

        $this->classifications()->save($classifications);
        return $this;
    }
    /**
     * 修改试题知识点
     * @param $data
     * @return bool
     */
    public function adminEditKnowledge($data, $classifications)
    {
        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        if (is_string($classifications)) {
            $classifications = explode(',', $classifications);
        }

        $oldClassificationIds        = $this->classifications()->column('classification_id');
        $sameClassificationIds       = array_intersect($classifications, $oldClassificationIds);
        $needDeleteClassificationIds = array_diff($oldClassificationIds, $sameClassificationIds);
        $newClassificationIds        = array_diff($classifications, $sameClassificationIds);

        if (!empty($needDeleteClassificationIds)) {
            $this->classifications()->detach($needDeleteClassificationIds);
        }

        if (!empty($newClassificationIds)) {
            $this->classifications()->attach(array_values($newClassificationIds));
        }
        return $this;
    }


}