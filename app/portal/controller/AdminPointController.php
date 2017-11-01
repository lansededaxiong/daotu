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

use cmf\controller\AdminBaseController;
use app\portal\model\PortalPointModel;

use app\portal\model\PortalCategoryModel;
use think\Db;

class AdminPointController extends AdminBaseController
{
    /**
     * 试题埋点列表
     * @adminMenu(
     *     'name'   => '试题埋点管理',
     *     'parent' => 'portal/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题埋点列表',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $param = $this->request->param();

        $categoryId = $this->request->param('category', 0, 'intval');

        $portalPointModel = new PortalPointModel();
        $data        = $portalPointModel->PointList($param);
        $data->appends($param);
        $portalCategoryModel = new PortalCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryId);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('points', $data);
        $this->assign('category_tree', $categoryTree);
        $this->assign('category', $categoryId);
        $this->assign('page', $data->render());

        return $this->fetch();
    }

    /**
     * 编辑试题埋点
     * @adminMenu(
     *     'name'   => '编辑试题埋点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题埋点',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');

        $portalPointModel = new PortalPointModel();
        $point            = $portalPointModel->where('id', $id)->find();
        $pointKnowledges  = $point->knowledges()->alias('a')->column('a.name', 'a.id');
        $pointKnowledgeIds = implode(',', array_keys($pointKnowledges));

        $this->assign('point', $point);
        $this->assign('point_knowledges', $pointKnowledges);
        $this->assign('point_knowledge_ids', $pointKnowledgeIds);

        return $this->fetch();
    }

    /**
     * 编辑试题埋点提交
     * @adminMenu(
     *     'name'   => '编辑试题埋点提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题埋点提交',
     *     'param'  => ''
     * )
     */
    public function editPoint()
    {

        if ($this->request->isPost()) {
            $data   = $this->request->param();
            /*$point   = $data['point'];
            $result = $this->validate($point, 'AdminPoint');
            if ($result !== true) {
                $this->error($result);
            }*/
            $portalPointModel = new PortalPointModel();

            $portalPointModel->editPoint($data['point'],$data['point']['knowledges']);

            $this->success('保存成功!');

        }
    }


    /**
     * 试题埋点排序
     * @adminMenu(
     *     'name'   => '试题埋点排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题埋点排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_point'));
        $this->success("排序更新成功！", '');
    }


}
