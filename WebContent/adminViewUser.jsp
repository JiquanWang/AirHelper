<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.User" %>
<%@ page import="com.demo.po.Refund" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>查看所有用户</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
  </head>
  
  <body>
  	<%
  		User u = new User();
  		u = (User)request.getSession().getAttribute("user");
  	 %>
  	<script type="text/javascript">
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
            <h2>您好 ! ${admin.username}</h2>
            <h4>在本页面可以查看所有用户</h4>
        </div>
    </div>
</header>
    <div>
    <form action="/AirHelper/viewUsers.action" method="post" class="large-4 large-offset-4">
    	<label>用户名</label>
    	<input type="text" value="${vo.username }" name="username" />
        <input type="submit" class="small radius button left" value="查询">
        <br><br><br>
    </form>
    <c:if test="${users!=null }">
    	<table class="large-6 large-offset-3">
    	<tr>
    		<th>用户名</th>
    		<th>密码</th>
    		<th>操作</th>
    	</tr>
    	<c:forEach items="${users }" var="user">
    	<tr>
    		<td>${user.username}</td>
    		<td>${user.password}</td>
			<td><form action="/AirHelper/resetPwd.action" method="post">
			<input name="username" value="${user.username }" type="hidden"/>
			<input type="submit" value="重置密码" class="small radius button left"/>
			</form></td>
		</tr>
    	</c:forEach>
    </table>
    </c:if>
    </div>
    <div>
    	<a href="admin.jsp">返回主页</a>
    </div>
  </body>
</html>
