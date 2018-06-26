<%@page import="com.model.pojo.Page"%>
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
<base href="<%=basePath%>" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单列表</title>
<!--dynamic table-->
<link href="js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="js/data-tables/DT_bootstrap.css" />

<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
 <!--分页-->
<link href="kkpager/css/kkpager_blue.css" rel="stylesheet">
</head>

<body class="sticky-header" style="background-color: #EFF0F4">

<section> <!-- main content start-->
	<div class="main-content">
	<!-- page heading start-->
	<div class="page-heading">
					<h3>菜单列表</h3>
					<ul class="breadcrumb">
							<li>菜单管理</li>
						<li class="active"> 菜单列表 </li>
					</ul>
				</div>
				<!-- page heading end-->

		<!--body wrapper start-->
		<div class="wrapper">
			<div class="row">
				<div class="col-sm-12">
					<section class="panel"> 
					<header class="panel-heading">
					<span class="fa fa-external-link"></span> 
					&nbsp;菜单列表
					 <span class="pull-right"> 
						<a href="view/user/user-add.jsp" class="btn btn-success" style="margin-top: -5px"><span class="fa fa-plus"></span>&nbsp;增加菜单</a>
					</span>	
					</header>
					<center>
						<!--search start-->
				            <input type="text" class="form-control" name="keyword" placeholder="搜索..." style="width: 30%;margin-top: 20px" />
				        <!--search end-->
			        </center>
					<div class="panel-body">
						<div class="adv-table">
							<table class="display table-bordered table-striped"
								id="dynamic-table" style="text-align: center;">
								<thead>
									<tr>
										<th style="text-align: center;">编号</th>
										<th style="text-align: center;">二级菜单名称</th>
										<th style="text-align: center;">请求路径</th>
										<th style="text-align: center;">隶属于</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody id="menutable">
								

								</tbody>
							</table>
						</div>
					</div>
					</section>
				</div>
			</div>
		<!-- 分页部分 -->
		<div id="kkpager"></div>
		<!-- end 分页 -->
		

		</div>
		<!--body wrapper end-->
	</div>
	<!-- main content end--> </section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="js/scripts.js"></script>
	<script type="text/javascript" src="kkpager/js/kkpager.min.js"></script>
	<script>
	/*分页*/
	var search;
	$(function() {
		search=$("#search").val();
		$.ajax({
			url : 'menuController/getAllMenuPage.ajax',
			type : 'POST',
			dataType : 'text',
			data : {

			},
			success : function(page) {
				var page = eval("(" + page + ")");
				//生成分页控件  
				kkpager.generPageHtml({
					pno : '1',
					mode : 'click', //设置为click模式
					//总页码  
					total : page.total,
					//总数据条数  
					totalRecords : page.totalRecords,
					//点击页码、页码输入框跳转、以及首页、下一页等按钮都会调用click
					//适用于不刷新页面，比如ajax
					click : function(n) {
						//这里可以做自已的处理
						showpage(n);
						//处理完后可以手动条用selectPage进行页码选中切换
						this.selectPage(n);
					},
					//getHref是在click模式下链接算法，一般不需要配置，默认代码如下
					getHref : function(n) {
						return '#';
					}
				});
			},
			error : function() {

			}
		});
		showpage(1);
	})
	
	function showpage(n) {
		
		$.ajax({
			url : 'menuController/queryAllMenu.ajax',
			type : 'POST',
			data : {
				n : n,
				search:search 
			},
			dataType : 'text',
			success : function(result) {
				var user = eval("(" + result + ")");
				$("#menutable").html("");
				var i = 1;
				$.each(user, function(n, val) {
					
					$("#menutable").append(
						"<tr ><td>"+i+"</td><td>"+val.twoMenuName+"</td><td>"+val.twoMenuUrl+
						"</td><td>"+val.oneMenuName+"</td><td><a class='btn btn-warning' type='button' href='userController/resetPwd.do?userId="+val.userId+
								"'><span class='fa fa-repeat'></span>&nbsp;重置密码</a><a class='btn btn-info' type='button' href='userController/updatePrepareUser.do?userId="+val.userId+
								"'><span class='fa fa-edit'></span>&nbsp;编辑</a><a class='btn btn-danger' type='button' href='userController/deleteUser.do?userId="+val.userId+
										"'><span class='fa fa-trash-o'></span>&nbsp;删除</a></td></tr>"); 
				i++;
				
				});
			},
			error : function() {

			}
		});
	}
	
	
	$("#btn").click(function(){
		var s = $("#search").val();
		window.location.href = ""+s;
	}) 
	</script>
</body>

</html>