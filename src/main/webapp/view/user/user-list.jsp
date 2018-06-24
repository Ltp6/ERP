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
<base href="<%=basePath%>"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="X-admin/css/font.css">
<link rel="stylesheet" href="X-admin/css/xadmin.css">
<link href="css/style.css" rel="stylesheet">
 <!--启用停用按钮-->
<link rel="stylesheet" type="text/css" href="js/ios-switch/switchery.css" />
 <!--按钮-->
<link href="css/style.css" rel="stylesheet">
 <!--分页-->
<link href="kkpager/css/kkpager_blue.css" rel="stylesheet">
</head>

<body  style="background-color: #EFF0F4">
	<div class="page-heading">
			<h3>用户列表</h3>
			<ul class="breadcrumb">
				<li><a href="#">用户管理</a></li>
				<li class="active">用户列表</li>
			</ul>
		</div>
	<div class="x-body">
		<center>
		<div class="layui-row">
			<form class="layui-form layui-col-md12 x-so">
				<input class="layui-input" placeholder="开始日" name="start" id="start">
				<input class="layui-input" placeholder="截止日" name="end" id="end">
				<input type="text" name="username" placeholder="请输入用户名"
					autocomplete="off" class="layui-input">
				<button class="layui-btn" lay-submit="" lay-filter="sreach">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		</center>
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<button class="layui-btn"
				onclick="x_admin_show('添加用户','view/user/user-add.jsp')">
				<i class="layui-icon"></i>添加
			</button>
			<span class="x-right" style="line-height: 40px">共有数据：××条</span> </xblock>
		<table class="layui-table" style="text-align: center;">
			<thead>
				
				<tr>
					<th  style="text-align: center;">
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>
					<th style="text-align: center;">编号</th>
					<th style="text-align: center;">登录名</th>
					<th style="text-align: center;">邮箱</th>
					<th style="text-align: center;">用户状态</th>
					<th style="text-align: center;">创建时间</th>
					<th colspan="3" style="text-align: center;">操作</th>
			</tr>
			
			</thead>
			<tbody>
			<c:forEach items="${userList }" var="user" varStatus="vs">
			<tr>
						<td >
							<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'>
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td>${vs.count }</td>
						<td>${user.loginName }</td>
						<td>${user.userEmail }</td>
						<td>${user.userStatus }</td>
						<%-- <c:if test="${user.userStatus=='on'}">
							<td>禁用&nbsp;&nbsp;&nbsp;<input type="checkbox" class="js-switch" checked/>&nbsp;&nbsp;&nbsp;启用</td>
						</c:if>
						<c:if test="${user.userStatus!='on'}">
							<td>禁用&nbsp;&nbsp;&nbsp;<input type="checkbox" class="js-switch" />&nbsp;&nbsp;&nbsp;启用</td>
						</c:if> --%>
						<td>${user.userCreatTime }</td>
						<td>
							<button class="btn btn-warning" type="button"><span class="fa fa-repeat"></span>&nbsp;重置密码</button>
							<button class="btn btn-info" type="button" onclick="x_admin_show('编辑','role-add.html')"><span class="fa fa-edit"></span>&nbsp;编辑</button>
							<button class="btn btn-danger" type="button"><i class="layui-icon"></i>删除</button>
						</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 分页部分 -->
		<div id="kkpager"></div>
		<!-- end 分页 -->
	</div>
	<!--ios7-->
	<script src="js/ios-switch/switchery.js" ></script>
	<script src="js/ios-switch/ios-init.js" ></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="X-admin/lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="X-admin/js/xadmin.js"></script>
	<script type="text/javascript" src="kkpager/js/kkpager.min.js"></script>



	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem : '#start' //指定元素
			});

			//执行一个laydate实例
			laydate.render({
				elem : '#end' //指定元素
			});
		});


		function delAll(argument) {

			var data = tableCheck.getData();

			layer.confirm('确认要删除吗？' + data, function(index) {
				//捉到所有被选中的，发异步进行删除
				layer.msg('删除成功', {
					icon : 1
				});
				$(".layui-form-checked").not('.header').parents('tr').remove();
			});
		}
		
		/* /* 分页 \
		var search;
		$(function() {
			search=$("#search").val();
			$.ajax({
				url : 'userController/getAllPage.do',
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
			//显示页面内容
			$.ajax({
				url : 'userController/queryAllUser.ajax',
				type : 'POST',
				data : {
					n : n,
					search:search 
				},
				dataType : 'text',
				success : function(result) {
					var jtable = eval("(" + result + ")");
					$("#peopletable").html("");
					$.each(jtable, function(n, val) {
						$("#peopletable").append(
							"<tr><td ><div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'><i class='layui-icon'>&#xe605;</i></div></td><td>"+
								val.userId+"</td><td>"+val.loginName+"</td><td>"+val.userEmail+
								"</td><td>禁用&nbsp;&nbsp;&nbsp;<input type='checkbox' class='js-switch-blue' checked/>&nbsp;&nbsp;&nbsp;启用</td><td>"+val.userCreatTime+
								"</td><td><button class='btn btn-warning' type='button'><span class='fa fa-repeat'></span>&nbsp;重置密码</button>"+
								"<button class='btn btn-info' type='button' onclick='x_admin_show('编辑','role-add.html')'><span class='fa fa-edit'></span>&nbsp;编辑</button>"+
								"<button class='btn btn-danger' type='button'><i class='layui-icon'></i>删除</button></td></tr>"); 
					});
				},
				error : function() {

				}
			});
		}
		
		
		$("#btn").click(function(){
			var s = $("#search").val();
			window.location.href = ""+s;
		}) */
		
	</script>
</body>

</html>