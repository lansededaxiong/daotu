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
use app\portal\service\ExaminationService;
use app\portal\model\PortalExaminationModel;
use think\Db;

class ExaminationController extends HomeBaseController
{
    public function index()
    {

        $portalCategoryModel = new PortalCategoryModel();
        $examService         = new ExaminationService();

        $examId  = $this->request->param('id', 0, 'intval');
        $categoryId = $this->request->param('cid', 0, 'intval');
        $exam    = $examService->publishedExamination($examId, $categoryId);
        if (empty($examId)) {
            abort(404, '试题不存在!');
        }
        $prevExam = $examService->publishedPrevExam($examId, $categoryId);
        $nextExam = $examService->publishedNextExam($examId, $categoryId);

        $tplName = 'examination';

        if (!empty($categoryId)) {

            $category = $portalCategoryModel->where('id', $categoryId)->where('status', 1)->find();

            if (empty($category)) {
                abort(404, '试题不存在!');
            }

            $this->assign('category', $category);
        }

        Db::name('portal_examination')->where(['id' => $examId])->setInc('exam_hits');

        $this->assign('exam', $exam);
        $this->assign('prev_exam', $prevExam);
        $this->assign('next_exam', $nextExam);

        return $this->fetch("/$tplName");
    }



    public function myIndex()
    {
        //获取登录会员信息
        $user = cmf_get_current_user();
        $this->assign('user_id', $user['id']);
        return $this->fetch('user/index');
    }

}
