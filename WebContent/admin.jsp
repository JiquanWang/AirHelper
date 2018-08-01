<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理员首页</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
  </head>
  
  <body>
  	<%
  		
  	 %>
  	<script type="text/javascript">
  	function add(){
  		window.location.href="addFlight.jsp";
  	}
  	function view(){
  		window.location.href="adminViewFlight.jsp"
  	}
  	function viewOrder(){
  		window.location.href="adminViewOrder.jsp"
  	}
  	function viewRefund(){
  		window.location.href="adminViewRefund.jsp"
  	}
  	function viewUser(){
  		window.location.href="adminViewUser.jsp"
  	}
  	function addPlane(){
  		window.location.href="addAirPlane.jsp"
  	}
  	</script>
  	<nav class="top-bar" data-topbar role="navigation">
    <ul class="title-area">
        <li class="name">
            <h1><a href="login.jsp">首页</a></h1>
        </li>
    </ul>
    <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">

        </ul>
    </section>
</nav>
<header>
    <div class="row">
        <div class="large-12 columns">
            <h2>管理员您好 ! ${admin.username}</h2>
            <h4>在本页面可以进行各种操作</h4>
        </div>
    </div>
</header>
    <div>
    <form action="/AirHelper/add.action" method="post" class="large-4 large-offset-4">
    	<input type="submit" value="添加航班" class="small radius button left">
    </form>   	
    </div>
    <div>
    	<input type="button" value="查看航班" class="small radius button left" onclick="view()">
    </div>
    <div>
    	<input type="submit" value="查看订单" class="small radius button left" onclick="viewOrder()">
    </div>
    <div>
    	<input type="submit" value="查看退票" class="small radius button left" onclick="viewRefund()">
    </div>
    <div>
    	<input type="submit" value="查看用户"  class="small radius button left" onclick="viewUser()">
    </div>
    <div>
    	<input type="submit" value="添加机型" class="small radius button left" onclick="addPlane()">
    </div>
  </body>
</html>