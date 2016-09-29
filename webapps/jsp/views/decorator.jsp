<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>
    <sitemesh:write property='title' />
</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- 引入自定义css -->
<link href="/css/basecss.css" rel="stylesheet">
<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
 <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
 <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
 <![endif]-->
<sitemesh:write property='head' />
<style type="text/css">
.navbar-default {
  background-color: #086cd1;
  border-color: #055fb7;
}
.navbar-default .navbar-brand {
  color: #ecf0f1;
  font-size: 20px;
}
.navbar-default .navbar-brand:hover,
.navbar-default .navbar-brand:focus {
  color: #ecf0f1;
}
.navbar-default .navbar-text {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > a {
  color: #ecf0f1;
  font-size: 16px;
}
.navbar-default .navbar-nav > li > a:hover,
.navbar-default .navbar-nav > li > a:focus {
  color: #25b2d6;
}
.navbar-default .navbar-nav > li > .dropdown-menu {
  background-color: #086cd1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a {
  color: #ecf0f1;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
  color: #25b2d6;
  background-color: #055fb7;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
  background-color: #055fb7;
}
.navbar-default .navbar-nav .open .dropdown-menu > .active > a,
.navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
.navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
  color: #25b2d6;
  background-color: #055fb7;
}
.navbar-default .navbar-nav > .active > a,
.navbar-default .navbar-nav > .active > a:hover,
.navbar-default .navbar-nav > .active > a:focus {
  color: #25b2d6;
  background-color: #055fb7;
}
.navbar-default .navbar-nav > .open > a,
.navbar-default .navbar-nav > .open > a:hover,
.navbar-default .navbar-nav > .open > a:focus {
  color: #25b2d6;
  background-color: #055fb7;
}
.navbar-default .navbar-toggle {
  border-color: #055fb7;
}
.navbar-default .navbar-toggle:hover,
.navbar-default .navbar-toggle:focus {
  background-color: #055fb7;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #ecf0f1;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #ecf0f1;
}
.navbar-default .navbar-link {
  color: #ecf0f1;
}
.navbar-default .navbar-link:hover {
  color: #25b2d6;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #ecf0f1;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #25b2d6;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #25b2d6;
    background-color: #055fb7;
  }
}
</style>
</head>
<body>	
    <header>
    <nav class="navbar navbar-default " role="navigation" >
	<div class="container-fluid"> 
		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#example-navbar-collapse" aria-expanded="false">
				<span class="sr-only">切换导航</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" >三元福达煤业     </a><p class="navbar-text visible-xs" >  ${loginuser.username} | ${loginuser.department}  </p>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
						<li><a href="/item/index" >物料编码管理</a></li>
						<li><a href="/itemplan/index" >每月计划</a></li>
						<li><a href="/account/index" >出入库信息</a></li>
						<li><a href="/stock/index" >查询库存</a></li>
						<li><a href="/report/index" >使用情况月报</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						设备管理 <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/train/documentindex" >培训管理</a></li>
						<li><a href="/equipment/index" >机电设备管理</a></li>
						<li><a href="/equipmentresume/index" >设备履历信息 </a></li>
						<li><a href="/equipmentresume/addlist" >快速添加设备履历 </a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><p class="navbar-text hidden-xs">${loginuser.username} | ${loginuser.department}</p></li>
				<li><a href="/user/changepassword"  >修改密码</a></li>
				<li><a href="/logout" >退出登录</a></li>
			</ul>
		</div>
	</div>
</nav>
    
    </header>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="/bootstrap/js/bootstrap.js"></script>
    <sitemesh:write property='body' />
</body>
</html>