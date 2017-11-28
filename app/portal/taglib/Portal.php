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
namespace app\portal\taglib;

use think\template\TagLib;

class Portal extends TagLib
{
    /**
     * 定义标签列表
     */
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'exams'   => ['attr' => 'field,where,limit,order,page,returnVarName,pageVarName,categoryIds', 'close' => 1],//非必须属性item
        'cates'   => ['attr' => 'field,where,limit,order,returnVarName,pageVarName', 'close' => 1],//非必须属性item
        'sets'    => ['attr' => 'field,where,limit,order,returnVarName,pageVarName', 'close' => 1],//非必须属性item
    ];
    /**
     * 试题列表标签
     */
    public function tagExams($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $field         = empty($tag['field']) ? '' : $tag['field'];
        $limit         = empty($tag['limit']) ? '10' : $tag['limit'];
        $order         = empty($tag['order']) ? 'exam.published_time DESC' : $tag['order'];
        $pageVarName   = empty($tag['pageVarName']) ? '__PAGE_VAR_NAME__' : $tag['pageVarName'];
        $returnVarName = empty($tag['returnVarName']) ? 'exams_data' : $tag['returnVarName'];

        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $page = "''";
        if (!empty($tag['page'])) {
            if (strpos($tag['page'], '$') === 0) {
                $page = $tag['page'];
            } else {
                $page = intval($tag['page']);
                $page = "'{$page}'";
            }
        }

        $categoryIds = "''";
        if (!empty($tag['categoryIds'])) {
            if (strpos($tag['categoryIds'], '$') === 0) {
                $categoryIds = $tag['categoryIds'];
                $this->autoBuildVar($categoryIds);
            } else {
                $categoryIds = "'{$tag['categoryIds']}'";
            }
        }
        $setIds = "''";
        if (!empty($tag['setIds'])) {
            if (strpos($tag['setIds'], '$') === 0) {
                $setIds = $tag['setIds'];
                $this->autoBuildVar($setIds);
            } else {
                $setIds = "'{$tag['setIds']}'";
            }
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\portal\service\ApiService::exams([
    'field'   => '{$field}',
    'where'   => {$where},
    'limit'   => '{$limit}',
    'order'   => '{$order}',
    'page'    => $page,
    'category_ids'=>{$categoryIds},
    'set_ids' => {$setIds}
]);

\${$pageVarName} = isset(\${$returnVarName}['page'])?\${$returnVarName}['page']:'';

 ?>
<volist name="{$returnVarName}.exams" id="{$item}" key="k">
{$content}
</volist>
parse;
        return $parse;
    }

    /**
     * 试题章节分类列表标签
     */
    public function tagCates($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $field         = empty($tag['field']) ? '' : $tag['field'];
        $limit         = empty($tag['limit']) ? '10' : $tag['limit'];
        $order         = empty($tag['order']) ? 'cate.list_order ASC' : $tag['order'];
        $pageVarName   = empty($tag['pageVarName']) ? '__PAGE_VAR_NAME__' : $tag['pageVarName'];
        $returnVarName = empty($tag['returnVarName']) ? 'cates_data' : $tag['returnVarName'];

        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\portal\service\ApiService::cates([
    'field'   => '{$field}',
    'where'   => {$where},
    'limit'   => '{$limit}',
    'order'   => '{$order}',
]);

\${$pageVarName} = isset(\${$returnVarName}['page'])?\${$returnVarName}['page']:'';

 ?>
<volist name="{$returnVarName}.cates" id="{$item}" key="k">
{$content}
</volist>
parse;
        return $parse;
    }
    /**
     * 试题套题列表标签
     */
    public function tagSets($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $field         = empty($tag['field']) ? '' : $tag['field'];
        $limit         = empty($tag['limit']) ? '10' : $tag['limit'];
        $order         = empty($tag['order']) ? 'set.list_order ASC' : $tag['order'];
        $pageVarName   = empty($tag['pageVarName']) ? '__PAGE_VAR_NAME__' : $tag['pageVarName'];
        $returnVarName = empty($tag['returnVarName']) ? 'sets_data' : $tag['returnVarName'];

        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\portal\service\ApiService::sets([
    'field'   => '{$field}',
    'where'   => {$where},
    'limit'   => '{$limit}',
    'order'   => '{$order}',
]);

\${$pageVarName} = isset(\${$returnVarName}['page'])?\${$returnVarName}['page']:'';

 ?>
<volist name="{$returnVarName}.sets" id="{$item}" key="k">
{$content}
</volist>
parse;
        return $parse;
    }

}