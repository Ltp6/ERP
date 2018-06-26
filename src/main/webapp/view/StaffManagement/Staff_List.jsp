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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>职工管理</title>
<!--dynamic table-->
<link href="<%=basePath%>js/advanced-datatable/css/demo_page.css"
	rel="stylesheet" />
<link href="<%=basePath%>js/advanced-datatable/css/demo_table.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=basePath%>js/data-tables/DT_bootstrap.css" />

<link href="<%=basePath%>css/style.css" rel="stylesheet">
<link href="<%=basePath%>css/style-responsive.css" rel="stylesheet">
</head>

<body class="sticky-header">
	<!-- page heading start-->
		<div class="page-heading">
			<h3>职工管理</h3>
			<ul class="breadcrumb">
				<li><a href="staffController/queryStaff.do">人事管理</a></li>
				<li class="active">职工管理</li>

			</ul>

		</div>
		<!-- page heading end-->

		<!--body wrapper start-->
		<div class="wrapper">

			<!-- 课程列表 start -->
			<div class="row">
				<div class="col-sm-12">
					<section class="panel"> <header class="panel-heading">
					职工列表<span class="tools pull-right"> <a type="button"
						class="btn btn-default"
						href="<%=basePath%>view/StaffManagement/Staff_Transfer.jsp"><span
							class="fa fa-plus">&nbsp;增加</span></a> <a href="javascript:;"
						class="fa fa-chevron-down"></a> <a href="javascript:;"
						class="fa fa-times"></a>
					</span> </header>
					<div class="panel-body">
						<div class="adv-table">
							<table class="display table table-bordered"
								id="hidden-table-info">
								<thead>
									<tr>
										<th style="text-align: center;">工号</th>
										<th style="text-align: center;">姓名</th>
										<th style="text-align: center;">性别</th>
										<th style="text-align: center;">身份证</th>
										<th style="text-align: center;">住址</th>
										<th style="text-align: center;">电话</th>
										<th style="text-align: center;">学历</th>
										<th style="text-align: center;">入职时间</th>
										<th style="text-align: center;" colspan="3">操作</th>
										
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${staffList}" var="sta">
										<tr class="gradeX">
											<td class="center ">${sta.loginName}</td>
											<td class="center ">${sta.staName}</td>
											<td class="center ">${sta.staSex}</td>
											<td class="center ">${sta.staIdcard}</td>
											<td class="center ">${sta.staAddress }</td>
											<td class="center ">${sta.staTel}</td>
											<td class="center ">${sta.staEdu}</td>
											<td class="center "><fmt:formatDate value="${sta.staIntime }" pattern="yyyy-MM-dd" /></td>
											<td class="center ">编辑</td>
											<td class="center ">删除</td>
											<td class="center "><a href="depPostController/queryStaffInfo.do?staId=${sta.staId}">职位调配</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>

						</div>
					</div>
					</section>
				</div>
			</div>
			<!-- 课程列表 end -->
		</div>
		<!--body wrapper end-->

	</div>
	<!-- main content end--> </section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="<%=basePath%>js/jquery-1.10.2.min.js"></script>
	<script src="<%=basePath%>js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="<%=basePath%>js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/modernizr.min.js"></script>
	<script src="<%=basePath%>js/jquery.nicescroll.js"></script>

	<!--dynamic table-->
	<script type="text/javascript" language="javascript"
		src="<%=basePath%>js/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/data-tables/DT_bootstrap.js"></script>
	<!--dynamic table initialization -->
	<script src="<%=basePath%>js/dynamic_table_init_stuManage.js"></script>
</body>
</html>