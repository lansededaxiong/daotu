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

use app\portal\model\PortalExamSetModel;
use cmf\controller\HomeBaseController;
use app\portal\model\PortalCategoryModel;

class ListController extends HomeBaseController
{
    public function index()
    {
        $catId                  = $this->request->param('cat_id', 0, 'intval');
        $portalCategoryModel = new PortalCategoryModel();
        $category = $portalCategoryModel->where('id', $catId)->where('status', 1)->find();
        if(empty($category)) $this->redirect('/');
        $parentCat = $portalCategoryModel->field('name pname')->where('id',$category['parent_id'])->where('status',1)->find();
        $category['p_cat'] = $parentCat['pname'];
        $this->assign('category', $category);
        $listTpl =  'list_cat';
        return $this->fetch('/' . $listTpl);
    }
    public function exam_set(){
        $setId                  = $this->request->param('set_id', 0, 'intval');
        $portalExamSetModel = new PortalExamSetModel();
        $set = $portalExamSetModel->where('id', $setId)->where('status', 1)->find();
        if(empty($set)) $this->redirect('/');
        $this->assign('set', $set);
        $listTpl =  'list_set';
        return $this->fetch('/' . $listTpl);
    }
}
