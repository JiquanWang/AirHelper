<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.demo.po.*" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>下单</title>
    <link href="css/foundation.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
</head>
<body>
	<script type="text/javascript">
  		function check(){
  			var t;
  			var obj = document.getElementsByName("type");
  			for(var i=0; i<obj.length; i++){
  				if(obj[i].checked){
  					t = obj[i].value;
  				}
  			}
  			if(t == 'P'){
  				if(document.getElementById("remainP").value == 0 || document.getElementById("remainP").value == '0'){
  					alert("剩余票数不足！");
  					return false;
  				}
  			}else{
  				if(document.getElementById("remainU").value == 0 || document.getElementById("remainU").value == '0'){
  					alert("剩余票数不足！");
  					return false;
  				}
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
    <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">

        </ul>
    </section>
</nav>
<header>
    <div class="row">
        <div class="large-12 columns">
            <h2>欢迎来到订单结算页面</h2>
            <h4>填写身份证号、手机号以完成订单</h4>
        </div>
    </div>
</header>
<div class="row">
    <form class="large-4 large-offset-4" action="/AirHelper/ordering.action" method="post" onsubmit="return check()">
    	<label>航班号</label>
        <input type="text" name="flightNo" value="${f.flightNo }" readonly="readonly">
        <label>起飞时间</label>
        <input type="text" name="startTime" value="${f.startTime }" readonly="readonly">
        <label>到达时间</label>
        <input type="text" name="endTime" value="${f.endTime }" readonly="readonly">
        <label>起点</label>
        <input type="text" name="from" value="${f.from }" readonly="readonly">
        <label>终点</label>
        <input type="text" name="to" value="${f.to }" readonly="readonly">
        <label>身份证号</label>
        <input type="text" name="cardNo" required>
        <label>手机号</label>
        <input type="text" name="phoneNo" required>
        
        
        <input id="P" type="radio" name="type" value="P">
        <label for="P">头等舱</label>
        	<br>价格
        <input type="text" name="priceP" value="${f.priceP }" readonly="readonly">
        	余票
        <input id="remainP" type="text" name="remainP" value="${f.remainP }" readonly="readonly">
        
        
        <input id="U" type="radio" name="type" value="U" checked="checked">
        <label for="U">经济舱</label>
        	<br>价格
        <input type="text" name="priceU" value="${f.priceU }" readonly="readonly">
        	余票
        <input id="remainU" type="text" name="remainU" value="${f.remainU }" readonly="readonly">
        
        
        <br><br>
        <input class="small radius button left" id="loginbtn" type="submit" value="下单">
        <input class="small radius button right" type="reset" value="重置">
        <br><br><br>
        <a href="main.jsp">返回个人页面</a>
    </form>
</div>
</body>
</html>