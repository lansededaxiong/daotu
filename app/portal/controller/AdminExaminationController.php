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
use app\portal\model\PortalExaminationModel;
use app\portal\service\ExaminationService;
use app\portal\model\PortalCategoryModel;
use think\Db;

class AdminExaminationController extends AdminBaseController
{
    /**
     * 试题列表
     * @adminMenu(
     *     'name'   => '试题管理',
     *     'parent' => 'portal/AdminIndex/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题列表',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $param = $this->request->param();

        $categoryId = $this->request->param('category', 0, 'intval');

        $examService = new ExaminationService();
        $data        = $examService->adminExaminationList($param);

        $data->appends($param);

        $portalCategoryModel = new PortalCategoryModel();
        $categoryTree        = $portalCategoryModel->adminCategoryTree($categoryId);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('examinations', $data->items());
        $this->assign('category_tree', $categoryTree);
        $this->assign('category', $categoryId);
        $this->assign('page', $data->render());

        return $this->fetch();
    }

    /**
     * 添加试题
     * @adminMenu(
     *     'name'   => '添加试题',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加试题',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 添加试题提交
     * @adminMenu(
     *     'name'   => '添加试题提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章提交',
     *     'param'  => ''
     * )
     */
    public function addExam()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $exam   = $data['exam'];

            $result = $this->validate($exam, 'PortalExamination');
            if ($result !== true) {
                $this->error($result);
            }

            $portalExaminationModel = new PortalExaminationModel();

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['exam']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['exam']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }

            $portalExaminationModel->adminAddExam($data['exam'], $data['exam']['categories'],$data['exam_points']);

            $this->success('添加成功!', url('AdminExamination/edit', ['id' => $portalExaminationModel->id]));
        }

    }

    /**
     * 编辑试题
     * @adminMenu(
     *     'name'   => '编辑试题',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');

        $portalExaminationModel = new PortalExaminationModel();
        $exam            = $portalExaminationModel->where('id', $id)->find();
        $examCategories  = $exam->categories()->alias('e')->column('e.name', 'e.id');
        $examCategoryIds = implode(',', array_keys($examCategories));

        $this->assign('exam', $exam);
        $this->assign('post_categories', $examCategories);
        $this->assign('post_category_ids', $examCategoryIds);

        return $this->fetch();
    }

    /**
     * 编辑试题提交
     * @adminMenu(
     *     'name'   => '编辑试题提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑试题提交',
     *     'param'  => ''
     * )
     */
    public function editExam()
    {

        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $exam   = $data['exam'];

            $result = $this->validate($exam, 'PortalExamination');
            if ($result !== true) {
                $this->error($result);
            }

            $portalExaminationModel = new PortalExaminationModel();

            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
                $data['exam']['more']['files'] = [];
                foreach ($data['file_urls'] as $key => $url) {
                    $fileUrl = cmf_asset_relative_url($url);
                    array_push($data['exam']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
                }
            }
            $portalExaminationModel->adminEditExam($data['exam'], $data['exam']['categories'],$data['exam_points']);

            $this->success('保存成功!');

        }
    }

    /**
     * 试题删除
     * @adminMenu(
     *     'name'   => '试题删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $param           = $this->request->param();
        $portalExaminationModel = new PortalExaminationModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalExaminationModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'portal_examination',
                'name'        => $result['exam_title']
            ];
            $resultPortal = $portalExaminationModel
                ->where(['id' => $id])
                ->update(['delete_time' => time()]);
            if ($resultPortal) {
                Db::name('recycleBin')->insert($data);
            }
            $this->success("删除成功！", '');

        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $recycle = $portalExaminationModel->where(['id' => ['in', $ids]])->select();
            $result  = $portalExaminationModel->where(['id' => ['in', $ids]])->update(['delete_time' => time()]);
            if ($result) {
                foreach ($recycle as $value) {
                    $data = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'portal_examination',
                        'name'        => $value['exam_title']
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }

    /**
     * 试题发布
     * @adminMenu(
     *     'name'   => '试题发布',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题发布',
     *     'param'  => ''
     * )
     */
    public function publish()
    {
        $param           = $this->request->param();
        $portalExaminationModel = new PortalExaminationModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['exam_status' => 1, 'published_time' => time()]);

            $this->success("发布成功！", '');
        }

        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['exam_status' => 0]);

            $this->success("取消发布成功！", '');
        }

    }

    /**
     * 试题置顶
     * @adminMenu(
     *     'name'   => '试题置顶',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题置顶',
     *     'param'  => ''
     * )
     */
    public function top()
    {
        $param           = $this->request->param();
        $portalExaminationModel = new PortalExaminationModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['is_top' => 1]);

            $this->success("置顶成功！", '');

        }

        if (isset($_POST['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['is_top' => 0]);

            $this->success("取消置顶成功！", '');
        }
    }

    /**
     * 试题推荐
     * @adminMenu(
     *     'name'   => '试题推荐',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题推荐',
     *     'param'  => ''
     * )
     */
    public function recommend()
    {
        $param           = $this->request->param();
        $portalExaminationModel = new PortalExaminationModel();

        if (isset($param['ids']) && isset($param["yes"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['recommended' => 1]);

            $this->success("推荐成功！", '');

        }
        if (isset($param['ids']) && isset($param["no"])) {
            $ids = $this->request->param('ids/a');

            $portalExaminationModel->where(['id' => ['in', $ids]])->update(['recommended' => 0]);

            $this->success("取消推荐成功！", '');

        }
    }

    /**
     * 试题排序
     * @adminMenu(
     *     'name'   => '试题排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '试题排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('portal_category_exam'));
        $this->success("排序更新成功！", '');
    }


}
