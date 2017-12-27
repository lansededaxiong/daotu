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
use app\portal\model\PortalExamSetModel;
use app\portal\model\PortalPostModel;
use app\portal\model\PortalCategoryModel;
use think\Db;

class ApiService
{
    /**
     * 功能:查询试题列表,支持分页;<br>
     *
     * */
    public static function exams($param)
    {
        $portalExaminationModel = new PortalExaminationModel();

        $where = [
            'exam.published_time' => [['> time', 0], ['<', time()]],
            'exam.exam_status'    => 1,
            'exam.delete_time'    => 0
        ];

        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $limit       = empty($param['limit']) ? 10 : $param['limit'];
        $order       = empty($param['order']) ? '' : $param['order'];
        $page        = isset($param['page']) ? $param['page'] : false;
        $categoryIds = empty($param['category_ids']) ? '' : $param['category_ids'];
        $setIds = empty($param['set_ids']) ? '' : $param['set_ids'];

        $join = [
            ['__USER__ user', 'exam.user_id = user.id'],
        ];

        if(!empty($setIds)){
            if (!is_array($setIds)) {
                $setIds = explode(',', $setIds);
            }
            if (count($setIds) == 1) {
                $where['exam.set_id'] = $setIds[0];
            } else {
                $where['exam.set_id'] = ['in', $setIds];
            }
        }

        if (!empty($categoryIds)) {

            $field = !empty($param['field']) ? $param['field'] : 'exam.*,user.user_login,user.user_nickname,user.user_email,category_exam.category_id';
            array_push($join, ['__PORTAL_CATEGORY_EXAM__ category_exam', 'exam.id = category_exam.exam_id']);

            if (!is_array($categoryIds)) {
                $categoryIds = explode(',', $categoryIds);
            }

            if (count($categoryIds) == 1) {
                $where['category_exam.category_id'] = $categoryIds[0];
            } else {
                $where['category_exam.category_id'] = ['in', $categoryIds];
            }
        } else {
            $field = !empty($param['field']) ? $param['field'] : 'exam.*,user.user_login,user.user_nickname,user.user_email,category_exam.category_id';
            array_push($join, ['__PORTAL_CATEGORY_EXAM__ category_exam', 'exam.id = category_exam.exam_id']);
        }

        $examinations = $portalExaminationModel->alias('exam')->field($field)
            ->join($join)
            ->where($where)
            ->where($paramWhere)
            ->order($order);

        $return = [];

        if (empty($page)) {
            $examinations = $examinations->limit($limit)->select();


            $return['exams'] = $examinations;
        } else {

            if (is_array($page)) {
                if (empty($page['list_rows'])) {
                    $page['list_rows'] = 10;
                }

                $examinations = $examinations->paginate($page);
            } else {
                $examinations = $examinations->paginate(intval($page));
            }


            $examinations->appends(request()->param());
            $return['exams']    = $examinations->items();
            $return['page']        = $examinations->render();
            $return['total']       = $examinations->total();
            $return['total_pages'] = $examinations->lastPage();
        }


        return $return;

    }

    /**
     * 获取指定id的试题
     * @param int $id
     * @return array|false|\PDOStatement|string|\think\Model
     */
    public static function exam($id)
    {
        $portalExamModel = new PortalExaminationModel();

        $where = [
            'published_time' => [['> time', 0], ['<', time()]],
            'exam_status'    => 1,
            'id'             => $id,
            'delete_time'    => 0
        ];

        return $portalExamModel->where($where)->find();
    }

    /**
     * 功能:查询试题章节分类列表
     *
     * */
    public static function cates($param)
    {
        $portalCategoryModel = new PortalCategoryModel();

        $where = [
            'cate.delete_time'    => 0
        ];
        $paramWhere = empty($param['where']) ? '' : $param['where'];
        $limit       = empty($param['limit']) ? 10 : $param['limit'];
        $order       = empty($param['order']) ? '' : $param['order'];
        $field = !empty($param['field']) ? $param['field'] : 'cate.id,cate.name';
        $examCategorys = $portalCategoryModel->alias('cate')->field($field)
            ->where($where)
            ->where($paramWhere)
            ->order($order);
        $return = [];
        $examCategorys = $examCategorys->limit($limit)->select();
        $return['cates'] = $examCategorys;
        return $return;
    }
    /**
     * 功能:查询试题套题列表
     *
     * */
    public static function sets($param)
    {
        $portalExamSetModel = new PortalExamSetModel();

        $where = [
            'set.delete_time'    => 0
        ];
        $paramWhere = empty($param['where']) ? '' : $param['where'];
        $limit       = empty($param['limit']) ? 10 : $param['limit'];
        $order       = empty($param['order']) ? '' : $param['order'];
        $field = !empty($param['field']) ? $param['field'] : 'set.id,set.name';
        $examSets = $portalExamSetModel->alias('set')->field($field)
            ->where($where)
            ->where($paramWhere)
            ->order($order);
        $return = [];
        $examSets = $examSets->limit($limit)->select();
        $return['sets'] = $examSets;
        return $return;
    }

    /**
     * 返回指定分类
     * @param int $id 分类id
     * @return array 返回符合条件的分类
     */
    public static function category($id)
    {
        $portalCategoryModel = new PortalCategoryModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
            'id'          => $id
        ];

        return $portalCategoryModel->where($where)->find();
    }

    /**
     * 返回指定分类下的子分类
     * @param int $categoryId 分类id
     * @return false|\PDOStatement|string|\think\Collection 返回指定分类下的子分类
     */
    public static function subCategories($categoryId)
    {
        $portalCategoryModel = new PortalCategoryModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
            'parent_id'   => $categoryId
        ];

        return $portalCategoryModel->where($where)->select();
    }

    /**
     * 返回指定分类下的所有子分类
     * @param int $categoryId 分类id
     * @return array 返回指定分类下的所有子分类
     */
    public static function allSubCategories($categoryId)
    {
        $portalCategoryModel = new PortalCategoryModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
            'path'        => ['like', "%$categoryId%"]
        ];

        return $portalCategoryModel->where($where)->select();
    }

    /**
     * 返回符合条件的所有分类
     * @param array $param 查询参数<pre>
     * array(
     *  'where'=>'',
     *  'order'=>'',
     * )</pre>
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function categories($param)
    {
        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $order = empty($param['order']) ? '' : $param['order'];

        $portalCategoryModel = new PortalCategoryModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
        ];

        return $portalCategoryModel
            ->where($where)
            ->where($paramWhere)
            ->order($order)
            ->select();
    }

}