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
namespace app\portal\controller;
use cmf\controller\HomeBaseController;
use app\portal\model\PortalKnowledgeModel;

class AddonController extends HomeBaseController
{
    public function ajaxGetKnowledges(){
        $param = $this->request->param();
        $where = [
            'e.create_time' => ['>=', 0],
            'e.delete_time' => 0
        ];
        $field = 'e.id,e.name';
        $keyword = empty($param['keyword']) ? '' : $param['keyword'];
        if (!empty($keyword)) {
            $where['e.name'] = ['like', "%$keyword%"];
        }
        $portalKnowledgeModel = new PortalKnowledgeModel();
        $knowledges        = $portalKnowledgeModel->alias('e')->field($field)
            ->where($where)
            ->order('update_time', 'DESC')
            ->select();
        if($knowledges !== false){
            echo json_encode(array('status'=>1,'data'=> $knowledges));die;
        }else{
            echo json_encode(array('status'=>0,'data'=> '','errMsg'=>'系统错误'));die;
        }

    }

    public function ajaxGetKnowledge(){
        $param = $this->request->param();
        $where = [
            'e.create_time' => ['>=', 0],
            'e.delete_time' => 0
        ];
        $field = 'e.id,e.name,e.content';
        if(!$param['id']){
            echo json_encode(array('status'=>0,'data'=> '','errMsg'=>'参数错误'));die;
        }
        $portalKnowledgeModel = new PortalKnowledgeModel();
        $knowledge = $portalKnowledgeModel->alias('e')->field($field)->where($where)->find($param['id']);
        if($knowledge !== false){
            echo json_encode(array('status'=>1,'data'=> $knowledge));die;
        }else{
            echo json_encode(array('status'=>0,'data'=> '','errMsg'=>'系统错误'));die;
        }

    }
}
