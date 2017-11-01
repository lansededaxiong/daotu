<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\AdminBaseController;
use app\portal\model\PortalKnowledgeModel;
use think\Db;


class AdminKnowledgeController extends AdminBaseController
{
    /**
     * 试题知识点列表
     * @adminMenu(
     *     'name'   => '试题知识点管理',
     *     'parent' => 'portal/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题知识点列表',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $portalKnowledgeModel = new PortalKnowledgeModel();
        $knowledgeTree        = $portalKnowledgeModel->adminKnowledgeTableTree();

        $this->assign('knowledge_tree', $knowledgeTree);
        return $this->fetch();
    }

    /**
     * 添加试题知识点
     * @adminMenu(
     *     'name'   => '添加试题知识点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加试题知识点',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $parentId            = $this->request->param('parent', 0, 'intval');
        $portalKnowledgeModel = new PortalKnowledgeModel();
        $knowledgesTree      = $portalKnowledgeModel->adminKnowledgeTree($parentId);

        $this->assign('knowledges_tree', $knowledgesTree);
        return $this->fetch();
    }

    /**
     * 添加试题知识点提交
     * @adminMenu(
     *     'name'   => '添加试题知识点提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加试题知识点提交',
     *     'param'  => ''
     * )
     */
    public function addKnowledge()
    {
        $portalKnowledgeModel = new PortalKnowledgeModel();

        $data = $this->request->param();

        $result = $this->validate($data, 'PortalKnowledge');

        if ($result !== true) {
            $this->error($result);
        }

        $result = $portalKnowledgeModel->addKnowledge($data);

        if ($result === false) {
            $this->error('添加失败!');
        }

        $this->success('添加成功!', url('AdminKnowledge/index'));

    }

    /**
     * 编辑试题知识点
     * @adminMenu(
     *     'name'   => '编辑试题知识点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题知识点',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');
        if ($id > 0) {
            $knowledge = PortalKnowledgeModel::get($id)->toArray();

            $portalKnowledgeModel = new PortalKnowledgeModel();
            $knowledgesTree      = $portalKnowledgeModel->adminKnowledgeTree($knowledge['parent_id'], $id);

            $this->assign($knowledge);

            $this->assign('knowledges_tree', $knowledgesTree);
            return $this->fetch();
        } else {
            $this->error('操作错误!');
        }

    }

    /**
     * 编辑试题知识点提交
     * @adminMenu(
     *     'name'   => '编辑试题知识点提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题知识点提交',
     *     'param'  => ''
     * )
     */
    public function editKnowledge()
    {
        $data = $this->request->param();

        $result = $this->validate($data, 'PortalKnowledge');

        if ($result !== true) {
            $this->error($result);
        }

        $portalKnowledgeModel = new PortalKnowledgeModel();

        $result = $portalKnowledgeModel->editKnowledge($data);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
    }

    /**
     * 试题知识点选择对话框
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
        $ids                 = $this->request->param('ids');
        $selectedIds         = explode(',', $ids);
        $portalKnowledgeModel = new PortalKnowledgeModel();

        $tpl = <<<tpl
<tr class='data-item-tr'>
    <td>
        <input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]'
               value='\$id' data-name='\$name' \$checked>
    </td>
    <td>\$id</td>
    <td>\$spacer <a href='\$url' target='_blank'>\$name</a></td>
</tr>
tpl;

        $knowledgeTree = $portalKnowledgeModel->adminKnowledgeTableTree($selectedIds, $tpl);

        $where      = ['delete_time' => 0];
        $knowledges = $portalKnowledgeModel->where($where)->select();

        $this->assign('knowledges', $knowledges);
        $this->assign('selectedIds', $selectedIds);
        $this->assign('knowledge_tree', $knowledgeTree);
        return $this->fetch();
    }

    /**
     * 试题知识点排序
     * @adminMenu(
     *     'name'   => '试题知识点排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题知识点排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_knowledge'));
        $this->success("排序更新成功！", '');
    }

    /**
     * 删除试题知识点
     * @adminMenu(
     *     'name'   => '删除试题知识点',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除试题知识点',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $portalKnowledgeModel = new PortalKnowledgeModel();
        $id                  = $this->request->param('id');
        //获取删除的内容
        $findKnowledge = $portalKnowledgeModel->where('id', $id)->find();

        if (empty($findKnowledge)) {
            $this->error('分类不存在!');
        }

        $knowledgeChildrenCount = $portalKnowledgeModel->where('parent_id', $id)->count();

        if ($knowledgeChildrenCount > 0) {
            $this->error('此知识点有子类无法删除!');
        }

        $knowledgePointCount = Db::name('portal_knowledge_point')->where('knowledge_id', $id)->count();

        if ($knowledgePointCount > 0) {
            $this->error('此分类有文章无法删除!');
        }

        $data   = [
            'object_id'   => $findKnowledge['id'],
            'create_time' => time(),
            'table_name'  => 'portal_knowledge',
            'name'        => $findKnowledge['name']
        ];
        $result = $portalKnowledgeModel
            ->where('id', $id)
            ->update(['delete_time' => time()]);
        if ($result) {
            Db::name('recycleBin')->insert($data);
            $this->success('删除成功!');
        } else {
            $this->error('删除失败');
        }
    }
}
