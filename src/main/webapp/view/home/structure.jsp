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
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/demo.css" type="text/css">  -->
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-datepicker/css/datepicker-custom.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-timepicker/css/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-datetimepicker/css/datetimepicker-custom.css" />
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
</head>
<body class="bodypg">
	<!--  -->

	<!-- 引用模板 -->
	<div class="main container">
		<div class="row">
			<div class="col-sm-3 col-xs-12">
				<div class="pro-list bodypg">
					<div class="list-head">
						<h2 style="margin-top: 0px">公司组成</h2>
					</div>
					<ul id="treeDemo" class="ztree" style="font-size: 50px"></ul>
				</div>

			</div>
			<div class="col-sm-9 col-xs-12">


				<div class="pro-show">
					<div class="list-head">
						<h2 style="margin-top: 0px">人员信息</h2>
					</div>
					<!-- <iframe src="view/home/index.jsp" scrolling="yes" name="infomation" style="width: 100%;height: 600px"></iframe> -->

					<!-- 人员信息 -->
						<div class="row">
							<div class="col-md-12">
								<div class="panel-body">
									<form action="#" class="form-horizontal ">

										<div class="form-group">
											<label class="control-label col-md-3">姓名</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staName" id="staName"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">性别</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staSex" id="staSex"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">联系方式</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staTel" id="staTel"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">入职时间</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staIntime" id="staIntime"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">家庭住址</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staAddress" id="staAddress"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">教育水平</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staEdu" id="staEdu"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">身份证号</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staIdcard" id="staIdcard"/> 
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">状态</label>
											<div class="col-md-4 col-xs-11">
												<input
													class="form-control form-control-inline input-medium default-date-picker"
													size="16" type="text" value="请先选择员工" readonly="readonly" name="staStatus" id="staStatus"/> 
											</div>
										</div>
										

									</form>
								</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.all.min.js"></script>
<script type="text/javascript">
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : 0
			}
		},
		callback : {
			onClick : zTreeOnclick
		}

	};
	/* 对Json对象中的时间转换函数  */
	 Date.prototype.format = function(fmt) {
	        var o = {
	            "M+" : this.getMonth() + 1, //月份 
	            "d+" : this.getDate(), //日 
	            "h+" : this.getHours(), //小时 
	            "m+" : this.getMinutes(), //分 
	            "s+" : this.getSeconds(), //秒 
	            "q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
	            "S" : this.getMilliseconds()
	        //毫秒 
	        };
	        if (/(y+)/.test(fmt))
	            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
	                    .substr(4 - RegExp.$1.length));
	        for ( var k in o)
	            if (new RegExp("(" + k + ")").test(fmt))
	                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
	                        : (("00" + o[k]).substr(("" + o[k]).length)));
	        return fmt;
	    } 
	function zTreeOnclick(event, treeId, treeNode) {
		if (treeNode.level == '2') {
			var staffId = treeNode.id;
			/* console.log(staffId); */
			$.ajax({
				url : "initStructureController/selectStaff.ajax",
				type : "POST",
				data : {
					staffId : staffId
				},
				dataType : "json",
				success : function(data) {
					/* value="<fmt:formatDate value="${rb.replyTime}" pattern="yyyy-MM-dd"/>" */
					
					console.log(data);
					
					$("#staName").val(data.staName);
					$("#staSex").val(data.staSex);
					$("#staIntime").val(new Date(data.staIntime).format("yyyy-MM-dd"));
					$("#staStatus").val(data.staStatus);
					$("#staAddress").val(data.staAddress);
					$("#staEdu").val(data.staEdu);
					$("#staIdcard").val(data.staIdcard);
					$("#staTel").val(data.staTel);
				},
				error : function() {
					alert("出错啦");
				}
			})
		}

	}

	/* var zNodes =[
		{ id:1, pId:0, name:"父节点1 - 展开", open:true},
		{ id:11, pId:1, name:"父节点11 - 折叠"},
		{ id:111, pId:11, name:"叶子节点111"},
		{ id:112, pId:11, name:"叶子节点112"},
		{ id:113, pId:11, name:"叶子节点113"},
		{ id:114, pId:11, name:"叶子节点114"},
		{ id:12, pId:1, name:"父节点12 - 折叠"},
		{ id:121, pId:12, name:"叶子节点121"},
		{ id:122, pId:12, name:"叶子节点122"},
		{ id:123, pId:12, name:"叶子节点123"},
		{ id:124, pId:12, name:"叶子节点124"},
		{ id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true},
		{ id:2, pId:0, name:"父节点2 - 折叠"},
		{ id:21, pId:2, name:"父节点21 - 展开", open:true},
		{ id:211, pId:21, name:"叶子节点211"},
		{ id:212, pId:21, name:"叶子节点212"},
		{ id:213, pId:21, name:"叶子节点213"},
		{ id:214, pId:21, name:"叶子节点214"},
		{ id:22, pId:2, name:"父节点22 - 折叠"},
		{ id:221, pId:22, name:"叶子节点221"},
		{ id:222, pId:22, name:"叶子节点222"},
		{ id:223, pId:22, name:"叶子节点223"},
		{ id:224, pId:22, name:"叶子节点224"},
		{ id:23, pId:2, name:"父节点23 - 折叠"},
		{ id:231, pId:23, name:"叶子节点231"},
		{ id:232, pId:23, name:"叶子节点232"},
		{ id:233, pId:23, name:"叶子节点233"},
		{ id:234, pId:23, name:"叶子节点234"},
		{ id:3, pId:0, name:"父节点3 - 没有子节点", isParent:true}
	];

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	}); */
	var zNodes;
	$(function() {
		$.ajax({
			type : "POST",
			dataType : "json",
			data : {},
			url : "initStructureController/initTree.ajax",
			success : function(data) {
				console.log(data);
				zNodes = data;
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				/* var treeObj = $.fn.zTree.getZTreeObj("treeDemo"); */
				/* var nodes=treeObj.getNodes();
				var childNodes=treeObj.transformToArray(nodes);
				console.log(childNodes.length);
				for (var i = 0; i < childNodes.length; i++) { */
					/* console.log(childNodes[i].level); */
					/* if(childNodes[i].level=='0'){
						childNodes[i].icon='css/zTreeStyle/img/diy/2.png';
					}else if(childNodes[i].level=='1'){
						
					}else{
						
					} */
				/* } */
			},
			error : function() {
				alert("出错啦");
			}
		})

	})
</script>
</html>