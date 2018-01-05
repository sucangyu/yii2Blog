-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-05 16:25:08
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
(1, 'admin', 'Hpd8EyhH_M0H-I23MZhz1xAAsfjme-x_', '$2y$13$cjCifRQTl9lD/mPe0S8dpu7HDR1rY60BgKQw1OBxCoqaic52rMAK2', '', '', '727817393@qq.com', 0, 10, '/statics/images/111.jpg', 0, 1512544223, 1512544223);

-- --------------------------------------------------------

--
-- 表的结构 `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `cat_name` varchar(255) NOT NULL COMMENT '分类名称',
  `pid` int(11) NOT NULL COMMENT '父id',
  `sort` int(11) NOT NULL COMMENT '排序',
  `created_at` int(11) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `cats`
--

INSERT INTO `cats` (`id`, `cat_name`, `pid`, `sort`, `created_at`) VALUES
(1, 'HTML', 0, 0, 1513320493),
(2, 'CSS', 0, 0, 1513320493),
(3, 'JS', 0, 0, 1513320493),
(4, 'ThinkPHP', 0, 0, 1513320493),
(5, 'PHP', 0, 0, 1513320493),
(6, 'PhpMyAdmin', 0, 0, 1513320493);

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

--
-- 转存表中的数据 `feeds`
--

INSERT INTO `feeds` (`id`, `user_id`, `content`, `created_at`) VALUES
(10, 2, '啊啊啊啊', 1513562307),
(11, 2, '咯咯咯咯咯', 1513562793),
(12, 2, '哈哈哈哈或或', 1514178388);

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
(1, '测试文章一', '村上春树说测试测试测试测试测试从', '<p>村上春树说测试测试测试测试测试从</p>', '/image/20171215/1513320475129387.jpg', 1, 2, 'test', 1, 1513320493, 1513320493),
(2, '测试文章二', '测试测试测试测试测试从删除', '<p>测试测试测试测试测试从删除</p>', '/image/20171218/1513566080571548.jpg', 1, 2, 'test', 1, 1513566082, 1513566082),
(3, '常用css', '1:适用于手机端屏幕宽度适应 例子:尺寸从大往小写.hd-wrapper{margin-top:5%;}\r\n@mediascreenand(max-width:375px){\r\n.', '<p>1:适用于手机端屏幕宽度适应<br/> 例子:尺寸从大往小写</p><pre class="brush:css;toolbar:false">.hd-wrapper{margin-top:&nbsp;5%;}\r\n&nbsp;@media&nbsp;screen&nbsp;and&nbsp;(max-width:&nbsp;375px)&nbsp;{\r\n&nbsp;.hd-wrapper{margin-top:&nbsp;4%;}\r\n&nbsp;}\r\n&nbsp;@media&nbsp;screen&nbsp;and&nbsp;(max-width:&nbsp;320px)&nbsp;{\r\n&nbsp;.hd-wrapper{margin-top:&nbsp;1%;}\r\n&nbsp;}\r\n&nbsp;#wxdesc{color:&nbsp;transparent;}</pre><p>2:块级和行级标签(及行且块):</p><pre class="brush:css;toolbar:false">display:&nbsp;inline-block;</pre><p>3:高度自适应:</p><pre class="brush:css;toolbar:false">overflow:&nbsp;auto;</pre><p>4:bootstrap下input标签在苹果手机去圆角:</p><pre class="brush:css;toolbar:false">#pay{border-radius:0px;-webkit-appearance:&nbsp;none;</pre><p>5:bootstrap下去a签点击下划线:</p><pre class="brush:css;toolbar:false">a,&nbsp;a:hover&nbsp;{text-decoration:&nbsp;none;</pre><p>6:加边框:border:</p><pre class="brush:css;toolbar:false">1px&nbsp;solid&nbsp;#CCC;</pre><p>7:超出部分隐藏:</p><pre class="brush:css;toolbar:false"><br/></pre><p>8:背景图片:</p><pre class="brush:css;toolbar:false">background:url(__PUBLIC__/images/radion2.png)&nbsp;no-repeat&nbsp;right&nbsp;center;background-size:25px&nbsp;25px;width:&nbsp;25px;height:&nbsp;25px;</pre><p>PS:如果调大小修改后面的数字</p><p>9:focus 选择器选择获得焦点的输入字段，并设置其样式：</p><pre class="brush:css;toolbar:false">input:focus{&nbsp;background-color:yellow;}</pre><p><br/></p>', '/image/20171218/1513573949136088.jpg', 2, 2, 'test', 1, 1513574267, 1513574267),
(4, '常用js', '1:当选中的多选框变化时的jq表达$(&quot;input[name=&#39;years[]&#39;]:checkbox&quot;).on(&#39;change&#39;', '<p>1:当选中的多选框变化时的jq表达</p><pre class="brush:js;toolbar:false">$(&quot;input[name=&#39;years[]&#39;]:checkbox&quot;).on(&#39;change&#39;,function&nbsp;()&nbsp;{\r\n});</pre><p>2:让被选中的的多选框进行循环</p><pre class="brush:js;toolbar:false">$(&quot;input[name=&#39;years[]&#39;]:checkbox:checked&quot;).each(function(){\r\n});</pre><p>3:让变量余2个小数点</p><pre class="brush:js;toolbar:false">total_money.toFixed(2)</pre><p>4:from表单jq提交的两种方式</p><pre class="brush:js;toolbar:false">a)$(&quot;.pay&quot;).click(function(){\r\n&nbsp;$(&quot;#payfrom&quot;).submit();//#payfrom是from表单的id\r\n&nbsp;});\r\n&nbsp;b)$(&quot;.pay&quot;).click(function(){\r\n&nbsp;document.searchForm.action=&#39;{:U(addcat)}&#39;;//searchForm为from的name值\r\n&nbsp;});</pre><p>5:只取整数的函数:</p><pre class="brush:js;toolbar:false">parseInt();</pre><p>6:获取某个ul下的li个数:</p><pre class="brush:js;toolbar:false">$(&quot;.bd&nbsp;li&quot;).length;</pre><p>7:获取标签的id值:</p><pre class="brush:js;toolbar:false">var&nbsp;id&nbsp;=&nbsp;$(this).attr(&quot;id&quot;);</pre><p>8:获取标签的data-id=&quot;{$row[&#39;cid&#39;]}&quot;值:var id= $(this).data(&quot;id&quot;);</p><p>9:ajax的写法</p><pre class="brush:js;toolbar:false">$.ajax({\r\n&nbsp;type:&nbsp;&#39;POST&#39;,\r\n&nbsp;url:&nbsp;&quot;{:U(&#39;Goods/cart&#39;)}&quot;,\r\n&nbsp;data:{&quot;cid&quot;:id,&quot;type&quot;:type},\r\n&nbsp;success:&nbsp;function(data){\r\n&nbsp;//console.log(data);\r\n&nbsp;js();\r\n&nbsp;},\r\n&nbsp;});</pre><p>10:去除标签的checked选中值:</p><pre class="brush:js;toolbar:false">$(&quot;#&quot;+bb).attr(&quot;checked&quot;,false);</pre><p>11:是否给标签加禁用属性:</p><pre class="brush:js;toolbar:false">$(&quot;#lijig&quot;).attr(&#39;disabled&#39;,true);//falst是禁用</pre><p>12:页面一加载完毕就执行的的函数:</p><pre class="brush:js;toolbar:false">$(document).ready(function(){\r\n&nbsp;//&nbsp;更新商品价格\r\n&nbsp;get_goods_price();\r\n&nbsp;});</pre><p>13:ceil() 方法可对一个数进行上舍入。</p><p>14:在指定标签后结尾插入内容:</p><pre class="brush:js;toolbar:false">$(&quot;.ajax_return&quot;).append(data);</pre><p>15:当按下按键时，改变文本域的颜色：//keyup</p><pre class="brush:js;toolbar:false">$(&quot;input&quot;).keyup(function(){\r\n&nbsp;$(&quot;input&quot;).css(&quot;background-color&quot;,&quot;#D6D6FF&quot;);\r\n&nbsp;});</pre><p>16:当输入域失去焦点 (blur) 时改变其颜色：</p><pre class="brush:js;toolbar:false">$(&quot;input&quot;).blur(function(){\r\n&nbsp;$(&quot;input&quot;).css(&quot;background-color&quot;,&quot;#D6D6FF&quot;);\r\n&nbsp;});</pre><p>17:在数组的末尾添加值的函数:</p><pre style="background-color: rgb(255, 255, 255); font-family: 宋体; font-size: 12pt;">sliarrn.push(de);//sliarrn为数组变量可自定义</pre><p><br/></p>', '/image/20171218/1513574313127516.jpg', 3, 2, 'test', 1, 1513574767, 1515046859),
(5, '常用HTML各标签属性', '1:&lt;a&gt;的target 属性规定在何处打开链接文档a)_blank:浏览器总在一个新打开、未命名的窗口中载入目标文档', '<p>1:&lt;a&gt;的target 属性规定在何处打开链接文档</p><p>a)_blank:浏览器总在一个新打开、未命名的窗口中载入目标文档</p><p><br/></p>', '', 1, 2, 'test', 1, 1513574813, 1513574813),
(6, 'css单选/多选按钮样式改变', '单选(radio)例子:css:input[type=radio]:checked+.rad_1,.rad_1.checked{\r\nbackground:#ccc;\r\n}\r\n.ra', '<p>单选(radio)例子:</p><p>css:</p><pre class="brush:css;toolbar:false">input[type=radio]:checked&nbsp;+&nbsp;.rad_1,&nbsp;.rad_1.checked&nbsp;{\r\n&nbsp;background:&nbsp;#ccc;\r\n&nbsp;}\r\n&nbsp;.rad_1&nbsp;{\r\n&nbsp;border:&nbsp;1px&nbsp;solid&nbsp;#ccc;\r\n&nbsp;padding:&nbsp;7px&nbsp;16px;\r\n&nbsp;box-shadow:&nbsp;inset&nbsp;0&nbsp;1px&nbsp;1px&nbsp;rgba(0,0,0,0.075);\r\n&nbsp;border-radius:&nbsp;5px;\r\n&nbsp;}</pre><p>HTML:</p><pre class="brush:html;toolbar:false">&lt;input&nbsp;type=&quot;radio&quot;&nbsp;class=&quot;radios&quot;&nbsp;name=&quot;kind&quot;&nbsp;id=&quot;status_on1&quot;&nbsp;&nbsp;value=&quot;1&quot;&nbsp;&nbsp;checked=&quot;checked&quot;/&gt;\r\n&lt;label&nbsp;for=&quot;status_on1&quot;&nbsp;class=&quot;rad_1&quot;&nbsp;data-id=&quot;1&quot;&gt;到付&lt;/label&gt;\r\n&lt;input&nbsp;type=&quot;radio&quot;&nbsp;class=&quot;radios&quot;&nbsp;name=&quot;kind&quot;&nbsp;id=&quot;status_on2&quot;&nbsp;value=&quot;2&quot;/&gt;\r\n&lt;label&nbsp;for=&quot;status_on2&quot;&nbsp;class=&quot;rad_1&quot;&nbsp;data-id=&quot;2&quot;&gt;自提&lt;/label&gt;\r\n&lt;input&nbsp;type=&quot;radio&quot;&nbsp;class=&quot;radios&quot;&nbsp;name=&quot;kind&quot;&nbsp;id=&quot;status_on3&quot;&nbsp;&nbsp;value=&quot;3&quot;/&gt;\r\n&lt;label&nbsp;for=&quot;status_on3&quot;&nbsp;class=&quot;rad_1&quot;&nbsp;data-id=&quot;3&quot;&gt;自付&lt;/label&gt;</pre><p>ps:input的id要与label的for一致调整label的css</p><p><br/></p><p>多选(checkbox)例子</p><p>css:</p><pre class="brush:css;toolbar:false">.check&nbsp;input{display:&nbsp;none;}\r\n&nbsp;input[type=checkbox]:checked&nbsp;+&nbsp;.rad_1,&nbsp;.rad_1.checked&nbsp;{background:url(__PUBLIC__/images/radio1.png)&nbsp;no-repeat&nbsp;right&nbsp;center;background-size:25px&nbsp;25px;width:&nbsp;25px;height:&nbsp;25px;}\r\n&nbsp;.rad_1&nbsp;{background:url(__PUBLIC__/images/radion2.png)&nbsp;no-repeat&nbsp;right&nbsp;center;background-size:25px&nbsp;25px;width:&nbsp;25px;height:&nbsp;25px;}</pre><p>HTML:</p><pre class="brush:html;toolbar:false">&lt;input&nbsp;type=&quot;checkbox&quot;&nbsp;class=&quot;checkboxs&quot;&nbsp;name=&quot;years[]&quot;&nbsp;id=&quot;status_ono{$i}&quot;&nbsp;value=&quot;{$vo.id}&quot;&nbsp;checked=&quot;checked&quot;/&gt;\r\n&lt;label&nbsp;for=&quot;status_ono{$i}&quot;&nbsp;data-id=&quot;{$i}&quot;&nbsp;class=&quot;rad_2&quot;&gt;{$vo.batchnum|date=&#39;Y&#39;,###}&lt;/label&gt;</pre><p><br/></p>', '', 2, 2, 'test', 1, 1513575664, 1513575664),
(7, 'ThinkPHP查询小技巧', '1:关联查询并有的字段名相同查询全部字段$goodsNum=$cartlistM-&gt;field(&#39;*,a.idascid&#39;)-&gt;join(&#39;Go', '<p><strong>1:关联查询并有的字段名相同查询全部字段</strong></p><pre class="brush:php;toolbar:false">$goodsNum&nbsp;=&nbsp;$cartlistM-&gt;field(&#39;*,a.id&nbsp;as&nbsp;cid&#39;)-&gt;join(&#39;Goods&nbsp;as&nbsp;b&nbsp;on&nbsp;a.goods_id&nbsp;=&nbsp;b.id&#39;)-&gt;where(array(&#39;a.id&#39;&nbsp;=&gt;$_POST[&#39;cartID&#39;]&nbsp;))-&gt;find();</pre><p><strong>2:查询按条件去处重复值的语句</strong></p><pre class="brush:php;toolbar:false">M(&#39;propertytake&#39;)-&gt;group(&#39;batchnum&#39;)-&gt;where($w)-&gt;select();</pre><p><strong>3:在循环中去除查询selsect()中不符合条件的数组</strong></p><pre class="brush:php;toolbar:false">foreach&nbsp;($propertyArr&nbsp;as&nbsp;$key=&gt;$val)\r\n&nbsp;{\r\n&nbsp;$w[&#39;mid&#39;]&nbsp;=&nbsp;$this-&gt;mid;\r\n&nbsp;$w[&#39;property_id&#39;]&nbsp;=&nbsp;$val[&#39;id&#39;];\r\n&nbsp;//查询期数是否已领满9年\r\n&nbsp;$hasGetYear&nbsp;=&nbsp;count(M(&#39;propertytake&#39;)-&gt;group(&#39;batchnum&#39;)-&gt;where($w)-&gt;select());\r\n//查询当前资产在本期已收成的消耗资源数量\r\n&nbsp;$w[&#39;batchnum&#39;]&nbsp;=&nbsp;$setBatch;\r\n&nbsp;$temp_num&nbsp;=&nbsp;M(&#39;propertytake&#39;)-&gt;where($w)-&gt;sum(&#39;nums&#39;);\r\n&nbsp;if(empty($temp_num))\r\n&nbsp;{\r\n&nbsp;$temp_num&nbsp;=&nbsp;0;\r\n&nbsp;}\r\nif&nbsp;($hasGetYear&nbsp;&gt;=&nbsp;$goodsArr[&#39;getmaxnum&#39;]||$temp_num&gt;=$val[&#39;totaltree&#39;]||$val[&#39;totaltree&#39;]&lt;=0)&nbsp;{&nbsp;unset($propertyArr[$key]);&nbsp;}else&nbsp;{&nbsp;$treeNum&nbsp;+=&nbsp;$val[&#39;totaltree&#39;];&nbsp;}&nbsp;}</pre><p><strong>4:常用函数</strong></p><pre class="brush:php;toolbar:false">a)fmod()&nbsp;函数返回除法的浮点数余数。&nbsp;\r\nb)unset($saveData);销毁数组\r\nc)strtotime(date(&#39;Y&#39;).&#39;-01-01&#39;);把时间变为时间戳的函数&nbsp;\r\nd)isMobile();判断当前用户是否手机\r\ne)array_push($arr,$val);//$arr被添加的数组,$val为添加的值</pre><p><strong>5:thinkPHP的事务处理 例://开启事务处理本地数据</strong></p><pre class="brush:php;toolbar:false">M()-&gt;startTrans();\r\n&nbsp;//提交\r\n&nbsp;M()-&gt;commit();\r\n&nbsp;//不提交\r\n&nbsp;M()-&gt;rollback();</pre><p><strong>6:</strong>json解析json_decode();json加密json_encode(value);</p><p><strong>7:调用父类(被继承类)</strong></p><pre class="brush:php;toolbar:false">parent::memaddress($list[&#39;province&#39;],$list[&#39;city&#39;],$list[&#39;district&#39;]);//parent::是父的意思,memaddress是父类中的函数</pre><p><strong>8:查询方法之过滤查询</strong><br/></p><pre class="brush:php;toolbar:false">distanct(true)</pre><p><img src="/image/20171221/1513841282111009.png" title="1513841282111009.png" alt="blob.png"/></p>', '/image/20171221/1513840897497748.png', 4, 2, 'test', 1, 1513841323, 1515046697),
(8, '设计模式:单例模式的数据库连接', '1:protected//定义私有函数,只可以被同一包中的类所访问 2:public//定义公共函数 3self::$ins//调用当前类的静态方法,自 PHP 5.3.0 后可用', '<p><strong>1:protected//定义私有函数,只可以被同一包中的类所访问<br/> 2:public//定义公共函数<br/> 3self::$ins//调用当前类的静态方法,自 PHP 5.3.0 后可用$this</strong></p><p><strong>例:</strong></p><pre class="brush:php;toolbar:false">&lt;?php\r\n//单例模式的数据库连接\r\nclass&nbsp;dbClassManage\r\n{\r\n	protected&nbsp;static&nbsp;$ins=null;\r\n	public&nbsp;static&nbsp;function&nbsp;getIns($hosts,$users,$pwd,$dbname){\r\n		if&nbsp;(self::$ins&nbsp;===&nbsp;null)&nbsp;{\r\n			self::$ins&nbsp;=&nbsp;new&nbsp;self($hosts,$users,$pwd,$dbname);\r\n		}\r\n		return&nbsp;self::$ins;\r\n	}\r\n	public&nbsp;$conn;\r\n	/*\r\n	$hosts:服务器主机地址\r\n	$users:服务器登录用户名\r\n	$pwd:服务器登录密码\r\n	$dbname:数据库名称\r\n	*/\r\n	//&nbsp;final防继承\r\n	final&nbsp;protected&nbsp;function&nbsp;__construct($hosts,$users,$pwd,$dbname)\r\n	{\r\n		//连接mysql数据库\r\n		$this-&gt;conn&nbsp;=&nbsp;mysql_connect($hosts,$users,$pwd);\r\n		if($this-&gt;conn&nbsp;==&nbsp;false)&nbsp;exit(&quot;服务器连接失败&quot;);\r\n		//设置编码\r\n		$c&nbsp;=&nbsp;mysql_query(&quot;set&nbsp;names&nbsp;utf8&quot;,$this-&gt;conn);\r\n		if($c&nbsp;==&nbsp;false)&nbsp;exit(&quot;编码设置有误&quot;);\r\n		$f&nbsp;=&nbsp;mysql_select_db($dbname,$this-&gt;conn);\r\n		if($f&nbsp;==&nbsp;false)&nbsp;exit(&quot;数据库连接失败&quot;);\r\n	}\r\n	//防克隆\r\n	final&nbsp;protected&nbsp;function&nbsp;__clone()\r\n	{\r\n\r\n	}\r\n	/*\r\n	&nbsp;*增、删、改\r\n	&nbsp;*/\r\n	public&nbsp;function&nbsp;exeSql($sql)\r\n	{\r\n		mysql_query($sql,$this-&gt;conn);\r\n		return&nbsp;true;\r\n	}\r\n	\r\n	/*\r\n	&nbsp;*关闭数据库\r\n	&nbsp;*/\r\n	public&nbsp;function&nbsp;close()\r\n	{\r\n		return&nbsp;mysql_close($this-&gt;conn);\r\n	}\r\n	/*\r\n	&nbsp;*查询一条数据\r\n	&nbsp;*/\r\n	public&nbsp;function&nbsp;getOneData($sql,$mode&nbsp;=&nbsp;MYSQL_ASSOC)\r\n	{\r\n		$result&nbsp;=&nbsp;mysql_query($sql,$this-&gt;conn);\r\n		$rs&nbsp;=&nbsp;mysql_fetch_array($result,$mode);\r\n		mysql_free_result($result);\r\n		return&nbsp;$rs;\r\n	}\r\n	/*\r\n	&nbsp;*查询多条数据\r\n	&nbsp;*/\r\n	public&nbsp;function&nbsp;getMoreData($sql,$mode&nbsp;=&nbsp;MYSQL_ASSOC)\r\n	{\r\n		$result&nbsp;=&nbsp;mysql_query($sql,$this-&gt;conn);\r\n		while($res&nbsp;=&nbsp;mysql_fetch_array($result,$mode)&nbsp;or&nbsp;false)\r\n		{\r\n			$rs[]&nbsp;=&nbsp;$res;\r\n		}\r\n		mysql_free_result($result);\r\n		return&nbsp;$rs;\r\n	}\r\n}\r\n//$db&nbsp;=&nbsp;new&nbsp;dbClassManage(&#39;localhost&#39;,&#39;root&#39;,&#39;&#39;,&#39;dsshop&#39;);\r\n$db&nbsp;=&nbsp;dbClassManage::getIns(&#39;localhost&#39;,&#39;root&#39;,&#39;&#39;,&#39;dsshop&#39;);\r\n?&gt;</pre><p><br/></p>', '/image/20171222/1513909215115604.png', 5, 2, 'test', 1, 1513909344, 1513909344),
(9, '即时搜索/反应的input和propertychange方法', '在web开发中，我们有时会需要动态监听输入框值的变化，当使用onkeydown、onkeypress、onkeyup作为监听事件时，会发现一些复制粘贴等操作用不了，同时，在处理组合', '<p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px;">在web开发中，我们有时会需要动态监听输入框值的变化，当使用onkeydown、onkeypress、onkeyup作为监听事件时，会发现一些复制粘贴等操作用不了，同时，在处理组合快键键的时候也很麻烦。这时候我们需要更专业的解决方案：HTML5标准事件oninput、onchange和IE专属的事件properchange。</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">1.oninput&amp;onchange：</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">oninput和onchange都是事件对象，当输入框的值发生改变时触发该事件。不同的是，oninput是在值改变时立即触发，而onchange是在值改变后失去焦点才触发，并且可以用在非输入框中，如：select等。</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">2.propertychange：</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">功能同oninput，用以替代oninput在IE9以下的不兼容性。</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">3.output:</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">output是一个HTML5标签,IE系列浏览不兼容，主要用于计算输出。如：<br/> propertychange 和 input 事件:</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">1）propertychange只要当前对象的属性发生改变就会触发该事件</span></strong></span></p><p><span style="font-family: 隶书, SimLi;"><strong><span style="font-size: 16px; font-family: 宋体, SimSun;">2）input是标准的浏览器事件，一般应用于input元素，当input的value发生变化就会发生，无论是键盘输入还是鼠标黏贴的改变都能及时监听到变化</span></strong></span></p><pre class="brush:js;toolbar:false">$(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;#username&#39;).bind(&#39;input&nbsp;propertychange&#39;,&nbsp;function()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;#result&#39;).html($(this).val().length&nbsp;+&nbsp;&#39;&nbsp;characters&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;});\r\n})</pre><p><span style="font-size: 16px; font-family: 宋体, SimSun;"></span>这里bind同时绑定了input和propertychange两个方法。</p><p>示例:<br/></p><p>HTML</p><pre class="brush:html;toolbar:false">&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;claimNum&quot;&nbsp;value=&quot;10&quot;&nbsp;id=&quot;input-num&quot;&nbsp;onpropertychange=&quot;OnPropChanged()&quot;&gt;</pre><p>JQ</p><pre class="brush:js;toolbar:false">$(&#39;input&#39;).bind(&#39;input&nbsp;propertychange&#39;,&nbsp;function()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;num&nbsp;=&nbsp;$(this).val();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//alert(num);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(num==0)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;.sp1&#39;).html(&#39;￥&#39;+saleMoney);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#input-num&quot;).val(&#39;1&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(num&lt;=50&amp;&amp;num&gt;0)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;jiage&nbsp;=&nbsp;num*saleMoney;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;.sp1&#39;).html(&#39;￥&#39;+jiage.toFixed(2));\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alert(&#39;您购买的数量不能大于50棵&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#input-num&quot;).val(&#39;50&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n			var&nbsp;jiage&nbsp;=&nbsp;$(&quot;#input-num&quot;).val()*saleMoney;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&#39;.sp1&#39;).html(&#39;￥&#39;+jiage.toFixed(2));\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;});</pre><p><br/></p>', '/image/20171222/1513909496772807.png', 3, 2, 'test', 1, 1513909914, 1513909914),
(10, 'wampp用phpmyadmin修改数据库密码无法登陆解决方法', '1. 关闭正在运行的MySQL服务。 2. 打开DOS窗口，转到mysql\\bin目录。 3. 输入mysqld --skip-grant-tables 回车。--skip-gra', '<p>1. 关闭正在运行的MySQL服务。<br/> 2. 打开DOS窗口，转到mysql\\bin目录。<br/> 3. 输入mysqld --skip-grant-tables 回车。--skip-grant-tables 的意思是启动MySQL服务的时候跳过权限表认证。<br/> 4. 再开一个DOS窗口（因为刚才那个DOS窗口已经不能动了），转到mysql\\bin目录。<br/> 5. 输入mysql回车，如果成功，将出现MySQL提示符 &gt;。<br/> 6. 连接权限数据库： use mysql; 。</p><p>6. 改密码：update user set password=password(&quot;123&quot;) where user=&quot;root&quot;;（别忘了最后加分号） 。<br/> 7. 刷新权限（必须步骤）：flush privileges;　。<br/> 8. 退出 quit。<br/> 9. 注销系统，再进入，使用用户名root和刚才设置的新密码123登录。</p><p>如果有有root游客用户无法修改则进行以下步骤<br/> 进行步骤1-6<br/> delete from user where user=&#39;&#39;;</p><p>ps:wampp的mysql登录控制文件在类似D:\\wampp\\phpMyAdmin下的config.inc.php文件<br/> $cfg[&#39;Servers&#39;][$i][&#39;auth_type&#39;] = &#39;config&#39;;//cookie config<br/> config是wampp默认登录<br/> cookie是正常的phpmyadmin登录页面登录有时限</p><p><br/></p>', '/image/20171222/1513926665908702.png', 6, 2, 'test', 1, 1513926705, 1513926705),
(11, '如何让img的宽高等比例(纯css和js方法)', 'js+css+html:css.userimg{width:100%}jq$(document).ready(function(){\r\nvarwidth=$(&#39;.useri', '<p><strong>js+css+html:</strong></p><p><strong>css</strong></p><pre class="brush:css;toolbar:false">.userimg{width:100%}</pre><p>jq<br/></p><pre class="brush:js;toolbar:false">$(document).ready(function(){\r\n&nbsp;var&nbsp;width&nbsp;=&nbsp;$(&#39;.userimg&#39;).css(&#39;width&#39;);\r\n&nbsp;var&nbsp;heig&nbsp;=&nbsp;parseInt(width);//var&nbsp;heig&nbsp;=&nbsp;parseInt(width)*0.75&nbsp;宽高比4:3\r\n&nbsp;heig&nbsp;=&nbsp;heig+&quot;px&quot;;\r\n&nbsp;$(&#39;.userimg&#39;).css(&#39;height&#39;,heig);\r\n&nbsp;//&nbsp;alert(width);\r\n&nbsp;})</pre><p>html<br/></p><pre class="brush:html;toolbar:false">&lt;img&nbsp;src=&quot;....&quot;&nbsp;clacc=&quot;userimg&quot;/&gt;</pre><p><strong>纯css+html:</strong></p><p><strong>css<br/></strong></p><pre class="brush:css;toolbar:false">.img-wrap{\r\n&nbsp;width:&nbsp;30%;&nbsp;/*&nbsp;这里设置占屏幕宽度百分比&nbsp;*/\r\n&nbsp;/*margin:&nbsp;0&nbsp;auto;&nbsp;*/\r\n&nbsp;}\r\n&nbsp;/*&nbsp;创建一个正方形容器&nbsp;*/\r\n&nbsp;.img-container{\r\n&nbsp;width:&nbsp;100%;\r\n&nbsp;height:&nbsp;0px;\r\n&nbsp;padding-bottom:&nbsp;100%;\r\n&nbsp;overflow:hidden;\r\n&nbsp;margin:&nbsp;0;\r\n&nbsp;position:relative;\r\n&nbsp;}\r\n/*&nbsp;采用绝对定位&nbsp;*/\r\n&nbsp;.img-wrap&nbsp;img{\r\n&nbsp;position:absolute;\r\n&nbsp;width:&nbsp;100%;\r\n&nbsp;height:&nbsp;100%;\r\n&nbsp;}</pre><p>html</p><pre class="brush:html;toolbar:false">&lt;div&nbsp;class=&quot;img-wrap&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;img-container&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;img&nbsp;src=&quot;radio1.png&quot;&nbsp;data-mce-src=&quot;radio1.png&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n&lt;/div&gt;</pre><p><br/></p>', '/image/20171222/1513926736564275.png', 3, 2, 'test', 1, 1513926999, 1513926999);
INSERT INTO `posts` (`id`, `title`, `summary`, `content`, `label_img`, `cat_id`, `user_id`, `user_name`, `is_valid`, `created_at`, `updated_at`) VALUES
(12, '手机端地址选择例子(php+HTML+css+js)', '示例:&lt;!DOCTYPEhtml&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n&lt;metacharset=&quot;UTF-8&quot;&gt;', '<p>示例:</p><pre class="brush:html;toolbar:false">&lt;!DOCTYPE&nbsp;html&nbsp;&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta&nbsp;charset=&quot;UTF-8&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta&nbsp;name=&quot;viewport&quot;&nbsp;content=&quot;width=device-width&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&gt;添加地址&lt;/title&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;meta&nbsp;name=&quot;viewport&quot;&nbsp;content=&quot;initial-scale=1.0,&nbsp;maximum-scale=1.0,&nbsp;user-scalable=0&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/mobile/css/index2.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/mobile/css/public.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/mobile/pay_css/index.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/mobile/css/LArea.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/bootstrap/css/bootstrap.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;__PUBLIC__/jQuery-2.1.4/jquery.min.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;__PUBLIC__/mobile/js/LArea.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;__PUBLIC__/mobile/js/jquery.json.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;__PUBLIC__/layer/layer.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;script&nbsp;src=&quot;__PUBLIC__/bootstrap/js/bootstrap.js&quot;&gt;&lt;/script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__PUBLIC__/mobile2/css/Mobil_hea_fot.css&quot;/&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;style&nbsp;type=&quot;text/css&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmantop{width:&nbsp;100%;height:&nbsp;50px;border-bottom:&nbsp;1px&nbsp;solid&nbsp;#b5b4b5;text-align:&nbsp;center;color:&nbsp;#898a89;background-color:&nbsp;rgba(248,248,248,0.95)}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmantop&nbsp;span{line-height:&nbsp;50px;font-size:&nbsp;20px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmantop&nbsp;input{float:&nbsp;right;margin-right:&nbsp;15px;line-height:&nbsp;48px;border:0px;height:&nbsp;49px;background-color:&nbsp;rgba(248,248,248,0.95);}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmancon&nbsp;ul&nbsp;li{width:&nbsp;100%;height:&nbsp;50px;padding:6px&nbsp;15px&nbsp;6px&nbsp;15px;border-bottom:&nbsp;1px&nbsp;solid&nbsp;#E5E5E5;line-height:&nbsp;40px;font-size:&nbsp;16px;color:&nbsp;#898a89;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmancon&nbsp;ul&nbsp;li&nbsp;input{width:&nbsp;100%;height:&nbsp;100%;border:&nbsp;0px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addmancon&nbsp;ul&nbsp;li&nbsp;select{width:&nbsp;31%;font-size:&nbsp;12px;height:&nbsp;35px;margin-top:&nbsp;-15px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.default{color:&nbsp;#898a89;font-size:&nbsp;18px;margin:&nbsp;0&nbsp;auto;line-height:&nbsp;32px;margin-top:&nbsp;20px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.default&nbsp;div{width:&nbsp;32px;height:&nbsp;32px;float:&nbsp;left;margin-left:&nbsp;30%}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.default&nbsp;.radioclass{background:url(__PUBLIC__/images/radion2.png)&nbsp;no-repeat&nbsp;center&nbsp;center;width:&nbsp;32px;height:&nbsp;32px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.default&nbsp;.radioclass.active&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background:url(__PUBLIC__/images/radio1.png)&nbsp;no-repeat&nbsp;right&nbsp;center;width:&nbsp;32px;height:&nbsp;32px;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman{&nbsp;position:fixed;width:&nbsp;100%;height:&nbsp;100%;background-color:&nbsp;#fff;top:0px;overflow:&nbsp;auto;right:&nbsp;-100%;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;.glyphicon-menu-left{float:&nbsp;left;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;ul&nbsp;li{width:&nbsp;100%;height:&nbsp;50px;padding:6px&nbsp;15px&nbsp;6px&nbsp;15px;border-bottom:&nbsp;1px&nbsp;solid&nbsp;#E5E5E5;line-height:&nbsp;40px;font-size:&nbsp;16px;color:&nbsp;#898a89;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;ul&nbsp;li&nbsp;.glyphicon-menu-right{float:&nbsp;right;line-height:&nbsp;40px;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;ul&nbsp;.li1{border-bottom:&nbsp;1px&nbsp;solid&nbsp;#E5E5E5;height:&nbsp;30px;line-height:&nbsp;20px;font-size:&nbsp;14px;width:&nbsp;100%;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;ul&nbsp;.li1&nbsp;.col-md-4{width:&nbsp;33%;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.addman&nbsp;ul&nbsp;.li1&nbsp;#left{color:&nbsp;#0094DE;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/style&gt;\r\n&lt;/head&gt;\r\n&lt;body&nbsp;style=&quot;margin:0&nbsp;auto;&quot;&gt;\r\n&lt;form&nbsp;action=&quot;{:U(&#39;Address/doAddaddress&#39;)}&quot;&nbsp;id=&quot;addman_form&quot;&nbsp;method=&quot;post&quot;&nbsp;onSubmit=&quot;return&nbsp;checkForm()&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;addmantop&quot;&nbsp;style=&quot;background:&nbsp;black;color:&nbsp;white&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;a&nbsp;class=&quot;sb-back&quot;&nbsp;href=&quot;{:U(&#39;Address/addressList&#39;)}&quot;&nbsp;style=&quot;float:&nbsp;left;padding-top:&nbsp;12px;margin-left:&nbsp;10px;&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;img&nbsp;class=&quot;&quot;&nbsp;src=&quot;__PUBLIC__/images/back.png&quot;&nbsp;style=&quot;height:&nbsp;25px;&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/a&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&gt;地址管理&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;submit&quot;&nbsp;name=&quot;&quot;&nbsp;&nbsp;value=&quot;保存&quot;&nbsp;style=&quot;background:&nbsp;black&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;addmancon&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;consignee&quot;&nbsp;placeholder=&quot;姓名&quot;&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;phone&quot;&nbsp;placeholder=&quot;手机号码&quot;&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&quot;demo1&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;demo2&quot;&gt;省份、城市、区县&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;hidden&quot;&nbsp;name=&quot;pre&quot;&nbsp;id=&quot;prov&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;hidden&quot;&nbsp;name=&quot;city&quot;&nbsp;id=&quot;city&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;hidden&quot;&nbsp;name=&quot;area&quot;&nbsp;id=&quot;area&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/li&gt;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;detailed&quot;&nbsp;placeholder=&quot;详细地址，街道，楼牌号&quot;&nbsp;value=&quot;&quot;&nbsp;/&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;default&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;radioclass&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;hidden&quot;&nbsp;name=&quot;default&quot;&nbsp;id=&quot;default&quot;&nbsp;value=&quot;&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&nbsp;type=&quot;hidden&quot;&nbsp;name=&quot;current&quot;&nbsp;id=&quot;current&quot;&nbsp;value=&quot;&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;&amp;nbsp;&nbsp;设为默认地址\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&nbsp;&lt;input&nbsp;type=&quot;checkbox&quot;&nbsp;id=&quot;chk&quot;&nbsp;value=&quot;&quot;&nbsp;/&gt;&nbsp;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;addman&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;div&nbsp;class=&quot;addmantop&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;houtui&quot;&nbsp;class=&quot;glyphicon&nbsp;glyphicon-menu-left&quot;&gt;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&gt;选择地址&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;ul&nbsp;class=&quot;rightNav&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;class=&quot;li1&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;left&quot;&nbsp;class=&quot;col-md-4&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;省份&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;content&quot;&nbsp;class=&quot;col-md-4&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;城市&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;right&quot;&nbsp;class=&quot;col-md-4&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;区县&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;volist&nbsp;name=&quot;good1&quot;&nbsp;id=&quot;vo&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&nbsp;id=&#39;{$vo.id}&#39;&nbsp;class=&#39;prov&#39;&gt;{$vo.name}&lt;span&nbsp;class=&#39;glyphicon&nbsp;glyphicon-menu-right&#39;&gt;&lt;/span&gt;&lt;/li&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/volist&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;/div&gt;\r\n&lt;/form&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;addman=$(&quot;.addman&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;rightNav=$(&quot;.rightNav&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;vo&nbsp;=&nbsp;{$tree};\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#demo1&quot;).click(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;prov&nbsp;=&nbsp;$(&quot;.prov&quot;);\r\n//alert(prov.length);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addman.css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//display:&nbsp;&quot;block&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;right:&nbsp;&quot;0px&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;transition:&nbsp;&quot;right&nbsp;0.5s&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(prov.length&lt;1)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.cit&quot;).remove();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.area&quot;).remove();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#left&quot;).text(&#39;省份&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#content&quot;).text(&#39;城市&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#right&quot;).text(&#39;区县&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#left&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#0094DE&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#content&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#898a89&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#right&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#898a89&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(vo);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(var&nbsp;i&nbsp;=&nbsp;0;&nbsp;i&nbsp;&lt;&nbsp;vo.length;&nbsp;i++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;pre&nbsp;=&nbsp;&quot;&lt;li&nbsp;id=&#39;&quot;+vo[i][&#39;id&#39;]+&quot;&#39;&nbsp;class=&#39;prov&#39;&gt;&quot;+vo[i][&#39;name&#39;]+&quot;&lt;span&nbsp;class=&#39;glyphicon&nbsp;glyphicon-menu-right&#39;&gt;&lt;/span&gt;&lt;/li&gt;&quot;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rightNav.append(pre);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.prov&quot;).click(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;id=$(this).attr(&quot;id&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;name=$(this).text();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#left&quot;).text(name);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#prov&quot;).val(id);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#left&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#898a89&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#content&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#0094DE&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;city_ajax(id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#houtui&quot;).click(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addman.css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//display:&nbsp;&quot;none&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;right:&nbsp;&quot;-100%&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;transition:&nbsp;&quot;right&nbsp;0.5s&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;city_ajax(id){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$.ajax({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:&nbsp;&#39;POST&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url:&nbsp;&quot;{:U(&#39;Address/ajaxCityList&#39;)}&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data:&quot;lid=&quot;+id,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;success:&nbsp;function(data){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(data);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;jnobj=JSON.parse(data);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(jnobj);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.prov&quot;).remove();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(var&nbsp;a&nbsp;=&nbsp;0;&nbsp;a&nbsp;&lt;&nbsp;jnobj.length;&nbsp;a++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;op&nbsp;=&nbsp;&quot;&lt;li&nbsp;id=&#39;&quot;+jnobj[a][&#39;id&#39;]+&quot;&#39;&nbsp;class=&#39;cit&#39;&gt;&quot;+jnobj[a][&#39;name&#39;]+&quot;&lt;span&nbsp;class=&#39;glyphicon&nbsp;glyphicon-menu-right&#39;&gt;&lt;/span&gt;&lt;/li&gt;&quot;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rightNav.append(op);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.cit&quot;).click(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;cid=$(this).attr(&quot;id&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;cname=$(this).text();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#content&quot;).text(cname);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#city&quot;).val(cid);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#content&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#898a89&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#right&quot;).css({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;color:&quot;#0094DE&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$.ajax({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:&nbsp;&#39;POST&#39;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;url:&nbsp;&quot;{:U(&#39;Address/ajaxCityList&#39;)}&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data:&quot;lid=&quot;+cid,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;success:&nbsp;function(data){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;jnobj=JSON.parse(data);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//console.log(jnobj);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.cit&quot;).remove();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(var&nbsp;b&nbsp;=&nbsp;0;&nbsp;b&nbsp;&lt;&nbsp;jnobj.length;&nbsp;b++)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//声明option.&lt;option&nbsp;value=&quot;pres[i]&quot;&gt;Pres[i]&lt;/option&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;op1&nbsp;=&nbsp;&quot;&lt;li&nbsp;id=&#39;&quot;+jnobj[b][&#39;id&#39;]+&quot;&#39;&nbsp;class=&#39;area&#39;&gt;&quot;+jnobj[b][&#39;name&#39;]+&quot;&lt;/li&gt;&quot;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//添加\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rightNav.append(op1);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.area&quot;).click(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;aid=$(this).attr(&quot;id&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;aname=$(this).text();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#right&quot;).text(aname);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#area&quot;).val(aid);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;manaddress&nbsp;=&nbsp;$(&quot;.li1&quot;).text();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#demo2&quot;).html(manaddress);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;addman.css({right:&nbsp;&quot;-100%&quot;,transition:&nbsp;&quot;right&nbsp;0.5s&quot;,});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;current=window.location.href;;\r\n&nbsp;&nbsp;&nbsp;&nbsp;window.onload&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#current&quot;).val(current);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;.radioclass&quot;).click(function()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if($(this).hasClass(&quot;active&quot;))&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(this).removeClass(&quot;active&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#default&quot;).val(0);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(this).addClass(&quot;active&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(&quot;#default&quot;).val(1);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;checkMobile(tel)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;reg&nbsp;=&nbsp;/(^1[3|4|5|7|8][0-9]{9}$)/;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(reg.test(tel))&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;checkForm()\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if($(&#39;input[name=&quot;consignee&quot;]&#39;).val()==&#39;&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;收货人不能为空&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if($(&#39;input[name=&quot;pre&quot;]&#39;).val()==&#39;&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;请选择省份&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if($(&#39;input[name=&quot;city&quot;]&#39;).val()==&#39;&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;请选择城市&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if($(&#39;input[name=&quot;area&quot;]&#39;).val()==&#39;&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;请选择区域&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if($(&#39;input[name=&quot;detailed&quot;]&#39;).val()==&#39;&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;请填写地址&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;if(!checkMobile($(&#39;input[name=&quot;phone&quot;]&#39;).val()))\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;layer.alert(&#39;手机号码格式有误&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&lt;/script&gt;\r\n&lt;!--&lt;include&nbsp;file=&quot;Public/wxshare&quot;/&gt;--&gt;\r\n&lt;/body&gt;\r\n&lt;/html&gt;</pre><p><br/></p>', '/image/20171222/1513927051108917.png', 1, 2, 'test', 1, 1513927215, 1513927215),
(13, '微信支付示例', '示例:', '<p>示例:</p>', '/image/20171222/1513927289301179.png', 4, 2, 'test', 1, 1513927340, 1513927340),
(14, 'php性能优化简析', '解决方向工具curl(如请求接口时可能需要)PHP性能分析工具', '<p>解决方向</p><p><br/><img src="/image/20171225/1514182551875094.png" title="1514182551875094.png" alt="blob.png" width="807" height="314" style="width: 807px; height: 314px; float: left;"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>工具</p><p><img src="/image/20171225/1514182710810804.png" title="1514182710810804.png" alt="blob.png" width="787" height="405" style="width: 787px; height: 405px;"/></p><p><br/></p><p><strong>curl(如请求接口时可能需要)</strong></p><p><img src="/image/20171225/1514187390906851.png" title="1514187390906851.png" alt="blob.png" width="822" height="508" style="width: 822px; height: 508px;"/></p><p>PHP性能分析工具</p><p><img src="/image/20171225/1514188783508119.png" title="1514188783508119.png" alt="blob.png" width="809" height="305" style="width: 809px; height: 305px;"/></p>', '/image/20171225/1514182332342963.png', 5, 2, 'test', 1, 1514182730, 1514188822);

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
(1, 1, 1, 0, 0, 0),
(2, 2, 9, 0, 0, 0),
(3, 3, 6, 0, 0, 0),
(4, 4, 11, 0, 0, 0),
(5, 5, 8, 0, 0, 0),
(6, 6, 16, 0, 0, 0),
(7, 7, 5, 0, 0, 0),
(8, 8, 2, 0, 0, 0),
(9, 9, 3, 0, 0, 0),
(10, 10, 2, 0, 0, 0),
(11, 11, 6, 0, 0, 0),
(12, 12, 3, 0, 0, 0),
(13, 13, 1, 0, 0, 0),
(14, 14, 13, 0, 0, 0);

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
(2, 1, 2),
(3, 2, 1),
(4, 3, 3),
(6, 5, 5),
(9, 8, 7),
(10, 8, 8),
(11, 8, 9),
(12, 9, 5),
(13, 9, 4),
(14, 10, 10),
(15, 10, 11),
(16, 10, 12),
(17, 11, 3),
(18, 11, 5),
(19, 11, 4),
(20, 12, 5),
(21, 12, 3),
(22, 12, 4),
(23, 12, 13),
(24, 12, 7),
(25, 13, 14),
(26, 13, 6),
(29, 14, 7),
(30, 7, 6),
(31, 7, 7),
(33, 4, 4);

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
(1, '标签1', 2),
(2, '标签2', 1),
(3, 'CSS', 3),
(4, 'JQ', 6),
(5, 'HTML', 4),
(6, 'thinkPHP', 3),
(7, 'php', 7),
(8, '设计模式', 1),
(9, '单例模式', 1),
(10, 'xampp', 1),
(11, 'mysql', 1),
(12, 'phpmyadmin', 1),
(13, 'ajax', 1),
(14, '微信支付', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_sign`
--

CREATE TABLE `t_user_sign` (
  `id` bigint(20) NOT NULL COMMENT '签到表id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '签到者id',
  `signcount` int(11) DEFAULT '0' COMMENT '连续签到次数',
  `count` int(11) DEFAULT '0' COMMENT '签到次数',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `signHistoy` varchar(500) DEFAULT NULL COMMENT '签到历史时间 以逗号隔开',
  `singYM` int(11) NOT NULL COMMENT '签到的年,月(y-m-1的时间戳)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user_sign`
--

INSERT INTO `t_user_sign` (`id`, `user_id`, `signcount`, `count`, `lastModifyTime`, `signHistoy`, `singYM`) VALUES
(4, 2, 1, 5, '2018-01-04 13:05:53', '[1,2,3,4,5]', 1514736000);

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
(1, 'admin', 'Hpd8EyhH_M0H-I23MZhz1xAAsfjme-x_', '$2y$13$cjCifRQTl9lD/mPe0S8dpu7HDR1rY60BgKQw1OBxCoqaic52rMAK2', '', '', '727817393@qq.com', 0, 0, '', 0, 1512544223, 1513588704),
(2, 'test', 'tpBGjAjA536GdXKZ2yFOocE3LsikkcEW', '$2y$13$BVFnxu1FH1LQZGj8KGje7uTM7kkQht0PpiMNxNGnylgeTiI7PJu/2', '', '', '11111111@qq.com', 0, 10, '/statics/images/111.jpg', 0, 1512549251, 1512549251),
(3, 'test01', 'jWzeUjakb-jPacihWUvanJEy9obnHrmk', '$2y$13$lWDAhDFqC1LOdvkYnnVGb.xsT8kPRNgFkdbpj0wi1JuwKtQhtKgSC', '', '', '1243452@qq.com', 0, 10, '', 0, 1512610168, 1513648432),
(4, '11111test02', 'wNZi3IKH5909PCUh8UrfijVIbb64ZJ_b', '$2y$13$YIyJeN6eyA2BtqTqRsYte.g0f3aU0zXqp9Bblg0l9DHt7kMuBbW.q', '', '', 'jjjj@qq.com', 0, 10, '', 0, 1512631939, 1512631939),
(5, 'cs11111', 'zJ0XyL9oCmJ-e8xlpzYEbo0eov1NAn90', '$2y$13$VFuPE3VeUQ.DkkApYlRk2uAWBTXQ.CR/nK7AtGoLFsQFoyWS87q6G', '', '', '111111111@qq.com', 0, 10, '', 0, 1513734983, 1513734983),
(6, 'cs22222', 'C7CmUT5u40UUZqqHFnwLrGN-a49gah9O', '$2y$13$JxUYAMRVRINa43qovdC7deflftNSjbthFaB2Yz0SLXd6Ppw8y4sSK', '', '', '111111112@qq.com', 0, 10, '', 0, 1513735048, 1513735048),
(7, 'cs33333', 'yNTd0SMM32l69QckVdds9fX81m97jAul', '$2y$13$iPsM1x4EF49rJGNNcJnize6rkmdp.FuxeO3mLNzkEcBlJJleceB6y', '', '', '11111113@qq.com', 0, 10, '/image/20171220/1513735527123841.png', 0, 1513736021, 1513736021),
(8, 'cs55555', 'Jh6IicndLO7TQmy23ef84mYopynQBDVg', '$2y$13$AdL4ip5akhg1fni3UbsJQOfThfE31fmKR0.SxDg15ZTorrETPlppC', '', '', '11111115@qq.com', 0, 10, '/image/20171220/1513736631350192.png', 0, 1513736640, 1513736640);

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
-- Indexes for table `t_user_sign`
--
ALTER TABLE `t_user_sign`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `post_extends`
--
ALTER TABLE `post_extends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `relation_post_tags`
--
ALTER TABLE `relation_post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `t_user_sign`
--
ALTER TABLE `t_user_sign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '签到表id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
