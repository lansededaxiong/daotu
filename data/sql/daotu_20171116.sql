-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.16 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 daotu 的数据库结构
CREATE DATABASE IF NOT EXISTS `daotu` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `daotu`;


-- 导出  表 daotu.dd_admin_menu 结构
CREATE TABLE IF NOT EXISTS `dd_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float unsigned NOT NULL DEFAULT '10000' COMMENT '排序ID',
  `app` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- 正在导出表  daotu.dd_admin_menu 的数据：~157 rows (大约)
/*!40000 ALTER TABLE `dd_admin_menu` DISABLE KEYS */;
REPLACE INTO `dd_admin_menu` (`id`, `parent_id`, `type`, `status`, `list_order`, `app`, `controller`, `action`, `param`, `name`, `icon`, `remark`) VALUES
	(1, 0, 0, 1, 20, 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理'),
	(2, 1, 1, 1, 10000, 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理'),
	(3, 2, 1, 0, 10000, 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理'),
	(4, 2, 2, 0, 10000, 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序'),
	(5, 0, 0, 1, 0, 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口'),
	(6, 5, 1, 1, 50, 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理'),
	(7, 6, 1, 0, 10000, 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接'),
	(8, 6, 2, 0, 10000, 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存'),
	(9, 6, 1, 0, 10000, 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接'),
	(10, 6, 2, 0, 10000, 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存'),
	(11, 6, 2, 0, 10000, 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接'),
	(12, 6, 2, 0, 10000, 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序'),
	(13, 6, 2, 0, 10000, 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏'),
	(14, 5, 1, 1, 10, 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置'),
	(15, 14, 2, 0, 10000, 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存'),
	(16, 14, 1, 0, 10000, 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板'),
	(17, 14, 2, 0, 10000, 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交'),
	(18, 14, 1, 0, 10000, 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试'),
	(19, 5, 1, 0, 10000, 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理'),
	(20, 19, 1, 0, 10000, 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表'),
	(21, 19, 1, 0, 10000, 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加'),
	(22, 19, 2, 0, 10000, 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存'),
	(23, 19, 1, 0, 10000, 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑'),
	(24, 19, 2, 0, 10000, 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存'),
	(25, 19, 2, 0, 10000, 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除'),
	(26, 19, 2, 0, 10000, 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序'),
	(27, 19, 1, 0, 10000, 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单'),
	(28, 5, 1, 1, 30, 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理'),
	(29, 28, 1, 0, 10000, 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航'),
	(30, 28, 2, 0, 10000, 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存'),
	(31, 28, 1, 0, 10000, 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航'),
	(32, 28, 2, 0, 10000, 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存'),
	(33, 28, 2, 0, 10000, 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航'),
	(34, 28, 1, 0, 10000, 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单'),
	(35, 34, 1, 0, 10000, 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单'),
	(36, 34, 2, 0, 10000, 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存'),
	(37, 34, 1, 0, 10000, 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单'),
	(38, 34, 2, 0, 10000, 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存'),
	(39, 34, 2, 0, 10000, 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单'),
	(40, 34, 2, 0, 10000, 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序'),
	(41, 1, 1, 1, 10000, 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表'),
	(42, 41, 2, 0, 10000, 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用'),
	(43, 41, 1, 0, 10000, 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置'),
	(44, 41, 2, 0, 10000, 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交'),
	(45, 41, 2, 0, 10000, 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装'),
	(46, 41, 2, 0, 10000, 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新'),
	(47, 41, 2, 0, 10000, 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件'),
	(48, 108, 0, 1, 10000, 'admin', 'User', 'default', '', '管理组', '', '管理组'),
	(49, 48, 1, 1, 10000, 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理'),
	(50, 49, 1, 0, 10000, 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色'),
	(51, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交'),
	(52, 49, 1, 0, 10000, 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色'),
	(53, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交'),
	(54, 49, 2, 0, 10000, 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色'),
	(55, 49, 1, 0, 10000, 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限'),
	(56, 49, 2, 0, 10000, 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交'),
	(57, 0, 1, 0, 10000, 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站'),
	(58, 57, 2, 0, 10000, 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原'),
	(59, 57, 2, 0, 10000, 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除'),
	(60, 5, 1, 1, 10000, 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理'),
	(61, 60, 1, 0, 10000, 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则'),
	(62, 60, 2, 0, 10000, 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交'),
	(63, 60, 1, 0, 10000, 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑'),
	(64, 60, 2, 0, 10000, 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交'),
	(65, 60, 2, 0, 10000, 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除'),
	(66, 60, 2, 0, 10000, 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用'),
	(67, 60, 2, 0, 10000, 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用'),
	(68, 60, 2, 0, 10000, 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序'),
	(69, 60, 1, 0, 10000, 'admin', 'Route', 'select', '', '选择URL', '', '选择URL'),
	(70, 5, 1, 1, 0, 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息'),
	(71, 70, 2, 0, 10000, 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交'),
	(72, 5, 1, 0, 10000, 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改'),
	(73, 72, 2, 0, 10000, 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交'),
	(74, 5, 1, 1, 10000, 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置'),
	(75, 74, 2, 0, 10000, 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交'),
	(76, 5, 1, 0, 10000, 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存'),
	(77, 5, 1, 1, 40, 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理'),
	(78, 77, 1, 0, 10000, 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片'),
	(79, 77, 2, 0, 10000, 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交'),
	(80, 77, 1, 0, 10000, 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片'),
	(81, 77, 2, 0, 10000, 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交'),
	(82, 77, 2, 0, 10000, 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片'),
	(83, 77, 1, 0, 10000, 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表'),
	(84, 83, 1, 0, 10000, 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加'),
	(85, 83, 2, 0, 10000, 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交'),
	(86, 83, 1, 0, 10000, 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑'),
	(87, 83, 2, 0, 10000, 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交'),
	(88, 83, 2, 0, 10000, 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除'),
	(89, 83, 2, 0, 10000, 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏'),
	(90, 83, 2, 0, 10000, 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示'),
	(91, 83, 2, 0, 10000, 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序'),
	(92, 5, 1, 1, 10000, 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储'),
	(93, 92, 2, 0, 10000, 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交'),
	(94, 5, 1, 1, 20, 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理'),
	(95, 94, 1, 0, 10000, 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板'),
	(96, 94, 2, 0, 10000, 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板'),
	(97, 94, 2, 0, 10000, 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装'),
	(98, 94, 2, 0, 10000, 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新'),
	(99, 94, 2, 0, 10000, 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板'),
	(100, 94, 1, 0, 10000, 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板'),
	(101, 94, 1, 0, 10000, 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置'),
	(102, 94, 1, 0, 10000, 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表'),
	(103, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑'),
	(104, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存'),
	(105, 94, 2, 0, 10000, 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除'),
	(106, 94, 2, 0, 10000, 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存'),
	(107, 94, 1, 0, 10000, 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源'),
	(108, 0, 0, 1, 10, 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理'),
	(109, 48, 1, 1, 10000, 'admin', 'User', 'index', '', '管理员', '', '管理员管理'),
	(110, 109, 1, 0, 10000, 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加'),
	(111, 109, 2, 0, 10000, 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交'),
	(112, 109, 1, 0, 10000, 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑'),
	(113, 109, 2, 0, 10000, 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交'),
	(114, 109, 1, 0, 10000, 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改'),
	(115, 109, 2, 0, 10000, 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交'),
	(116, 109, 2, 0, 10000, 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除'),
	(117, 109, 2, 0, 10000, 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员'),
	(118, 109, 2, 0, 10000, 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员'),
	(119, 0, 0, 1, 30, 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理'),
	(120, 119, 1, 1, 10000, 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表'),
	(121, 120, 1, 0, 10000, 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章'),
	(122, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交'),
	(123, 120, 1, 0, 10000, 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章'),
	(124, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交'),
	(125, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除'),
	(126, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布'),
	(127, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶'),
	(128, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐'),
	(129, 120, 2, 0, 10000, 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序'),
	(130, 119, 1, 1, 10000, 'portal', 'AdminCategory', 'index', '', '章节管理', '', '文章分类列表'),
	(131, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类'),
	(132, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交'),
	(133, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类'),
	(134, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交'),
	(135, 130, 1, 0, 10000, 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框'),
	(136, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序'),
	(137, 130, 2, 0, 10000, 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类'),
	(138, 119, 1, 0, 10000, 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理'),
	(139, 138, 1, 0, 10000, 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面'),
	(140, 138, 2, 0, 10000, 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交'),
	(141, 138, 1, 0, 10000, 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面'),
	(142, 138, 2, 0, 10000, 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交'),
	(143, 138, 2, 0, 10000, 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面'),
	(144, 119, 1, 1, 10000, 'portal', 'AdminTag', 'index', '', '标签管理', '', '标签管理'),
	(145, 144, 1, 0, 10000, 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签'),
	(146, 144, 2, 0, 10000, 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交'),
	(147, 144, 2, 0, 10000, 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态'),
	(148, 144, 2, 0, 10000, 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签'),
	(149, 0, 1, 0, 10000, 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表'),
	(150, 149, 2, 0, 10000, 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件'),
	(151, 108, 0, 1, 10000, 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组'),
	(152, 151, 1, 1, 10000, 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户'),
	(153, 152, 2, 0, 10000, 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑'),
	(154, 152, 2, 0, 10000, 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用'),
	(155, 151, 1, 1, 10000, 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户'),
	(156, 155, 2, 0, 10000, 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定'),
	(157, 119, 1, 1, 10000, 'Portal', 'AdminExamination', 'index', '', '试题管理', '', ''),
	(158, 119, 1, 1, 10000, 'Portal', 'AdminKnowledge', 'index', '', '知识库管理', '', ''),
	(159, 119, 1, 1, 10000, 'Portal', 'AdminExamSet', 'index', '', '套题管理', '', '');
/*!40000 ALTER TABLE `dd_admin_menu` ENABLE KEYS */;


-- 导出  表 daotu.dd_asset 结构
CREATE TABLE IF NOT EXISTS `dd_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- 正在导出表  daotu.dd_asset 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_asset` DISABLE KEYS */;
REPLACE INTO `dd_asset` (`id`, `user_id`, `file_size`, `create_time`, `status`, `download_times`, `file_key`, `filename`, `file_path`, `file_md5`, `file_sha1`, `suffix`, `more`) VALUES
	(1, 1, 8044, 1509447438, 1, 0, '8283b406d69608f05eda02354a221d576678b6b42642713e9144d2fc19a5b906', 'z4ee.jpg', 'portal/20171031/64b34844e0ff0e02bab21dc320537fce.jpg', '8283b406d69608f05eda02354a221d57', '2530b28699b9f0878c8554ad69e884fe100c76ab', 'jpg', NULL);
/*!40000 ALTER TABLE `dd_asset` ENABLE KEYS */;


-- 导出  表 daotu.dd_auth_access 结构
CREATE TABLE IF NOT EXISTS `dd_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- 正在导出表  daotu.dd_auth_access 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_auth_access` ENABLE KEYS */;


-- 导出  表 daotu.dd_auth_rule 结构
CREATE TABLE IF NOT EXISTS `dd_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- 正在导出表  daotu.dd_auth_rule 的数据：~157 rows (大约)
/*!40000 ALTER TABLE `dd_auth_rule` DISABLE KEYS */;
REPLACE INTO `dd_auth_rule` (`id`, `status`, `app`, `type`, `name`, `param`, `title`, `condition`) VALUES
	(1, 1, 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', ''),
	(2, 1, 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', ''),
	(3, 1, 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', ''),
	(4, 1, 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', ''),
	(5, 1, 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', ''),
	(6, 1, 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', ''),
	(7, 1, 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', ''),
	(8, 1, 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', ''),
	(9, 1, 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', ''),
	(10, 1, 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', ''),
	(11, 1, 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', ''),
	(12, 1, 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', ''),
	(13, 1, 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', ''),
	(14, 1, 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', ''),
	(15, 1, 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', ''),
	(16, 1, 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', ''),
	(17, 1, 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', ''),
	(18, 1, 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', ''),
	(19, 1, 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', ''),
	(20, 1, 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', ''),
	(21, 1, 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', ''),
	(22, 1, 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', ''),
	(23, 1, 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', ''),
	(24, 1, 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', ''),
	(25, 1, 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', ''),
	(26, 1, 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', ''),
	(27, 1, 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', ''),
	(28, 1, 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', ''),
	(29, 1, 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', ''),
	(30, 1, 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', ''),
	(31, 1, 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', ''),
	(32, 1, 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', ''),
	(33, 1, 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', ''),
	(34, 1, 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', ''),
	(35, 1, 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', ''),
	(36, 1, 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', ''),
	(37, 1, 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', ''),
	(38, 1, 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', ''),
	(39, 1, 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', ''),
	(40, 1, 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', ''),
	(41, 1, 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', ''),
	(42, 1, 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', ''),
	(43, 1, 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', ''),
	(44, 1, 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', ''),
	(45, 1, 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', ''),
	(46, 1, 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', ''),
	(47, 1, 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', ''),
	(48, 1, 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', ''),
	(49, 1, 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', ''),
	(50, 1, 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', ''),
	(51, 1, 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', ''),
	(52, 1, 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', ''),
	(53, 1, 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', ''),
	(54, 1, 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', ''),
	(55, 1, 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', ''),
	(56, 1, 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', ''),
	(57, 1, 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', ''),
	(58, 1, 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', ''),
	(59, 1, 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', ''),
	(60, 1, 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', ''),
	(61, 1, 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', ''),
	(62, 1, 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', ''),
	(63, 1, 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', ''),
	(64, 1, 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', ''),
	(65, 1, 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', ''),
	(66, 1, 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', ''),
	(67, 1, 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', ''),
	(68, 1, 'admin', 'admin_url', 'admin/Setting/default', '', '设置', ''),
	(69, 1, 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', ''),
	(70, 1, 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', ''),
	(71, 1, 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', ''),
	(72, 1, 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', ''),
	(73, 1, 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', ''),
	(74, 1, 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', ''),
	(75, 1, 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', ''),
	(76, 1, 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', ''),
	(77, 1, 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', ''),
	(78, 1, 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', ''),
	(79, 1, 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', ''),
	(80, 1, 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', ''),
	(81, 1, 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', ''),
	(82, 1, 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', ''),
	(83, 1, 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', ''),
	(84, 1, 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', ''),
	(85, 1, 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', ''),
	(86, 1, 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', ''),
	(87, 1, 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', ''),
	(88, 1, 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', ''),
	(89, 1, 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', ''),
	(90, 1, 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', ''),
	(91, 1, 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', ''),
	(92, 1, 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', ''),
	(93, 1, 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', ''),
	(94, 1, 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', ''),
	(95, 1, 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', ''),
	(96, 1, 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', ''),
	(97, 1, 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', ''),
	(98, 1, 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', ''),
	(99, 1, 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', ''),
	(100, 1, 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', ''),
	(101, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', ''),
	(102, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', ''),
	(103, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', ''),
	(104, 1, 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', ''),
	(105, 1, 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', ''),
	(106, 1, 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', ''),
	(107, 1, 'admin', 'admin_url', 'admin/User/default', '', '管理组', ''),
	(108, 1, 'admin', 'admin_url', 'admin/User/index', '', '管理员', ''),
	(109, 1, 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', ''),
	(110, 1, 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', ''),
	(111, 1, 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', ''),
	(112, 1, 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', ''),
	(113, 1, 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', ''),
	(114, 1, 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', ''),
	(115, 1, 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', ''),
	(116, 1, 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', ''),
	(117, 1, 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', ''),
	(118, 1, 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', ''),
	(119, 1, 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', ''),
	(120, 1, 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', ''),
	(121, 1, 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', ''),
	(122, 1, 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', ''),
	(123, 1, 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', ''),
	(124, 1, 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', ''),
	(125, 1, 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', ''),
	(126, 1, 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', ''),
	(127, 1, 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', ''),
	(128, 1, 'portal', 'admin_url', 'portal/AdminCategory/index', '', '章节管理', ''),
	(129, 1, 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', ''),
	(130, 1, 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', ''),
	(131, 1, 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', ''),
	(132, 1, 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', ''),
	(133, 1, 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', ''),
	(134, 1, 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', ''),
	(135, 1, 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', ''),
	(136, 1, 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', ''),
	(137, 1, 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', ''),
	(138, 1, 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', ''),
	(139, 1, 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', ''),
	(140, 1, 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', ''),
	(141, 1, 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', ''),
	(142, 1, 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', ''),
	(143, 1, 'portal', 'admin_url', 'portal/AdminTag/index', '', '标签管理', ''),
	(144, 1, 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', ''),
	(145, 1, 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', ''),
	(146, 1, 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', ''),
	(147, 1, 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', ''),
	(148, 1, 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', ''),
	(149, 1, 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', ''),
	(150, 1, 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', ''),
	(151, 1, 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', ''),
	(152, 1, 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', ''),
	(153, 1, 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', ''),
	(154, 1, 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', ''),
	(155, 1, 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', ''),
	(156, 1, 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', ''),
	(157, 1, 'Portal', 'admin_url', 'Portal/AdminExamination/index', '', '试题管理', ''),
	(158, 1, 'Portal', 'admin_url', 'Portal/AdminKnowledge/index', '', '知识库管理', ''),
	(159, 1, 'Portal', 'admin_url', 'Portal/AdminPoint/index', '', '公式管理', ''),
	(160, 1, 'Portal', 'admin_url', 'Portal/AdminExamSet/index', '', '套题管理', '');
/*!40000 ALTER TABLE `dd_auth_rule` ENABLE KEYS */;


-- 导出  表 daotu.dd_comment 结构
CREATE TABLE IF NOT EXISTS `dd_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- 正在导出表  daotu.dd_comment 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_comment` ENABLE KEYS */;


-- 导出  表 daotu.dd_hook 结构
CREATE TABLE IF NOT EXISTS `dd_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- 正在导出表  daotu.dd_hook 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `dd_hook` DISABLE KEYS */;
REPLACE INTO `dd_hook` (`id`, `type`, `once`, `name`, `hook`, `app`, `description`) VALUES
	(1, 1, 0, '应用初始化', 'app_init', 'cmf', '应用初始化'),
	(2, 1, 0, '应用开始', 'app_begin', 'cmf', '应用开始'),
	(3, 1, 0, '模块初始化', 'module_init', 'cmf', '模块初始化'),
	(4, 1, 0, '控制器开始', 'action_begin', 'cmf', '控制器开始'),
	(5, 1, 0, '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤'),
	(6, 1, 0, '应用结束', 'app_end', 'cmf', '应用结束'),
	(7, 1, 0, '日志write方法', 'log_write', 'cmf', '日志write方法'),
	(8, 1, 0, '输出结束', 'response_end', 'cmf', '输出结束'),
	(9, 1, 0, '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化'),
	(10, 1, 0, '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化'),
	(11, 1, 1, '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码'),
	(12, 3, 0, '模板 body标签开始', 'body_start', '', '模板 body标签开始'),
	(13, 3, 0, '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前'),
	(14, 3, 0, '模板底部开始', 'footer_start', '', '模板底部开始'),
	(15, 3, 0, '模板底部开始之前', 'before_footer', '', '模板底部开始之前'),
	(16, 3, 0, '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前'),
	(17, 3, 0, '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前'),
	(18, 3, 0, '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始'),
	(19, 3, 0, '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前'),
	(20, 3, 0, '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始'),
	(21, 3, 0, '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前'),
	(22, 3, 1, '评论区', 'comment', '', '评论区'),
	(23, 3, 1, '留言区', 'guestbook', '', '留言区'),
	(24, 2, 0, '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘'),
	(25, 4, 0, '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前'),
	(26, 4, 0, '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前'),
	(27, 2, 0, '后台登录页面', 'admin_login', 'admin', '后台登录页面'),
	(28, 1, 1, '前台模板切换', 'switch_theme', 'cmf', '前台模板切换'),
	(29, 1, 1, '登录逻辑开始之前', 'user_login_start', 'cmf', '登录逻辑开始之前');
/*!40000 ALTER TABLE `dd_hook` ENABLE KEYS */;


-- 导出  表 daotu.dd_hook_plugin 结构
CREATE TABLE IF NOT EXISTS `dd_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- 正在导出表  daotu.dd_hook_plugin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_hook_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_hook_plugin` ENABLE KEYS */;


-- 导出  表 daotu.dd_link 结构
CREATE TABLE IF NOT EXISTS `dd_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- 正在导出表  daotu.dd_link 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_link` DISABLE KEYS */;
REPLACE INTO `dd_link` (`id`, `status`, `rating`, `list_order`, `description`, `url`, `name`, `image`, `target`, `rel`) VALUES
	(1, 1, 1, 8, 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');
/*!40000 ALTER TABLE `dd_link` ENABLE KEYS */;


-- 导出  表 daotu.dd_nav 结构
CREATE TABLE IF NOT EXISTS `dd_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- 正在导出表  daotu.dd_nav 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `dd_nav` DISABLE KEYS */;
REPLACE INTO `dd_nav` (`id`, `is_main`, `name`, `remark`) VALUES
	(1, 1, '主导航', '主导航'),
	(2, 0, '底部导航', '');
/*!40000 ALTER TABLE `dd_nav` ENABLE KEYS */;


-- 导出  表 daotu.dd_nav_menu 结构
CREATE TABLE IF NOT EXISTS `dd_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- 正在导出表  daotu.dd_nav_menu 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_nav_menu` DISABLE KEYS */;
REPLACE INTO `dd_nav_menu` (`id`, `nav_id`, `parent_id`, `status`, `list_order`, `name`, `target`, `href`, `icon`, `path`) VALUES
	(1, 1, 0, 1, 0, '首页', '', 'home', '', '0-1');
/*!40000 ALTER TABLE `dd_nav_menu` ENABLE KEYS */;


-- 导出  表 daotu.dd_option 结构
CREATE TABLE IF NOT EXISTS `dd_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- 正在导出表  daotu.dd_option 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_option` DISABLE KEYS */;
REPLACE INTO `dd_option` (`id`, `autoload`, `option_name`, `option_value`) VALUES
	(7, 1, 'site_info', '{"site_name":"\\u8bd5\\u9898\\u5bfc\\u56fe\\u7cfb\\u7edf","site_seo_title":"\\u8bd5\\u9898\\u5bfc\\u56fe\\u7cfb\\u7edf","site_seo_keywords":"\\u6570\\u5b66\\u8bd5\\u9898 \\u5bfc\\u56fe","site_seo_description":"\\u5173\\u4e8e\\u8bd5\\u9898\\u7684\\u5bfc\\u56fe\\u7cfb\\u7edf"}');
/*!40000 ALTER TABLE `dd_option` ENABLE KEYS */;


-- 导出  表 daotu.dd_plugin 结构
CREATE TABLE IF NOT EXISTS `dd_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- 正在导出表  daotu.dd_plugin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_plugin` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_category 结构
CREATE TABLE IF NOT EXISTS `dd_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:有效,0:无效',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '知识点名称',
  `description` text NOT NULL COMMENT '知识点描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `more` varchar(150) DEFAULT NULL COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 试题知识点表';

-- 正在导出表  daotu.dd_portal_category 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `dd_portal_category` DISABLE KEYS */;
REPLACE INTO `dd_portal_category` (`id`, `parent_id`, `status`, `delete_time`, `list_order`, `name`, `description`, `path`, `more`) VALUES
	(1, 0, 1, 0, 0, '第一章', '题库第一章', '0-1', '{"thumbnail":""}'),
	(2, 1, 1, 0, 0, '第一节', '试题的第一章的第一节', '0-1-2', '{"thumbnail":""}');
/*!40000 ALTER TABLE `dd_portal_category` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_category_exam 结构
CREATE TABLE IF NOT EXISTS `dd_portal_category_exam` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '试题id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='portal应用 知识点试题对应表';

-- 正在导出表  daotu.dd_portal_category_exam 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `dd_portal_category_exam` DISABLE KEYS */;
REPLACE INTO `dd_portal_category_exam` (`id`, `exam_id`, `category_id`, `list_order`, `status`) VALUES
	(1, 1, 2, 10000, 1),
	(2, 2, 2, 0, 1),
	(3, 3, 2, 0, 1);
/*!40000 ALTER TABLE `dd_portal_category_exam` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_category_post 结构
CREATE TABLE IF NOT EXISTS `dd_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- 正在导出表  daotu.dd_portal_category_post 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_portal_category_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_portal_category_post` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_examination 结构
CREATE TABLE IF NOT EXISTS `dd_portal_examination` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `exam_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `set_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属套题id',
  `exam_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `exam_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `exam_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `exam_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '试题标题',
  `exam_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `exam_content` text COMMENT '试题内容',
  `exam_answer` text COMMENT '试题答案',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`exam_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 试题表';

-- 正在导出表  daotu.dd_portal_examination 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `dd_portal_examination` DISABLE KEYS */;
REPLACE INTO `dd_portal_examination` (`id`, `parent_id`, `exam_format`, `user_id`, `set_id`, `exam_status`, `is_top`, `recommended`, `exam_hits`, `exam_like`, `create_time`, `update_time`, `published_time`, `delete_time`, `exam_title`, `exam_keywords`, `exam_content`, `exam_answer`, `more`) VALUES
	(1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1509356848, 1509969704, 1509359040, 0, 'exam1', 'exam1', '', NULL, '{"thumbnail":"portal\\/20171031\\/64b34844e0ff0e02bab21dc320537fce.jpg","template":""}'),
	(2, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1510022780, 1510022780, 1510022690, 0, 'exam3', 'key1', '', NULL, '{"thumbnail":"","template":""}'),
	(3, 0, 1, 1, 6, 1, 0, 0, 0, 0, 1510022946, 1510818747, 1510022880, 0, 'exam2', 'key2', '已知&lt;span class=&quot;MathJax_Preview&quot; style=&quot;color: inherit; display: none;&quot;&gt;&lt;/span&gt;&lt;span class=&quot;MathJax&quot; id=&quot;MathJax-Element-58-Frame&quot; tabindex=&quot;0&quot; data-mathml=\'&amp;lt;math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;&amp;gt;&amp;lt;mstyle displaystyle=&quot;true&quot;&amp;gt;&amp;lt;mfrac&amp;gt;&amp;lt;mi&amp;gt;x&amp;lt;/mi&amp;gt;&amp;lt;mi&amp;gt;y&amp;lt;/mi&amp;gt;&amp;lt;/mfrac&amp;gt;&amp;lt;/mstyle&amp;gt;&amp;lt;/math&amp;gt;\' role=&quot;presentation&quot; style=&quot;position: relative;&quot;&gt;&lt;nobr aria-hidden=&quot;true&quot;&gt;&lt;span class=&quot;math&quot; id=&quot;MathJax-Span-522&quot; style=&quot;width: 1.096em; display: inline-block;&quot;&gt;&lt;a href=&quot;http://baidu.com&quot;&gt;&lt;span style=&quot;display: inline-block; position: relative; width: 0.888em; height: 0px; font-size: 120%;&quot;&gt;&lt;span style=&quot;position: absolute; clip: rect(0.888em 1000.89em 3.18em -999.997em); top: -2.133em; left: 0em;&quot;&gt;&lt;span class=&quot;mrow&quot; id=&quot;MathJax-Span-523&quot;&gt;&lt;span class=&quot;mstyle&quot; id=&quot;MathJax-Span-524&quot;&gt;&lt;span class=&quot;mrow&quot; id=&quot;MathJax-Span-525&quot;&gt;&lt;span class=&quot;mfrac&quot; id=&quot;MathJax-Span-526&quot;&gt;&lt;span style=&quot;display: inline-block; position: relative; width: 0.68em; height: 0px; margin-right: 0.107em; margin-left: 0.107em;&quot;&gt;&lt;span style=&quot;position: absolute; clip: rect(3.44em 1000.52em 4.169em -999.997em); top: -4.685em; left: 50%; margin-left: -0.258em;&quot;&gt;&lt;span class=&quot;mi&quot; id=&quot;MathJax-Span-527&quot; style=&quot;font-family: MathJax_Math-italic;&quot;&gt;x&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 4.013em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;position: absolute; clip: rect(3.44em 1000.52em 4.378em -999.997em); top: -3.331em; left: 50%; margin-left: -0.258em;&quot;&gt;&lt;span class=&quot;mi&quot; id=&quot;MathJax-Span-528&quot; style=&quot;font-family: MathJax_Math-italic;&quot;&gt;y&lt;span style=&quot;display: inline-block; overflow: hidden; height: 1px; width: 0.003em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 4.013em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;position: absolute; clip: rect(0.836em 1000.68em 1.201em -999.997em); top: -1.247em; left: 0em;&quot;&gt;&lt;span style=&quot;display: inline-block; overflow: hidden; vertical-align: 0em; border-top: 1.3px solid; width: 0.68em; height: 0px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 1.044em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 2.138em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; overflow: hidden; vertical-align: -1.122em; border-left: 0px solid; width: 0px; height: 2.566em;&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;span class=&quot;MJX_Assistive_MathML&quot; role=&quot;presentation&quot;&gt;&lt;math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;&gt;&lt;mstyle displaystyle=&quot;true&quot;&gt;&lt;mfrac&gt;&lt;a href=&quot;http://baidu.com&quot;&gt;&lt;mi&gt;x&lt;/mi&gt;&lt;mi&gt;y&lt;/mi&gt;&lt;/a&gt;&lt;/mfrac&gt;&lt;/mstyle&gt;&lt;/math&gt;&lt;/span&gt;&lt;/span&gt;&lt;a href=&quot;http://baidu.com&quot;&gt; &lt;/a&gt;和&lt;span class=&quot;MathJax_Preview&quot; style=&quot;color: inherit; display: none;&quot;&gt;&lt;/span&gt;&lt;span class=&quot;MathJax&quot; id=&quot;MathJax-Element-59-Frame&quot; tabindex=&quot;0&quot; data-mathml=\'&amp;lt;math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;&amp;gt;&amp;lt;mstyle displaystyle=&quot;true&quot;&amp;gt;&amp;lt;msup&amp;gt;&amp;lt;mi&amp;gt;x&amp;lt;/mi&amp;gt;&amp;lt;mn&amp;gt;3&amp;lt;/mn&amp;gt;&amp;lt;/msup&amp;gt;&amp;lt;/mstyle&amp;gt;&amp;lt;/math&amp;gt;\' role=&quot;presentation&quot; style=&quot;position: relative;&quot;&gt;&lt;nobr aria-hidden=&quot;true&quot;&gt;&lt;span class=&quot;math&quot; id=&quot;MathJax-Span-529&quot; style=&quot;width: 1.201em; display: inline-block;&quot;&gt;&lt;span style=&quot;display: inline-block; position: relative; width: 0.992em; height: 0px; font-size: 120%;&quot;&gt;&lt;span style=&quot;position: absolute; clip: rect(1.096em 1000.99em 2.294em -999.997em); top: -2.133em; left: 0em;&quot;&gt;&lt;span class=&quot;mrow&quot; id=&quot;MathJax-Span-530&quot;&gt;&lt;span class=&quot;mstyle&quot; id=&quot;MathJax-Span-531&quot;&gt;&lt;span class=&quot;mrow&quot; id=&quot;MathJax-Span-532&quot;&gt;&lt;span class=&quot;msup&quot; id=&quot;MathJax-Span-533&quot;&gt;&lt;span style=&quot;display: inline-block; position: relative; width: 0.992em; height: 0px;&quot;&gt;&lt;span style=&quot;position: absolute; clip: rect(3.44em 1000.52em 4.169em -999.997em); top: -4.008em; left: 0em;&quot;&gt;&lt;span class=&quot;mi&quot; id=&quot;MathJax-Span-534&quot; style=&quot;font-family: MathJax_Math-italic;&quot;&gt;x&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 4.013em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;position: absolute; top: -4.424em; left: 0.576em;&quot;&gt;&lt;span class=&quot;mn&quot; id=&quot;MathJax-Span-535&quot; style=&quot;font-size: 70.7%; font-family: MathJax_Main;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 4.013em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; width: 0px; height: 2.138em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;display: inline-block; overflow: hidden; vertical-align: -0.059em; border-left: 0px solid; width: 0px; height: 1.191em;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/nobr&gt;&lt;span class=&quot;MJX_Assistive_MathML&quot; role=&quot;presentation&quot;&gt;&lt;math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;&gt;&lt;mstyle displaystyle=&quot;true&quot;&gt;&lt;msup&gt;&lt;mi&gt;x&lt;/mi&gt;&lt;mn&gt;3&lt;/mn&gt;&lt;/msup&gt;&lt;/mstyle&gt;&lt;/math&gt;&lt;/span&gt;&lt;/span&gt; 一起', NULL, '{"thumbnail":""}');
/*!40000 ALTER TABLE `dd_portal_examination` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_exam_set 结构
CREATE TABLE IF NOT EXISTS `dd_portal_exam_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '套题名称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='portal应用 套题表';

-- 正在导出表  daotu.dd_portal_exam_set 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_portal_exam_set` DISABLE KEYS */;
REPLACE INTO `dd_portal_exam_set` (`id`, `name`, `create_time`, `delete_time`, `list_order`, `status`) VALUES
	(5, 'test2', 1510810921, 1510813801, 0, 1),
	(6, 'test1', 1510811757, 0, 1, 1);
/*!40000 ALTER TABLE `dd_portal_exam_set` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_knowledge 结构
CREATE TABLE IF NOT EXISTS `dd_portal_knowledge` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:有效,0:无效',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` text NOT NULL COMMENT '内容',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系路径',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='portal应用 知识点表';

-- 正在导出表  daotu.dd_portal_knowledge 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `dd_portal_knowledge` DISABLE KEYS */;
REPLACE INTO `dd_portal_knowledge` (`id`, `parent_id`, `status`, `delete_time`, `list_order`, `name`, `description`, `content`, `path`, `more`) VALUES
	(1, 0, 1, 0, 0, 'knowledge1', 'test', '', '0-1', '{"thumbnail":""}'),
	(2, 1, 1, 0, 0, 'knowledge2', 'testsafsdf', '', '0-1-2', '{"thumbnail":""}');
/*!40000 ALTER TABLE `dd_portal_knowledge` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_knowledge_point 结构
CREATE TABLE IF NOT EXISTS `dd_portal_knowledge_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `point_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '试题埋点id',
  `knowledge_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '知识点id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='portal应用 知识点与试题埋点对应表';

-- 正在导出表  daotu.dd_portal_knowledge_point 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `dd_portal_knowledge_point` DISABLE KEYS */;
REPLACE INTO `dd_portal_knowledge_point` (`id`, `point_id`, `knowledge_id`) VALUES
	(1, 1, 2),
	(2, 8, 2);
/*!40000 ALTER TABLE `dd_portal_knowledge_point` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_point 结构
CREATE TABLE IF NOT EXISTS `dd_portal_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `exam_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的试题id',
  `point_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '埋点名称',
  `point_content` text NOT NULL COMMENT '内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='portal应用 试题埋点表';

-- 正在导出表  daotu.dd_portal_point 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `dd_portal_point` DISABLE KEYS */;
REPLACE INTO `dd_portal_point` (`id`, `exam_id`, `point_name`, `point_content`, `create_time`, `list_order`) VALUES
	(10, 1, 'point1', '', 1510023678, 0),
	(11, 1, 'point2', '', 1510023678, 0),
	(12, 1, 'point3', '', 1510023678, 0),
	(13, 2, 'point4', '', 1510023678, 0),
	(14, 3, 'point5', '', 1510023678, 0),
	(15, 3, 'point1', '', 1510023678, 0),
	(16, 3, 'point2', '', 1510023678, 0),
	(17, 3, 'point3', '', 1510023678, 0),
	(18, 3, 'point4', '', 1510023678, 0);
/*!40000 ALTER TABLE `dd_portal_point` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_post 结构
CREATE TABLE IF NOT EXISTS `dd_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- 正在导出表  daotu.dd_portal_post 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_portal_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_portal_post` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_tag 结构
CREATE TABLE IF NOT EXISTS `dd_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，1启用，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- 正在导出表  daotu.dd_portal_tag 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `dd_portal_tag` DISABLE KEYS */;
REPLACE INTO `dd_portal_tag` (`id`, `name`, `create_time`, `delete_time`, `status`) VALUES
	(1, 'test', 1510810921, 0, 1),
	(2, 'exam1', 1510810921, 0, 1),
	(3, 'key1', 1510810921, 0, 1),
	(4, 'key2', 1510810921, 0, 1);
/*!40000 ALTER TABLE `dd_portal_tag` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_tag_exam 结构
CREATE TABLE IF NOT EXISTS `dd_portal_tag_exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `exam_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='portal应用 标签试题对应表';

-- 正在导出表  daotu.dd_portal_tag_exam 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `dd_portal_tag_exam` DISABLE KEYS */;
REPLACE INTO `dd_portal_tag_exam` (`id`, `tag_id`, `exam_id`, `status`) VALUES
	(2, 2, 1, 1),
	(3, 3, 2, 1),
	(4, 4, 3, 1);
/*!40000 ALTER TABLE `dd_portal_tag_exam` ENABLE KEYS */;


-- 导出  表 daotu.dd_portal_tag_post 结构
CREATE TABLE IF NOT EXISTS `dd_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- 正在导出表  daotu.dd_portal_tag_post 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_portal_tag_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_portal_tag_post` ENABLE KEYS */;


-- 导出  表 daotu.dd_recycle_bin 结构
CREATE TABLE IF NOT EXISTS `dd_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- 正在导出表  daotu.dd_recycle_bin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_recycle_bin` DISABLE KEYS */;
REPLACE INTO `dd_recycle_bin` (`id`, `object_id`, `create_time`, `table_name`, `name`) VALUES
	(1, 5, 1510813801, 'portal_exam_set', 'test2');
/*!40000 ALTER TABLE `dd_recycle_bin` ENABLE KEYS */;


-- 导出  表 daotu.dd_role 结构
CREATE TABLE IF NOT EXISTS `dd_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- 正在导出表  daotu.dd_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `dd_role` DISABLE KEYS */;
REPLACE INTO `dd_role` (`id`, `parent_id`, `status`, `create_time`, `update_time`, `list_order`, `name`, `remark`) VALUES
	(1, 0, 1, 1329633709, 1329633709, 0, '超级管理员', '拥有网站最高管理员权限！'),
	(2, 0, 1, 1329633709, 1329633709, 0, '普通管理员', '权限由最高管理员分配！');
/*!40000 ALTER TABLE `dd_role` ENABLE KEYS */;


-- 导出  表 daotu.dd_role_user 结构
CREATE TABLE IF NOT EXISTS `dd_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- 正在导出表  daotu.dd_role_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_role_user` ENABLE KEYS */;


-- 导出  表 daotu.dd_route 结构
CREATE TABLE IF NOT EXISTS `dd_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- 正在导出表  daotu.dd_route 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `dd_route` DISABLE KEYS */;
REPLACE INTO `dd_route` (`id`, `list_order`, `status`, `type`, `full_url`, `url`) VALUES
	(3, 5000, 1, 2, 'portal/List/index?id=2', 'first_part'),
	(4, 4999, 1, 2, 'portal/Article/index?cid=2', 'first_part/:id');
/*!40000 ALTER TABLE `dd_route` ENABLE KEYS */;


-- 导出  表 daotu.dd_slide 结构
CREATE TABLE IF NOT EXISTS `dd_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- 正在导出表  daotu.dd_slide 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_slide` ENABLE KEYS */;


-- 导出  表 daotu.dd_slide_item 结构
CREATE TABLE IF NOT EXISTS `dd_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- 正在导出表  daotu.dd_slide_item 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_slide_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_slide_item` ENABLE KEYS */;


-- 导出  表 daotu.dd_theme 结构
CREATE TABLE IF NOT EXISTS `dd_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 正在导出表  daotu.dd_theme 的数据：1 rows
/*!40000 ALTER TABLE `dd_theme` DISABLE KEYS */;
REPLACE INTO `dd_theme` (`id`, `create_time`, `update_time`, `status`, `is_compiled`, `theme`, `name`, `version`, `demo_url`, `thumbnail`, `author`, `author_url`, `lang`, `keywords`, `description`) VALUES
	(19, 0, 0, 0, 0, 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');
/*!40000 ALTER TABLE `dd_theme` ENABLE KEYS */;


-- 导出  表 daotu.dd_theme_file 结构
CREATE TABLE IF NOT EXISTS `dd_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- 正在导出表  daotu.dd_theme_file 的数据：8 rows
/*!40000 ALTER TABLE `dd_theme_file` DISABLE KEYS */;
REPLACE INTO `dd_theme_file` (`id`, `is_public`, `list_order`, `theme`, `name`, `action`, `file`, `description`, `more`, `config_more`, `draft_more`) VALUES
	(105, 0, 10, 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","name":"hot_articles_category_id","value":"1","type":"text","tip":"","rule":[]}}}', '{"vars":{"hot_articles_category_id":{"title":"Hot Articles\\u5206\\u7c7bID","name":"hot_articles_category_id","value":"1","type":"text","tip":"","rule":[]}}}', NULL),
	(106, 0, 10, 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', '{"vars":{"baidu_map_info_window_text":{"title":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57","name":"baidu_map_info_window_text","value":"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>","type":"text","tip":"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801","rule":[]},"company_location":{"title":"\\u516c\\u53f8\\u5750\\u6807","value":"","type":"location","tip":"","rule":{"require":true}},"address_cn":{"title":"\\u516c\\u53f8\\u5730\\u5740","value":"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7","type":"text","tip":"","rule":{"require":true}},"address_en":{"title":"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09","value":"NO.0001 Xie Tu Road, Shanghai China","type":"text","tip":"","rule":{"require":true}},"email":{"title":"\\u516c\\u53f8\\u90ae\\u7bb1","value":"catman@thinkcmf.com","type":"text","tip":"","rule":{"require":true}},"phone_cn":{"title":"\\u516c\\u53f8\\u7535\\u8bdd","value":"021 1000 0001","type":"text","tip":"","rule":{"require":true}},"phone_en":{"title":"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09","value":"+8621 1000 0001","type":"text","tip":"","rule":{"require":true}},"qq":{"title":"\\u8054\\u7cfbQQ","value":"478519726","type":"text","tip":"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00","rule":{"require":true}}}}', NULL),
	(107, 0, 5, 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":{"top_slide":{"title":"\\u9876\\u90e8\\u5e7b\\u706f\\u7247","value":"","type":"text","dataSource":{"api":"admin\\/Slide\\/index","multi":false},"placeholder":"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247","tip":"","rule":{"require":true}}},"widgets":{"features":{"title":"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF","display":"1","vars":{"sub_title":{"title":"\\u526f\\u6807\\u9898","value":"Quickly understand the ThinkCMF","type":"text","placeholder":"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898","tip":"","rule":{"require":true}},"features":{"title":"\\u7279\\u6027\\u4ecb\\u7ecd","value":[{"title":"MVC\\u5206\\u5c42\\u6a21\\u5f0f","icon":"bars","content":"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002"},{"title":"\\u7528\\u6237\\u7ba1\\u7406","icon":"group","content":"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002"},{"title":"\\u4e91\\u7aef\\u90e8\\u7f72","icon":"cloud","content":"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002"},{"title":"\\u5b89\\u5168\\u7b56\\u7565","icon":"heart","content":"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002"},{"title":"\\u5e94\\u7528\\u6a21\\u5757\\u5316","icon":"cubes","content":"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002"},{"title":"\\u514d\\u8d39\\u5f00\\u6e90","icon":"certificate","content":"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002"}],"type":"array","item":{"title":{"title":"\\u6807\\u9898","value":"","type":"text","rule":{"require":true}},"icon":{"title":"\\u56fe\\u6807","value":"","type":"text"},"content":{"title":"\\u63cf\\u8ff0","value":"","type":"textarea"}},"tip":""}}},"last_news":{"title":"\\u6700\\u65b0\\u8d44\\u8baf","display":"1","vars":{"last_news_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
	(108, 0, 10, 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"vars":[],"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
	(109, 0, 10, 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', '{"widgets":{"hottest_articles":{"title":"\\u70ed\\u95e8\\u6587\\u7ae0","display":"1","vars":{"hottest_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}},"last_articles":{"title":"\\u6700\\u65b0\\u53d1\\u5e03","display":"1","vars":{"last_articles_category_id":{"title":"\\u6587\\u7ae0\\u5206\\u7c7bID","value":"","type":"text","dataSource":{"api":"portal\\/category\\/index","multi":true},"placeholder":"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b","tip":"","rule":{"require":true}}}}}}', NULL),
	(110, 0, 10, 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', '{"vars":{"varName1":{"title":"\\u70ed\\u95e8\\u641c\\u7d22","value":"1","type":"text","tip":"\\u8fd9\\u662f\\u4e00\\u4e2atext","rule":{"require":true}}}}', NULL),
	(111, 1, 0, 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', '{"vars":{"enable_mobile":{"title":"\\u624b\\u673a\\u6ce8\\u518c","value":1,"type":"select","options":{"1":"\\u5f00\\u542f","0":"\\u5173\\u95ed"},"tip":""}}}', NULL),
	(112, 1, 1, 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"ThinkCMF","type":"text","tip":"","rule":[]}}}', '{"vars":{"company_name":{"title":"\\u516c\\u53f8\\u540d\\u79f0","name":"company_name","value":"daotu","type":"text","tip":"","rule":[]}}}', NULL);
/*!40000 ALTER TABLE `dd_theme_file` ENABLE KEYS */;


-- 导出  表 daotu.dd_third_party_user 结构
CREATE TABLE IF NOT EXISTS `dd_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- 正在导出表  daotu.dd_third_party_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_third_party_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_third_party_user` ENABLE KEYS */;


-- 导出  表 daotu.dd_user 结构
CREATE TABLE IF NOT EXISTS `dd_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 正在导出表  daotu.dd_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user` DISABLE KEYS */;
REPLACE INTO `dd_user` (`id`, `user_type`, `sex`, `birthday`, `last_login_time`, `score`, `coin`, `create_time`, `user_status`, `user_login`, `user_pass`, `user_nickname`, `user_email`, `user_url`, `avatar`, `signature`, `last_login_ip`, `user_activation_key`, `mobile`) VALUES
	(1, 1, 0, 0, 1510797954, 0, 0, 1505549527, 1, 'admin', '###0dd698cfcfa50c3d290adad76590d0e4', 'admin', 'admin@qq.com', '', '', '', '127.0.0.1', '', '');
/*!40000 ALTER TABLE `dd_user` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_action 结构
CREATE TABLE IF NOT EXISTS `dd_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- 正在导出表  daotu.dd_user_action 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_user_action` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_action_log 结构
CREATE TABLE IF NOT EXISTS `dd_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- 正在导出表  daotu.dd_user_action_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_user_action_log` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_favorite 结构
CREATE TABLE IF NOT EXISTS `dd_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- 正在导出表  daotu.dd_user_favorite 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_user_favorite` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_login_attempt 结构
CREATE TABLE IF NOT EXISTS `dd_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- 正在导出表  daotu.dd_user_login_attempt 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_user_login_attempt` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_score_log 结构
CREATE TABLE IF NOT EXISTS `dd_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- 正在导出表  daotu.dd_user_score_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_user_score_log` ENABLE KEYS */;


-- 导出  表 daotu.dd_user_token 结构
CREATE TABLE IF NOT EXISTS `dd_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- 正在导出表  daotu.dd_user_token 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_user_token` DISABLE KEYS */;
REPLACE INTO `dd_user_token` (`id`, `user_id`, `expire_time`, `create_time`, `token`, `device_type`) VALUES
	(3, 1, 1526349954, 1510797954, '0ea28fa00688eb4ec0a12953dceb68af0ea28fa00688eb4ec0a12953dceb68af', 'web');
/*!40000 ALTER TABLE `dd_user_token` ENABLE KEYS */;


-- 导出  表 daotu.dd_verification_code 结构
CREATE TABLE IF NOT EXISTS `dd_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- 正在导出表  daotu.dd_verification_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dd_verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_verification_code` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
