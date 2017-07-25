<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>海大-DMTSCULA</title>
<style type="text/css">
a:HOVER {
	text-decoration: none;
}
a:ACTIVE {
	text-decoration: none;
}
</style>
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.3" href="#">海大-DMTSCULA 后台管理系统</a> <a class="Hui-logo-m l" href="#" title="H-ui.admin">海大-DMTSCULA</a> <span class="Hui-subtitle l">V1.0</span>
	<ul class="Hui-userbar">
		<li>管理员</li>
		<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A"><sec:authentication property="name"/> <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:layer_show('修改密码','${pageContext.request.contextPath}/user/view/pwd/update','600',300)" >修改密码</a></li>
				<li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
			</ul>
		</li>
	</ul>
	<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a> </header>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 架子管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/rack/view/all" href="javascript:void(0)">全部架子</a></li>
					<li><a _href="${pageContext.request.contextPath}/rack/view/add" href="javascript:void(0)">新增常规架子</a></li>
					<li><a _href="${pageContext.request.contextPath}/rack/view/addIrregular" href="javascript:void(0)">新增非常规架子</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 养殖单元管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/breed_unit/view/all" href="javascript:void(0)">全部养殖单元</a></li>
					<li><a _href="${pageContext.request.contextPath}/breed_unit/view/add" href="javascript:void(0)">新增养殖单元</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 记录管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/record/view/all" href="javascript:void(0)">全部记录</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 数据字典<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/dictionary/view/strain/all" href="javascript:void(0)">品系名称</a></li>
					<li><a _href="${pageContext.request.contextPath}/dictionary/view/genotype/all" href="javascript:void(0)">基因型</a></li>
					<li><a _href="${pageContext.request.contextPath}/dictionary/view/sex/all" href="javascript:void(0)">性别</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 备份管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/backUp/view/to_list" href="javascript:void(0)">全部备份</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="${pageContext.request.contextPath}/user/view/all" href="javascript:void(0)">用户管理</a></li>
					<li><a _href="${pageContext.request.contextPath}/role/view/all" href="javascript:void(0)">角色管理</a></li>
					<li><a _href="${pageContext.request.contextPath}/resc/view/all" href="javascript:void(0)">权限管理</a></li>
					<!-- 
						<li><a _href="${pageContext.request.contextPath}/user/view/add" href="javascript:void(0)">新增用户</a></li>
					 -->
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 日志管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<!-- 
					<li><a _href="${pageContext.request.contextPath}/userLog/view/all" href="javascript:void(0)">用户访问日志</a></li>
					 -->
					<li><a _href="${pageContext.request.contextPath}/userLog/view/operationLog" href="javascript:void(0)">用户操作日志</a></li>
				</ul>
			</dd>
		</dl>
		<%-- <dl id="menu-article">
			<dt ><a _href="${pageContext.request.contextPath}/system/view/all" href="javascript:void(0)">
			<i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 系统设置</a></dt>
		</dl> --%>
		<!-- 
			<dl id="menu-article">
				<dt ><a _href="http://fanxing.kugou.com/pk/1012931" href="javascript:void(0)">
				<i class="Hui-iconfont">&#xe634;</i>&nbsp;&nbsp; 酷狗测试</a></dt>
			</dl>
		 -->
	</div>
</aside>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="首 页" data-href="${pageContext.request.contextPath}/welcome">首 页</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="${pageContext.request.contextPath}/welcome.jsp"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script> 
</body>
</html>