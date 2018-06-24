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
<link rel="stylesheet" href="X-admin/css/font.css">
<link rel="stylesheet" href="X-admin/css/xadmin.css">



</head>

<body>
	<div class="x-body">
		<form class="layui-form">
			<div class="layui-form-item">
				<label for="username" class="layui-form-label"> 登录名 </label>
				<div class="layui-input-inline">
					<select id="loginName" name="loginName">

					</select>

				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_email" class="layui-form-label"> 邮箱 </label>
				<div class="layui-input-inline">
					<input type="text" id="L_email" name="email" required=""
						lay-verify="email" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">
					<span class="x-red">*</span>
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_pass" class="layui-form-label"> <span
					class="x-red">*</span>密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_pass" name="pass" required=""
						lay-verify="pass" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> <span
					class="x-red">*</span>确认密码
				</label>
				<div class="layui-input-inline">
					<input type="password" id="L_repass" name="repass" required=""
						lay-verify="repass" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label for="L_repass" class="layui-form-label"> </label>
				<button class="layui-btn" lay-filter="add" lay-submit="">
					增加</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="X-admin/lib/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="X-admin/js/xadmin.js"></script>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var form = layui.form, layer = layui.layer;

			//自定义验证规则
			form.verify({
				nikename : function(value) {
					if (value.length < 5) {
						return '昵称至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				repass : function(value) {
					if ($('#L_pass').val() != $('#L_repass').val()) {
						return '两次密码不一致';
					}
				}
			});

			//监听提交
			form.on('submit(add)', function(data) {
				console.log(data);
				//发异步，把数据提交给php
				layer.alert("增加成功", {
					icon : 6
				}, function() {
					// 获得frame索引
					var index = parent.layer.getFrameIndex(window.name);
					//关闭当前frame
					parent.layer.close(index);
				});
				return false;
			});

		});
	</script>
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
								" <option value='"+loginNameList[i].loginName+"'>"
										+ loginNameList[i].loginName
										+ "</option>");
					}

				},
				error : function() {

				}
			});
		});
	</script>


</body>
</html>