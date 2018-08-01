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
    <title>个人主页</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
  </head>
  
  <body>
  	<%
  		User u = new User();
  		u = (User)request.getSession().getAttribute("user");
  	 %>
  	<script type="text/javascript">
  		function re(){
  			window.location.href="login.jsp";
  		}
  	</script>
  	<div class="header_wrap">
        <div class = "header">
            <div class="topMenuAll">
                <div class="logo">
                    <a href="#">
                        <div class="logo_pic">
                            <img src="img/logo2.png" width="160" alt="logo"/>
                        </div>    
                    </a>
                </div>
                <div class="user">
                	<button onclick="re()">注销</button>
                </div>
                <ul class="top_menu">
                    <li class="top_menu_item">
                        <a href="login.jsp#" class="menu_hd"><span>首页</span></a>
                    </li>
                    <li class="top_menu_item">
                        <a href="main.jsp#" class="menu_hd"><span>客服</span></a>
                    </li>
                    <li class="top_menu_item">
                        <a href="main.jsp#" class="menu_hd"><span>关于我们</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="content">
    	<div class="BG">
    		<header>
    <div class="row">
        <div>
            <h2>您好 ! ${user.username}</h2>
            <h4>在本页面可以进行各种操作</h4>
        </div>
    </div>
</header>
    <!-- <div>
    	<form action="/AirHelper/order.action"	class="large-4 large-offset-4">
    		<input type="submit" value="订票" class="small radius button left">
   		</form>	
    </div> -->
    <div> 		
	 	<form action="/AirHelper/viewFlight.action"	class="large-4 large-offset-4">
    		<input type="submit" value="查看航班" class="small radius button left">
    	</form>
    </div>
    <div>
    	<form action="/AirHelper/viewOrdered.action" class="large-4 large-offset-4">
    		<input type="submit" value="查看订单" class="small radius button left">
    	</form>
    </div>
    <!-- <div>
    	<form action="/AirHelper/refund.action"	class="large-4 large-offset-4">
    		<input type="submit" value="退票" class="small radius button left">
    	</form>
    </div> -->
    <div>
    	<form action="/AirHelper/viewRefunded.action" class="large-4 large-offset-4">
    		<input type="submit" value="查看退票" class="small radius button left">
    	</form>
    </div>
    	</div>
    </div>
  </body>
</html>