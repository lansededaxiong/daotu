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
use app\portal\model\PortalCategoryModel;

class IndexController extends HomeBaseController
{
    public function index()
    {
        $portalCategoryModel = new PortalCategoryModel();
        $category = $portalCategoryModel->where('status', 1)->select();
        foreach ($category as $key=>$value){
            $parentCat = $portalCategoryModel->field('name pname')->where('id',$value['parent_id'])->where('status',1)->find();
            $category[$key]['p_cat'] = $parentCat['pname'];
        }
        $this->assign('category', $category);
        return $this->fetch(':index');
    }
}
