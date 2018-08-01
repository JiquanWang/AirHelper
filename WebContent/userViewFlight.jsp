<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.User" %>
<%@ page import="com.demo.po.Refund" %>
<%@ page import="com.demo.po.Order" %>
<%@ page import="com.demo.po.Flight" %>
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
    <title>查看航班</title>
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
            <h4>这里可以看到所有航班</h4>
        </div>
    </div>
</header>
    <div>
    <form action="/AirHelper/searFlight.action" method="post" class="large-4 large-offset-4">
    	<label>航班号</label>
        <input type="text" name="flightNo" value="${f.flightNo }">               
        <label>起飞时间区间</label>
        <input type="text" id="temp" name="startTime" value="${f.startTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <input type="text" id="temp" name="endTime" value="${f.endTime }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        <label>起点</label>
        <input type="text" name="from" value="${f.from }">
        <label>终点</label>
        <input type="text" name="to" value="${f.to }">
        <input type="submit" class="small radius button left" value="查询">
        <br><br><br>
    </form>
    <c:if test="${flights!=null }">
    	<table class="large-8 large-offset-2">
    		<tr>
	    		<th>航班号</th>
	    		<th>起飞时间</th>
	    		<th>到达时间</th>
	    		<th>起点</th>
	    		<th>终点</th>
	    		<th>普通舱价格</th>
	    		<th>普通舱余票</th>
	    		<th>头等舱价格</th>
	    		<th>头等舱余票</th>
	    		<th>操作</th>
    		</tr>
    	<c:forEach items="${flights }" var="flight">
    		<tr>    		
	    		<td>${flight.flightNo}</td>
				<td>${flight.startTime}</td>
				<td>${flight.endTime}</td>
				<td>${flight.from}</td>
				<td>${flight.to}</td>
				<td>${flight.priceU}</td>
				<td>${flight.remainU}</td>
				<td>${flight.priceP}</td>
				<td>${flight.remainP}</td>
				<td><form action="/AirHelper/order.action" method="post">
				<input type="hidden" value="${flight.flightNo }" name="flightNo"/>
				<input type="hidden" value="${flight.startTime }" name="startTime"/>
				<input type="hidden" value="${flight.endTime }" name="endTime"/>
				<input type="hidden" value="${flight.from }" name="from"/>
				<input type="hidden" value="${flight.to }" name="to"/>
				<input type="hidden" value="${flight.priceU }" name="priceU"/>
				<input type="hidden" value="${flight.remainU }" name="remainU"/>
				<input type="hidden" value="${flight.priceP }" name="priceP"/>
				<input type="hidden" value="${flight.remainP }" name="remainP"/>
				<input class="small radius button left"type="submit" value="订票"></form></td>				
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