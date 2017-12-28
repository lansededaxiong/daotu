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

use app\portal\model\PortalExaminationModel;
use app\portal\model\PortalCategoryModel;

class ExaminationService
{

    public function adminExaminationList($filter)
    {
        return $this->adminExamList($filter);
    }

    public function adminExamList($filter)
    {

        $where = [
            'e.create_time' => ['>=', 0],
            'e.delete_time' => 0
        ];

        $join = [
            ['__USER__ u', 'e.user_id = u.id']
        ];

        $field = 'e.*,u.user_login,u.user_nickname,u.user_email';

        $category = empty($filter['category']) ? 0 : intval($filter['category']);

        if (!empty($category)) {
            $portalCategoryModel = new PortalCategoryModel();
            $categoryIds = $portalCategoryModel->where('parent_id='.$category)->column('id');
            if(empty($categoryIds)){
                $where['b.category_id'] = ['eq', $category];
            }else{
                $category = implode(',', $categoryIds);
                $where['b.category_id'] = ['in', $category];
            }
            array_push($join, [
                '__PORTAL_CATEGORY_EXAM__ b', 'e.id = b.exam_id'
            ]);
            $field = 'e.*,b.id AS exam_category_id,b.list_order,b.category_id,u.user_login,u.user_nickname,u.user_email';
        }

        $set = empty($filter['set']) ? 0 : intval($filter['set']);
        if (!empty($set)) $where['e.set_id'] = ['eq', $set];

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
            $where['e.exam_title'] = ['like', "%$keyword%"];
        }

        $portalExamModel = new PortalExaminationModel();
        $examinations        = $portalExamModel->alias('e')->field($field)
            ->join($join)
            ->where($where)
            ->order('update_time', 'DESC')
            ->paginate(10);

        return $examinations;

    }

    public function publishedExamination($examId, $categoryId = 0)
    {
        $portalExamModel = new PortalExaminationModel();

        if (empty($categoryId)) {

            $where = [
                'exam.published_time' => [['< time', time()], ['> time', 0]],
                'exam.exam_status'    => 1,
                'exam.delete_time'    => 0,
                'exam.id'             => $examId
            ];

            $examinations = $portalExamModel->alias('exam')->field('exam.*')
                ->where($where)
                ->find();
        } else {
            $where = [
                'exam.published_time'  => [['< time', time()], ['> time', 0]],
                'exam.exam_status'     => 1,
                'exam.delete_time'     => 0,
                'relation.category_id' => $categoryId,
                'relation.exam_id'     => $examId
            ];

            $join    = [
                ['__PORTAL_CATEGORY_EXAM__ relation', 'exam.id = relation.exam_id']
            ];
            $examinations = $portalExamModel->alias('exam')->field('exam.*')
                ->join($join)
                ->where($where)
                ->find();
        }
        $examinations['exam_answer'] = $portalExamModel->getExamContentAttr($examinations['exam_answer']);
        return $examinations;
    }

    //上一道试题
    public function publishedPrevExam($examId, $categoryId = 0)
    {
        $portalExamModel = new PortalExaminationModel();

        if (empty($categoryId)) {

            $where = [
                'exam.published_time' => [['< time', time()], ['> time', 0]],
                'exam.exam_status'    => 1,
                'exam.delete_time'    => 0,
                'exam.id '             => ['<',$examId]
            ];

            $exam = $portalExamModel->alias('exam')->field('exam.*')
                ->where($where)
                ->order('id', 'DESC')
                ->find();

        } else {
            $where = [
                'exam.published_time'  => [['< time', time()], ['> time', 0]],
                'exam.exam_status'     => 1,
                'exam.delete_time'     => 0,
                'relation.category_id' => $categoryId,
                'relation.exam_id'     => ['<',$examId]
            ];

            $join    = [
                ['__PORTAL_CATEGORY_EXAM__ relation', 'exam.id = relation.exam_id']
            ];
            $exam = $portalExamModel->alias('exam')->field('exam.*')
                ->join($join)
                ->where($where)
                ->order('id', 'DESC')
                ->find();
        }


        return $exam;
    }

    //下一道试题
    public function publishedNextExam($examId, $categoryId = 0)
    {
        $portalExamModel = new PortalExaminationModel();

        if (empty($categoryId)) {

            $where = [
                'exam.published_time' => [['< time', time()], ['> time', 0]],
                'exam.exam_status'    => 1,
                'exam.delete_time'    => 0,
                'exam.id '             => ['>',$examId]
            ];

            $exam = $portalExamModel->alias('exam')->field('exam.*')
                ->where($where)
                ->order('id', 'DESC')
                ->find();

        } else {
            $where = [
                'exam.published_time'  => [['< time', time()], ['> time', 0]],
                'exam.exam_status'     => 1,
                'exam.delete_time'     => 0,
                'relation.category_id' => $categoryId,
                'relation.exam_id'     => ['>',$examId]
            ];

            $join    = [
                ['__PORTAL_CATEGORY_EXAM__ relation', 'exam.id = relation.exam_id']
            ];
            $exam = $portalExamModel->alias('exam')->field('exam.*')
                ->join($join)
                ->where($where)
                ->order('id', 'DESC')
                ->find();
        }


        return $exam;

    }


}