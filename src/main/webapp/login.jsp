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
    <title>登陆</title>

    <link href="css/index-style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="">
        <div class="form-signin-heading text-center">
            <img src="images/login-logo.png" alt="" style="width: 118px;height: 113px;"/>
        </div>
         <p id="hint" style="color:red;text-align: center;height: 20px"></p>
        <div class="login-wrap">
            <input id="loginName" name="loginName" type="text" class="form-control" placeholder="请输入用户名" autofocus>
            <input id="password" name="password" type="password" class="form-control" placeholder="请输入密码">

            <button id="login" class="btn btn-lg btn-block btn-success" type="button" style="height: 40px;">
                <span>登录</span>
            </button>

            <div class="registration">
            	
            	<span class="pull-left checkbox" style="">
                	<input id="rememberMe" type="checkbox"><span style="color: green;"> 记住密码</span>
                </span>
                
                <span class="pull-right" style="position: relative;top: 10px;">
                    <!--<a data-toggle="modal" href="#myModal" style="color: green;"> 忘记密码</a>-->
                    <a href="#" style="color: green;"> 忘记密码</a>
                </span>
                
                <a class="" href="#" style="visibility: hidden;">占位子</a>
            </div>
        </div>
    </form>

</div>




<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script type="text/javascript">
$("#loginName").keyup(function(){
	var loginName = $("#loginName").val();
	$.ajax({
		url:"loginController/checkLoginName.ajax",
		type : "POST",
		data:{
			"loginName" : loginName
		},
		dataType : 'text',
		success:function(result){
			switch (result) {
			case "SUCCESS":
				$("#hint").text("")
				break;
			case "FAIL":
				$("#hint").text("用户名错误，请重新输入")
				break;
			}
		}
	})
})

//进行登录处理
$("#login").click(function(){
	var loginName = $("#loginName").val();
	var password = $("#password").val();
	var remember = "false";
	if ($("#rememberMe").prop("checked")) {
		remember = "ture";
	}
	$.ajax({
		url : 'loginController/login.ajax',
		data : {
			loginName : loginName,
			password : password,
			remember : remember
		},
		type : 'POST',
		dataType : 'text',
		success : function(result) {
			switch (result) {
			case "SUCCESS":
				$("#hint").text("")
				window.location.href = "view/home/index.jsp";
				break;
			case "FAIL":
				$("#hint").text("密码错误，请重新输入")
				break;
			}
		},
		error : function() {
		
		}
	});
})



$(function() {
	//获取记住账户状态
	$.ajax({
		url : 'loginController/rememberMe.ajax',
		data : {
		},
		type : 'POST',
		dataType : 'text',
		success : function(result) {
			if(result=="NULL"){
				
			}else{
				$("#rememberMe").attr("checked","checked");
				var user=eval("("+result+")");
				$("#loginName").val(user.loginName);
				$("#password").val(user.password);
			}
		},
		error : function() {
			
		}
	});
});


//忘记账户信息的
$("#rememberMe").change(function(){
	if($("#rememberMe").prop("checked")){
		return;
	}else{
		$.ajax({
			url : 'loginController/removeRememberMe.ajax',
			data : {
			},
			type : 'POST',
			dataType : 'text',
			success : function(result) {
				
			},
			error : function() {
				$("#rememberMe").attr("checked","checked");
			}
		});
	}
})




</script> 






</body>
</html>