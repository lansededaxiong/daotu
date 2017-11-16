<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:kane < chengjin005@163.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use app\portal\model\PortalExamSetModel;
use cmf\controller\AdminBaseController;
use app\portal\service\ExaminationService;
use think\Db;

/**
 * Class AdminTagController 标签管理控制器
 * @package app\portal\controller
 */
class AdminExamSetController extends AdminBaseController
{
    /**
     * 套题管理
     * @adminMenu(
     *     'name'          => '套题',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     *
     * )
     */
    public function index()
    {
        $portalExamSetModel = new PortalExamSetModel();
        $where = [
            'create_time' => ['>=', 0],
            'delete_time' => 0
        ];
        $examSets  = $portalExamSetModel->field('id,name,create_time,list_order,status')
            ->where($where)
            ->order('create_time', 'DESC')
            ->paginate(10);

        $this->assign("arrStatus", $portalExamSetModel::$STATUS);
        $this->assign("examSets", $examSets);
        $this->assign('page', $examSets->render());
        return $this->fetch();
    }

    /**
     * 添加套题
     * @adminMenu(
     *     'name'          => '添加套题',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function add()
    {
        $portalExamSetModel = new PortalExamSetModel();
        $this->assign("arrStatus", $portalExamSetModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加套题提交
     * @adminMenu(
     *     'name'          => '添加套题提交',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function addExamSet()
    {

        if ($this->request->isPost()) {
            $data = $this->request->param();
            $examSet = $data['exam_set'];
            $result = $this->validate($examSet, 'PortalExamSet');
            if ($result !== true) {
                $this->error($result);
            }
            $portalExamSetModel = new PortalExamSetModel();
            $portalExamSetModel->isUpdate(false)->allowField(true)->save($data['exam_set']);
            $this->success(lang("SAVE_SUCCESS"));
        }

    }
    /**
     * 修改套题
     * @adminMenu(
     *     'name'          => '添加套题',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $portalExamSetModel = new PortalExamSetModel();
        $this->assign("arrStatus", $portalExamSetModel::$STATUS);
        $examSet = $portalExamSetModel->where('id', $id)->find();
        $this->assign('examSet', $examSet);
        return $this->fetch();
    }

    /**
     * 修改套题提交
     * @adminMenu(
     *     'name'          => '添加套题提交',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function editExamSet()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            $examSet = $data['exam_set'];
            $result = $this->validate($examSet, 'PortalExamSet');
            if ($result !== true) {
                $this->error($result);
            }
            $portalExamSetModel = new PortalExamSetModel();
            $portalExamSetModel->isUpdate(true)->allowField(true)->save($data['exam_set']);
            $this->success(lang("SAVE_SUCCESS"));
        }
    }

    /**
     * 更新套题状态
     * @adminMenu(
     *     'name'          => '更新套题状态',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function upStatus()
    {
        $intId     = $this->request->param("id");
        $intStatus = $this->request->param("status");
        $intStatus = $intStatus ? 1 : 0;
        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }

        $portalExamSetModel = new PortalExamSetModel();
        $portalExamSetModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 套题排序
     * @adminMenu(
     *     'name'          => '套题排序',
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_exam_set'));
        $this->success("排序更新成功！", '');
    }
    /**
     * 删除套题
     * @adminMenu(
     *     'list_order'    => 0,
     *     'create_time'   => '',
     *     'delete_time'   => '',
     *     'status'        =>  0,
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id');
        $portalExamSetModel = new PortalExamSetModel();
        //获取删除的内容
        $findExamSet = $portalExamSetModel->field('id,name')->where('id', $id)->find();
        if (empty($findExamSet)) {
            $this->error('套题不存在!');
        }

        $examCount = Db::name('portal_examination')->where('set_id', $id)->count();

        if ($examCount > 0) {
            $this->error('此套题里有试题无法删除!');
        }

        $data   = [
            'object_id'   => $findExamSet['id'],
            'create_time' => time(),
            'table_name'  => 'portal_exam_set',
            'name'        => $findExamSet['name']
        ];
        $result = $portalExamSetModel
            ->where('id', $id)
            ->update(['delete_time' => time()]);
        if ($result) {
            Db::name('recycleBin')->insert($data);
            $this->success('删除成功!');
        } else {
            $this->error('删除失败');
        }
    }
    /**
     * 对应套题中选择试题列表对话框
     * @adminMenu(
     *     'name'   => '试题知识点选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题知识点选择对话框',
     *     'param'  => ''
     * )
     */
    public function select()
    {
        $param['set'] = $this->request->param('set_id');
        $examService = new ExaminationService();
        $data        = $examService->adminExaminationList($param);
        $data->appends($param);
        $this->assign('examinations', $data->items());
        $this->assign('page', $data->render());
        return $this->fetch();
    }
}
