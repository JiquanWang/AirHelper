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
            <h2>添加机型</h2>
            <h4>填写完所有信息后点击确认</h4>
        </div>
    </div>
</header>
<div class="row">
    <form action="/AirHelper/addPlane.action" method="post"class="large-4 large-offset-4">
        <label>机型号</label>
        <input type="text" name="airNo" required>
        <label>普通舱行数</label>
        <input type="text" name="rowU" required>
        <label>普通舱列数</label>
        <input type="text" name="colU" required>
        <label>头等舱行数</label>
        <input type="text" name="rowP" required>
        <label>头等舱列数</label>
        <input type="text" name="colP" required>
        <br>
        <input class="small radius button left off" type="submit" value="确认" >
        <input class="small radius button right" type="reset" value="重置">
    </form><br><br><br>
    <a href="admin.jsp">返回主页</a>
</div>
</body>
</html>
