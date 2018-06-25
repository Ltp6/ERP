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
<title>重置密码</title>
<link rel="stylesheet" href="css/pintuer.css">
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.error-container {
	background: #fff;
	border: 1px solid #0ae;
	text-align: center;
	width: 450px;
	margin: 250px auto;
	font-family: Microsoft Yahei;
	padding-bottom: 30px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.error-container h1 {
	font-size: 16px;
	padding: 12px 0;
	background: #0ae;
	color: #fff;
}

.errorcon {
	padding: 35px 0;
	text-align: center;
	color: #0ae;
	font-size: 18px;
}

.errorcon i {
	display: block;
	margin: 12px auto;
	font-size: 30px;
}

.errorcon span {
	color: red;
}

h4 {
	font-size: 14px;
	color: #666;
}

a {
	color: #0ae;
}
</style>
<script type="text/javascript">
		//密码修改失败
		var t = 3; //设定跳转的时间 
		setInterval("refer()", 1000); //启动1秒定时 
		function refer() {
				if (t == 0) {
						location = "view/user/user-list.jsp"; //#设定跳转的链接地址 
				}
				document.getElementById('show2').innerHTML = "" + t+ "s后自动"; // 显示倒计时 
				t--; // 计数器递减 
		}
</script>


</head>
<body class="no-skin">
	<div class="error-container">
		<h1>正在修改密码，请稍后。。。。。</h1>
		<c:choose>
			<c:when test="${sf=='SUCCESS'}">
				<div class="errorcon">
					<i class="icon-smile-o"></i>重置密码成功
				</div>
				<h4 class="smaller">
					<span id="show"></span> <a id="href"
						href="<%=basePath%>loginController/login.do">跳转</a>
				</h4>

				<script type="text/javascript">
					var t = 7; //设定跳转的时间 
					setInterval("refer()", 1000); //启动1秒定时 
					function refer() {
						if (t == 0) {
								location = "view/user/user-list.jsp"; //#设定跳转的链接地址  
							}
						document.getElementById('show').innerHTML = "" + (t/2)+ "s后自动"; // 显示倒计时 
						t--; // 计数器递减 
						}
				</script>
			</c:when>
			<c:otherwise>
				<div class="errorcon">
					<i class="icon-frown-o"></i>密码重置失败，请稍后重试。。。。
				</div>
				<h4 class="smaller">
					<span id="show2"></span> <a id="href"
						href="<%=basePath%>view/login/forget_password.jsp">跳转</a>
				</h4>
			
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>