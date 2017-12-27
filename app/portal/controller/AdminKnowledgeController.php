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

use app\portal\model\PortalClassificationModel;
use app\portal\service\KnowledgeService;
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
        $param = $this->request->param();

        $classificationId = $this->request->param('classification', 0, 'intval');

        $knowledgeService = new KnowledgeService();
        $data        = $knowledgeService->adminKnowledgeList($param);

        $data->appends($param);


        $portalClassificationModel = new PortalClassificationModel();
        $classificationTree        = $portalClassificationModel->adminKnowledgeTree($classificationId);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');

        $this->assign('classification_tree', $classificationTree);
        $this->assign('classification', $classificationId);
        $this->assign('knowledges', $data->items());
        $this->assign('page', $data->render());
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
        if ($this->request->isPost()) {
            $data = $this->request->param();
            $knowledge = $data['knowledge'];
            $result = $this->validate($knowledge, 'PortalKnowledge');
            if ($result !== true) {
                $this->error($result);
            }
            $portalKnowledgeModel = new PortalKnowledgeModel();

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['exam']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['exam']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }

            $portalKnowledgeModel->adminAddKnowledge($data['knowledge'], $data['knowledge']['classifications']);
            $this->success('添加成功!', url('AdminKnowledge/edit', ['id' => $portalKnowledgeModel->id]));
        }
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
            $portalKnowledgeModel = new PortalKnowledgeModel();
            $knowledge = $portalKnowledgeModel->where('id', $id)->find();


            $knowledgeClassifications  = $knowledge->classifications()->alias('e')->column('e.name', 'e.id');
            $knowledgeClassificationIds = implode(',', array_keys($knowledgeClassifications));


            $this->assign('knowledge_classifications', $knowledgeClassifications);
            $this->assign('knowledge_classification_ids', $knowledgeClassificationIds);

            $this->assign('knowledge',$knowledge);

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
        $knowledge = $data['knowledge'];
        $result = $this->validate($knowledge, 'PortalKnowledge');

        if ($result !== true) {
            $this->error($result);
        }

        $portalKnowledgeModel = new PortalKnowledgeModel();

        if (!empty($data['file_names']) && !empty($data['file_urls'])) {
            $data['exam']['more']['files'] = [];
            foreach ($data['file_urls'] as $key => $url) {
                $fileUrl = cmf_asset_relative_url($url);
                array_push($data['exam']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
            }
        }

        $result = $portalKnowledgeModel->adminEditKnowledge($data['knowledge'], $data['knowledge']['classifications']);

        if ($result === false) {
            $this->error('保存失败!');
        }

        $this->success('保存成功!');
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
