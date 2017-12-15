-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-15 08:49:49
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2advanced`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) NOT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) NOT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL COMMENT '角色',
  `status` smallint(6) NOT NULL COMMENT '等级',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `vip_lv` int(11) NOT NULL COMMENT 'VIP等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email_validate_token`, `email`, `role`, `status`, `avatar`, `vip_lv`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Hpd8EyhH_M0H-I23MZhz1xAAsfjme-x_', '$2y$13$cjCifRQTl9lD/mPe0S8dpu7HDR1rY60BgKQw1OBxCoqaic52rMAK2', '', '', '727817393@qq.com', 0, 10, '', 0, 1512544223, 1512544223);

-- --------------------------------------------------------

--
-- 表的结构 `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `cat_name` varchar(255) NOT NULL COMMENT '分类名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `cats`
--

INSERT INTO `cats` (`id`, `cat_name`) VALUES
(1, '分类1'),
(2, '分类2');

-- --------------------------------------------------------

--
-- 表的结构 `feeds`
--

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `created_at` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='聊天信息表';

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `label_img` varchar(255) DEFAULT NULL COMMENT '标签图',
  `cat_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '是否发布(0:未发布;1:已发布)',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章主表';

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `content`, `label_img`, `cat_id`, `user_id`, `user_name`, `is_valid`, `created_at`, `updated_at`) VALUES
(1, '测试文章一', '村上春树说测试测试测试测试测试从', '<p>村上春树说测试测试测试测试测试从</p>', '/image/20171215/1513320475129387.jpg', 1, 2, 'test', 1, 1513320493, 1513320493);

-- --------------------------------------------------------

--
-- 表的结构 `post_extends`
--

CREATE TABLE `post_extends` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章id',
  `browser` int(11) DEFAULT '0' COMMENT '浏览量',
  `collect` int(11) DEFAULT '0' COMMENT '收藏量',
  `praise` int(11) DEFAULT '0' COMMENT '点赞',
  `comment` int(11) DEFAULT '0' COMMENT '评论'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章扩展表';

--
-- 转存表中的数据 `post_extends`
--

INSERT INTO `post_extends` (`id`, `post_id`, `browser`, `collect`, `praise`, `comment`) VALUES
(1, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `relation_post_tags`
--

CREATE TABLE `relation_post_tags` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `post_id` int(11) NOT NULL COMMENT '文章ID',
  `tag_id` int(11) NOT NULL COMMENT '标签ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章标签关系表';

--
-- 转存表中的数据 `relation_post_tags`
--

INSERT INTO `relation_post_tags` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `tag_name` varchar(255) NOT NULL COMMENT '标签名称',
  `post_num` int(11) NOT NULL DEFAULT '0' COMMENT '关联文章数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';

--
-- 转存表中的数据 `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `post_num`) VALUES
(1, '标签1', 1),
(2, '标签2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) NOT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) NOT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL COMMENT '角色',
  `status` smallint(6) NOT NULL COMMENT '等级',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `vip_lv` int(11) NOT NULL COMMENT 'VIP等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email_validate_token`, `email`, `role`, `status`, `avatar`, `vip_lv`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Hpd8EyhH_M0H-I23MZhz1xAAsfjme-x_', '$2y$13$cjCifRQTl9lD/mPe0S8dpu7HDR1rY60BgKQw1OBxCoqaic52rMAK2', '', '', '727817393@qq.com', 0, 10, '', 0, 1512544223, 1512544223),
(2, 'test', 'tpBGjAjA536GdXKZ2yFOocE3LsikkcEW', '$2y$13$BVFnxu1FH1LQZGj8KGje7uTM7kkQht0PpiMNxNGnylgeTiI7PJu/2', '', '', '11111111@qq.com', 0, 10, '', 0, 1512549251, 1512549251),
(3, 'test01', 'jWzeUjakb-jPacihWUvanJEy9obnHrmk', '$2y$13$lWDAhDFqC1LOdvkYnnVGb.xsT8kPRNgFkdbpj0wi1JuwKtQhtKgSC', '', '', '1243452@qq.com', 0, 10, '', 0, 1512610168, 1512610168),
(4, '11111test02', 'wNZi3IKH5909PCUh8UrfijVIbb64ZJ_b', '$2y$13$YIyJeN6eyA2BtqTqRsYte.g0f3aU0zXqp9Bblg0l9DHt7kMuBbW.q', '', '', 'jjjj@qq.com', 0, 10, '', 0, 1512631939, 1512631939);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_extends`
--
ALTER TABLE `post_extends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relation_post_tags`
--
ALTER TABLE `relation_post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `post_extends`
--
ALTER TABLE `post_extends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `relation_post_tags`
--
ALTER TABLE `relation_post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
