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
<title>增加用户</title>
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">


</head>

<body class="sticky-header" style="background-color: #EFF0F4" >

	<section> <!-- main content start-->
	<div class="main-content">
		<!-- page heading start-->
		<div class="page-heading">
			<h3>新增用户</h3>
			<ul class="breadcrumb">
				<li>用户管理</li>
				<li class="active">新增用户</li>
			</ul>
		</div>
		<!-- page heading end-->
		<!--body wrapper start-->
		<div class="wrapper">

			<div class="row">
				<div class="col-lg-12">
					<section class="panel"> <header class="panel-heading">
					<span class="fa fa-plus"></span>&nbsp;增加用户 
					<div style="display: inline;margin-left: 40%">
						<span style="visibility: hidden;">占位置啊</span><span id="hint" style="color: red;"></span>
					</div>
					</header>
					
					<div class="panel-body">
						<div class="form">
							<form class="cmxform form-horizontal adminex-form"
								id="signupForm" method="get" action="userController/addUser.do">
								<div class="form-group ">
									<label for="firstname" class="control-label col-md-2">用户名</label>
									<div class="col-md-10">

										<select class="form-control m-bot15" id="loginName" name="loginName">
											
										</select>

									</div>
								</div>
								<div class="form-group ">
									<label for="lastname" class="control-label col-md-2">邮箱</label>
									<div class="col-md-10">
										<input class=" form-control" id="userEmail" name="userEmail"
											type="text" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-md-offset-2 col-md-10">
										<button id="submit" class="btn btn-info" type="submit"><span class="fa fa-check-square-o"></span>&nbsp;提交</button>
										<button id="cancel" class="btn btn-danger" type="button" ><span class="fa fa-undo"></span>&nbsp;返回</button>
									</div>
								</div>
							</form>
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>

	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "userController/queryStaLoginName.ajax",
				type : "POST",
				datatype : "text",
				data : {
					
				},
				success : function(result) {
					var loginNameList = eval("(" + result + ")");
					$("#loginName").html("---请选择工号---");
					for (var i = 0; i < loginNameList.length; i++) {
						$("#loginName").append(
								" <option value='"+loginNameList[i]+"'>"
										+ loginNameList[i] + "</option>");
					}

				},
				error : function() {

				}
			});
		});
		$("#userEmail").keyup(function(){
			
			var userEmail=$("#userEmail").val();
			var str = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
			if(userEmail.match(str)) {
				$("#hint").text("");
				$("#submit").attr("disabled",false);
			} else {
				$("#submit").attr("disabled", true); 
				$("#hint").text("电子邮件地址不合法,请重新输入");
			}
		});
		$("#cancel").click(function(){
			window.location.href="view/user/user-list.jsp";
		});
	</script>


</body>
</html>