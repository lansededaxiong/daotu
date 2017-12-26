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
namespace app\portal\service;

use app\portal\model\PortalClassificationModel;
use app\portal\model\PortalKnowledgeModel;

class KnowledgeService
{

    public function adminKnowledgeList($filter)
    {
        $where = [
            'e.create_time' => ['>=', 0],
            'e.delete_time' => 0
        ];

        $field = 'e.*';

        $classification = empty($filter['classification']) ? 0 : intval($filter['classification']);
        $join = [];
        if (!empty($classification)) {
            $portalClassificationModel = new PortalClassificationModel();
            $classificationIds = $portalClassificationModel->where('parent_id='.$classification)->column('id');
            if(empty($classificationIds)){
                $where['b.classification_id'] = ['eq', $classificationIds];
            }else{
                $classification = implode(',', $classificationIds);
                $where['b.classification_id'] = ['in', $classification];
            }
            array_push($join, [
                '__PORTAL_CLASSIFICATION_KNOWLEDGE__ b', 'e.id = b.knowledge_id'
            ]);
            $field = 'e.*,b.id AS knowledge_classification_id,b.list_order,b.classification_id';
        }

        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['e.published_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['e.published_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['e.published_time'] = ['<= time', $endTime];
            }
        }

        $keyword = empty($filter['keyword']) ? '' : $filter['keyword'];
        if (!empty($keyword)) {
            $where['e.name'] = ['like', "%$keyword%"];
        }

        $portalKnowledgeModel = new PortalKnowledgeModel();
        $knowledges        = $portalKnowledgeModel->alias('e')->field($field)
            ->join($join)
            ->where($where)
            ->order('update_time', 'DESC')
            ->paginate(10);

        return $knowledges;
    }
}