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
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职工调配</title>

<!--ios7-->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/ios-switch/switchery.css" />

<!--icheck-->
<link href="<%=basePath%>js/iCheck/skins/minimal/minimal.css"
	rel="stylesheet">
<link href="<%=basePath%>js/iCheck/skins/minimal/blue.css"
	rel="stylesheet">
<link href="<%=basePath%>js/iCheck/skins/square/blue.css"
	rel="stylesheet">
<link href="<%=basePath%>js/iCheck/skins/flat/blue.css" rel="stylesheet">

<link href="<%=basePath%>css/style.css" rel="stylesheet">
<link href="<%=basePath%>css/jquery.stepy.css" rel="stylesheet">
<link href="<%=basePath%>css/style-responsive.css" rel="stylesheet">



<script type="text/javascript"
	src="<%=basePath%>calendar/laydate/laydate.js"></script>

<script>
	laydate.render({
		elem : '#test1',
		type : 'datetime',
		theme : 'molv'
	});
</script>

      


</head>
<body>
<body class="sticky-header">
		<!-- page heading start-->
		<div class="page-heading">
			<h3>职工调动</h3>
			<ul class="breadcrumb">
				<li><a href="<%=basePath%>studentController/student.do">职工管理</a>
				</li>
				<li class="active">新增职工</li>
			</ul>
		</div>



		<!--职工调动-->

		<div class="row">
			<div class="col-lg-12">
				<section class="panel"> <header class="panel-heading">职工调动</header>
				<div class="panel-body">
					<div class="form">
						<form class="cmxform form-horizontal adminex-form" id="signupForm"
							method="post"
							action="<%=basePath%>depPostController/staffTransfer.do">
					<input type="hidden" placeholder="" class="form-control"
										name="staId" value="${staffInfo.staId}" > 
							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">工号</label>
								<div class="col-lg-10">
									<input type="button" placeholder="" class="form-control"
										name="loginName" value="${staffInfo.loginName}" > 
								</div>
							</div>
							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">姓名</label>
								<div class="col-lg-10">
									<input type="button" placeholder="姓名" class="form-control"
										name="staName" value="${staffInfo.staName}">
								</div>
							</div>

							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">所属部门</label>
								<div class="col-lg-10">
									<input type="button" placeholder="" class="form-control"
										name="depName" value="${staffInfo.depName}">
								</div>
							</div>
							
							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">当前职务</label>
								<div class="col-lg-10">
									<input type="button" placeholder="" class="form-control"
										name="postName" value="${staffInfo.postName}">
								</div>
							</div>
						
							<div class="form-group ">
								<label for="confirm_password" class="control-label col-lg-2">部门</label>
								<div class="col-lg-10">

									<select class="form-control m-bot15" id='dep' name="depId">
										<option value="">请选择部门</option>
									</select>

								</div>
							</div>

							<div class="form-group ">
								<label for="confirm_password" class="control-label col-lg-2">职务</label>
								<div class="col-lg-10">

									<select class="form-control m-bot15" id='pos' name="postId">
										<option value="">请选择职务</option>
									</select>

								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-primary" type="submit">确认</button>
									<a class="btn btn-default" type="button"
										href="<%=basePath%>DepPostController/queryStaff.do">返回</a>
								</div>
							</div>



						</form>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
	<!--body wrapper end--> </section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
	<script src="<%=basePath%>js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="<%=basePath%>js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=basePath%>js/jquery.validate.min.js"></script>
	<script src="<%=basePath%>js/jquery.stepy.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/modernizr.min.js"></script>
	<script src="<%=basePath%>js/jquery.nicescroll.js"></script>
	<script type='text/javascript' src='<%=basePath %>js/card.js'></script>
	<script type="text/javascript">  
	$(function() {  
	    $.post("<%=basePath%>depPostController/search.do?flag=getOne",  
	    function(data) {  
	        var dataObj = eval("(" + data + ")");  
	        for (var i = 0; i < dataObj.length; i++) {  
	            var $option = $("<option></option>");  
	            $option.attr("value", dataObj[i].depId);  
	            $option.text(dataObj[i].depName);  
	            $("#dep").append($option);  
	        }  
	    });  
	      
	    $("#dep").change(function() {  
	        var jsonObj = {  
	        		depId: $(this).val()  
	        };  
	        $("#pos option[value!='']").remove();  
	        $.post("<%=basePath%>depPostController/search.do?flag=getTwo&acaId=" + $("#dep").val(), jsonObj,  
	        function(data, textStatus) {  
	            var dataObj = eval("(" + data + ")");  
	            for (var i = 0; i < dataObj.length; i++) {  
	                var $option = $("<option></option>");  
	                $option.attr("value", dataObj[i].postId);  
	                $option.text(dataObj[i].postName);  
	                $("#pos").append($option);  
	            }  
	        });  
	    });  
	});   
    </script>
	<!--common scripts for all pages-->
	<script src="<%=basePath%>js/scripts.js"></script>


	<!--ios7-->
	<script src="<%=basePath%>js/ios-switch/switchery.js"></script>
	<script src="<%=basePath%>js/ios-switch/ios-init.js"></script>

	<!--icheck -->
	<script src="<%=basePath%>js/iCheck/jquery.icheck.js"></script>
	<script src="<%=basePath%>js/icheck-init.js"></script>

</body>
</html>