<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<!-- 引入 Bootstrap -->
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<!-- 引入自定义css -->
<link href="/css/basecss.css" rel="stylesheet">

</head>
<body>
<div class="navbar">
    	<div class="navbar-inner">
			<div class="container">
			<a class="btn btn-navbar collapsed" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			<a class="navbar-brand" href="#">福达煤业</a> 
			<div class="nav-collapse collapse" id="example-navbar-collapse">
				<ul class="nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							材料管理 <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/item/index" target="_content">物料编码管理</a></li>
							<li><a href="/itemplan/index" target="_content">每月计划</a></li>
							<li><a href="/account/index" target="_content">出入库信息</a></li>
							<li><a href="/stock/index" target="_content">查询库存</a></li>
							<li><a href="/report/index" target="_content">使用情况月报</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							设备管理 <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/train/documentindex" target="_content">培训管理</a></li>
							<li><a href="/equipment/index" target="_content">机电设备管理</a></li>
							<li><a href="/equipmentresume/index" target="_content">设备履历信息 </a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav pull-right">
					<li>
		        		<a href="#">${loginuser.username} | ${loginuser.department}</a>
		        	</li>
					<li class="divider-vertical"></li>
		        	<li><a href="/user/changepassword" >修改密码</a><a href="/logout" >退出登录</a></li>
		        </ul>
			</div>
		</div>
	</div>
</div>
	
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="/bootstrap/js/bootstrap.js"></script>
</body>
</html>