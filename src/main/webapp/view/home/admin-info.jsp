<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员主页</title>
<!--dynamic table-->
<link href="js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />

<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">

</head>

<body class="sticky-header" style="background-color: #EFF0F4" onload="showtime()">

	<section> <!-- main content start-->
	<div class="main-content">
		<!-- page heading start-->
		<div class="page-heading">
			<h3>信息总览</h3>
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li class="active">信息总览</li>
			</ul>
		</div>
		<!-- page heading end-->

		<!--body wrapper start-->
		<div class="wrapper">
			<div class="row">
				<div class="col-sm-12">
					<section class="panel"> <header class="panel-heading">
					个人账户信息 <span class="tools pull-right"> <a
						href="javascript:;" class="fa fa-chevron-down"></a> <a
						href="javascript:;" class="fa fa-times"></a>
					</span> </header>
					<div class="panel-body">
						<div class="adv-table">
							<table class="display table table-bordered table-striped"
								id="dynamic-table">
									<tr>
										<th style="text-align: center;width: 50%">当前时间</th>
										<td style="text-align: center;width: 50%" id="date"></td>
									</tr>
									<tr>
										<th style="text-align: center;">账号名</th>
										<td  id="loginName" style="text-align: center;">admin</td>
									</tr>
									<tr>
										<th style="text-align: center;">姓名</th>
										<td id="name" style="text-align: center;">admin</td>
									</tr>
									<tr>
										<th style="text-align: center;">登录时间</th>
										<td style="text-align: center;">暂时没有写</td>
									</tr>
									<tr>
										<th style="text-align: center;">浏览器信息</th>
										<td id="browserVersion" style="text-align: center;"></td>
									</tr>
									<tr>
										<th style="text-align: center;">IP地址</th>
										<td id="ip" style="text-align: center;"></td>
									</tr>
								
							</table>
						</div>
					</div>
					</section>
				</div>
			</div>



			<div class="row">
				<div class="col-sm-12">
					<section class="panel"> <header class="panel-heading">
					服务器信息 <span class="tools pull-right"> <a
						href="javascript:;" class="fa fa-chevron-down"></a> <a
						href="javascript:;" class="fa fa-times"></a>
					</span> </header>
					<div class="panel-body">
						<div class="adv-table">
							<table class="display table table-bordered table-striped"
								id="dynamic-table">
								<tr>
										<th style="text-align: center;width: 50%">本系统访问路劲</th>
										<td style="text-align: center;width: 50%"><%=basePath %></td>
									</tr>
									<tr class="gradeX">
										<th style="text-align: center;">服务器名称</th>
										<td id="serverName" style="text-align: center;"></td>
									</tr>
									<tr class="gradeC">
										<th style="text-align: center;">HTML版本</th>
										<td style="text-align: center;">HTML5</td>
									</tr>
									
									<tr class="gradeC">
										<th style="text-align: center;">当前在线人数</th>
										<td id="visitorCount" style="text-align: center;"></td>
									</tr>
									
									<tr class="gradeC">
										<th style="text-align: center;">登录超时时间</th>
										<td id="sessionTimeOut" style="text-align: center;"></td>
									</tr>
									
									<tr class="gradeC">
										<th style="text-align: center;">服务器当前时间</th>
										<td id="serverTime" style="text-align: center;"></td>
									</tr>
							</table>
						</div>
					</div>
					</section>
				</div>
			</div>

		</div>
		<!--body wrapper end-->
	</div>
	<!-- main content end--> </section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<!--dynamic table-->
	<script type="text/javascript" language="javascript"
		src="js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="js/data-tables/DT_bootstrap.js"></script>
	<!--dynamic table initialization -->

	<!--common scripts for all pages-->
	<script src="js/scripts.js"></script>
	<script type="text/javascript" src="js/time.js"></script>
	<script type="text/javascript">
	//获取浏览器信息
	function showBrowserVersion() {
		var userAgent = window.navigator.userAgent;
		$("#browserVersion").text(userAgent);
	}
	
	
	$(function(){
		
		showBrowserVersion();
		
		//获取姓名信息
		$.ajax({
			url:'indexController/getStaName.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
				if(result !=null&&result !="FAIL"){
					$("#name").text(result);
				}else{
					$("#name").text("正在获取。。。");
				}
			},
			error:function(){
				$("#name").text("无法获取");
			}
		});
		
		//获取账户信息
		$.ajax({
			url:'indexController/getUserName.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
				if(result !=null){
					$("#loginName").text(result);
				}else{
					$(".name").text("正在获取。。。");
				}
			},
			error:function(){
				$(".name").text("无法获取");
			}
		});
		
		
		//获取IP地址信息
		$.ajax({
			url:'indexController/getServerIP.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
					$("#ip").text(result);
			},
			error:function(){
				$("#ip").text("无法获取");
			}
		});
		//获取服务器名称信息
		$.ajax({
			url:'indexController/getServerName.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
					$("#serverName").text(result);
			},
			error:function(){
				$("#serverName").text("无法获取");
			}
		});
		//获取访问人数
		setInterval(function()
		 {
		$.ajax({
			url:'indexController/getVisitorCount.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
					$("#visitorCount").text(result);
			},
			error:function(){
				$("#visitorCount").text("无法获取");
			}
		});
		 },5000);
		//获取登录超时时间
		$.ajax({
			url:'indexController/getSessionTimeOut.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
					$("#sessionTimeOut").text(result+"min");
			},
			error:function(){
				$("#sessionTimeOut").text("无法获取");
			}
		});
		
		
		//获取服务器当前时间
		setInterval(function()
		 {
		$.ajax({
			url:'indexController/getServerTime.ajax',
			type:'POST',
			data:{
				
			},
			dataType:'text',
			success:function(result){
					$("#serverTime").text(result);
			},
			error:function(){
				$("#serverTime").text("无法获取");
			}
		});
	},3000);
		
		
	}); 

	</script>
</body>

</html>