<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.User" %>
<%@ page import="com.demo.po.Refund" %>
<%@ page import="com.demo.po.Order" %>
<%@ page import="com.demo.vo.*" %>
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
    <title>查看订单</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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
            <h2>您好 ! ${user.username}</h2>
            <h4>在本页面可以进行各中操作</h4>
        </div>
    </div>
</header>
    <div>
    <form action="/AirHelper/searOrder.action" method="post" class="large-4 large-offset-4">
    	<label>订单号</label>
        <input type="text" name="orderNo" value="${vo.orderNo }">  
    	<label>航班号</label>
        <input type="text" name="flightNo" value="${vo.flightNo }">               
        <label>起飞时间区间</label>
        <input type="text" id="temp" name="startTime1" value="${vo.startTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <input type="text" id="temp" name="endTime1" value="${vo.endTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <input type="submit" class="small radius button left" value="查询">
        <br><br><br>
    </form>
    <c:if test="${orders!=null }">
    	<table class="large-8 large-offset-2">
    	<tr>
    		<th>订票单号</th>
    		<th>航班号</th>
    		<th>用户名</th>
    		<th>起飞时间</th>
    		<th>到达时间</th>
    		<th>下单时间</th>
    		<th>身份证号</th>
    		<th>手机号</th>
    		<th>价格</th>
    		<th>座舱类型</th>
    		<th>操作</th>
    	</tr>
    	<c:forEach items="${orders }" var="order">
    	<tr>
    	<c:if test="${order.status == '1' }">
    		<td>${order.orderNo}</td>
			<td>${order.flightNo}</td>
			<td>${order.username}</td>
			<td>${order.startTime}</td>
			<td>${order.endTime}</td>
			<td>${order.orderTime}</td>
			<td>${order.cardNo}</td>
			<td>${order.phoneNo}</td>
			<td>${order.price}</td>
			<c:if test="${order.type=='U'}">
				<td>普通舱</td>
			</c:if>
			<c:if test="${order.type=='P'}">
				<td>头等舱</td>
			</c:if>
			<td><form action="/AirHelper/refund.action" method="post">
			<input type="hidden" name="orderNo" value="${order.orderNo}"/>
			<input type="hidden" name="flightNo" value="${order.flightNo}"/>
			<input type="hidden" name="startTime1" value="${order.startTime}"/>
			<input type="hidden" name="endTime1" value="${order.endTime}"/>
			<input type="hidden" name="cardNo" value="${order.cardNo}"/>
			<input type="hidden" name="phoneNo" value="${order.phoneNo}"/>
			<input type="hidden" name="price" value="${order.price}"/>
			<input type="hidden" name="type" value="${order.type}"/>
			<input type="submit" value="退票" class="small radius button left"/>
			</form></td>
    	</c:if>
		</tr>
    	</c:forEach>
    </table>
    </c:if>    
    </div>
    <div>
    	<br>
    	<a href="main.jsp">返回主页</a>
    </div>
  </body>
</html>