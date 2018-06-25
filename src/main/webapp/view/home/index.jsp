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
<title>首页</title>

  <!--common-->
  <link href="css/index-style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  
  <!--iframe-->
  <link rel="stylesheet" href="css/iframe.css">
 
</head>

<body class="sticky-header" style="overflow:-Scroll;overflow-y:hidden;">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <img src="images/logo.png" alt="">
        </div>

        <div class="logo-icon text-center">
            <img src="images/logo_icon.png" alt="">
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#" class="name"></a></h4>
                        <span>"还没有想好..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">个人中心</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                  <li><a href="#"><i class="fa fa-user"></i> <span>个人简介</span></a></li>
                  <li><a href="#"><i class="fa fa-cog"></i> <span>设置</span></a></li>
                  <li><a href="loginController/loginOut.do"><i class="fa fa-sign-out"></i> <span>注销</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
               
               <c:forEach items="${menuList}" var="menuList">
              
                	<li class="menu-list"><a href=""><i class="fa ${menuList.oneMenu.menuIcon }"></i> <span>${menuList.oneMenu.oneMenuName}</span></a>
                    <ul class="sub-menu-list">
                    <c:forEach items="${menuList.twoMenuList}" var="twoMenu"> 
                        <li><a href="${twoMenu.twoMenuUrl}" target="right"> ${twoMenu.twoMenuName}</a></li>
                    </c:forEach> 
                    </ul>
                </li>
			</c:forEach>
            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content">

        <!-- header section start-->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                    	<a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                            <i class="fa fa-tasks"></i>
                            <span class="badge">8</span>
                      </a>
                    </li>
                    <li>
                    	<a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge">5</span>
                      </a>
                    </li>
                    <li>
                    	<a href="#" class="btn btn-default dropdown-toggle info-number" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="badge">4</span>
                      </a>
                    </li>
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="images/photos/user-avatar.png" alt="" /><span class="name"></span><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="#"><i class="fa fa-user"></i>  个人简介</a></li>
                            <li><a href="#"><i class="fa fa-cog"></i>  设置</a></li>
                            <li><a href="loginController/loginOut.do"><i class="fa fa-sign-out"></i> 注销</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->
        </div>
        <!-- header section end-->
        
        <!-- page heading end-->
      <iframe id="iframe" src="" scrolling="yes" frameborder="0" name="right" ></iframe>
        	
        
        
        
    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

<script type="text/javascript">

$(function(){
	$.ajax({
		url:'indexController/getStaName.ajax',
		type:'POST',
		data:{
			
		},
		dataType:'text',
		success:function(result){
			if(result !=null&&result !="FAIL"){
				$(".name").text(result);
				if(result=="admin"){
					$("#iframe").attr("src","view/home/admin-info.jsp")
				}else{
					$("#iframe").attr("src","view/home/info.jsp")
				}
			}else{
				$(".name").text("正在获取。。。");
			}
		},
		error:function(){
			$(".name").text("无法获取");
		}
	});
}); 




</script>


</body>
</html>