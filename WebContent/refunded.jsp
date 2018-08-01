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
    <title>查看退票</title>
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
    <form action="/AirHelper/searRefund.action" method="post" class="large-4 large-offset-4">
    	<label>退单号</label>
        <input type="text" name="refundNo" value="${vo.refundNo }">  
    	<label>航班号</label>
        <input type="text" name="flightNo" value="${vo.flightNo }">               
        <label>起飞时间区间</label>
        <input type="text" id="temp" name="startTime1" value="${vo.startTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <input type="text" id="temp" name="endTime1" value="${vo.endTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <input type="submit" class="small radius button left" value="查询">
        <br><br><br>
    </form>
    <c:if test="${refunds!=null }">
    <table class="large-8 large-offset-2">
    	<tr>
    		<th>退票单号</th>
    		<th>航班号</th>
    		<th>用户名</th>
    		<th>起飞时间</th>
    		<th>到达时间</th>
    		<th>退票时间</th>
    		<th>身份证号</th>
    		<th>手机号</th>
    		<th>价格</th>
    		<th>座舱类型</th>
    	</tr>
    	<c:forEach items="${refunds }" var="Refund">
    	<tr>
    		<td>${Refund.refundNo}</td>
			<td>${Refund.flightNo}</td>
			<td>${Refund.username}</td>
			<td>${Refund.startTime}</td>
			<td>${Refund.endTime}</td>
			<td>${Refund.refundTime}</td>
			<td>${Refund.cardNo}</td>
			<td>${Refund.phoneNo}</td>
			<td>${Refund.price}</td>
			<c:if test="${Refund.type=='U'}">
				<td>普通舱</td>
			</c:if>
			<c:if test="${Refund.type=='P'}">
				<td>头等舱</td>
			</c:if>
		</tr>
    	</c:forEach>
    </table>
    </c:if>
    </div>
    <div>
    	<a href="main.jsp">返回主页</a>
    </div>
  </body>
</html>
