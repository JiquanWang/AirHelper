<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.User" %>
<%@ page import="com.demo.po.Refund" %>
<%@ page import="com.demo.po.Order" %>
<%@ page import="com.demo.po.Flight" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1.0" />
    <title>添加航班</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<script type="text/javascript">
	function check(){
		if(document.getElementById("airNo").value == "null"){
			alert("请选择机型！");
			return false;
		}
		return true;
	}
</script>
<nav class="top-bar" data-topbar role="navigation">
    <ul class="title-area">
        <li class="name">
            <h1><a href="login.jsp">首页</a></h1>
        </li>
    </ul>
</nav>
<header>
    <div class="row">
        <div class="large-12 columns">
            <h2>添加航班</h2>
            <h4>填写完所有信息后点击确认</h4>
        </div>
    </div>
</header>
<div class="row">
    <form action="/AirHelper/addFlight.action" method="post"class="large-4 large-offset-4" onsubmit="return check()">
        <label>航班号</label>
        <input type="text" name="flightNo" required>
        <label>起飞时间</label>
       	<input type="text" id="temp" name="startTime1" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" required/>
        <label>到达时间</label>
        <input type="text" id="temp" name="endTime1" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" required/>
        <label>起点</label>
        <input type="text" name="from" required>
        <label>终点</label>
        <input type="text" name="to" required>
        <label>普通舱价格</label>
        <input type="text" name="priceU" required>
        <label>头等舱价格</label>
        <input type="text" name="priceP" required>
        <label>机型</label>
        <select id="airNo" name="airNo">
    		<option value="null">请选择...</option>
    		<c:forEach items="${airs }" var="air">
    			<option value="${air.airNo }">${air.airNo }</option>
    		</c:forEach>
		</select>
        <br>
        <input class="small radius button left off" type="submit" value="确认" >
        <input class="small radius button right" type="reset" value="重置">
    </form><br><br><br>
    <a href="admin.jsp">返回主页</a>
</div>
</body>
</html>