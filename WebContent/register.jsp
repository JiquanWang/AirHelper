<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1.0" />
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<script type="text/javascript">
	function check(){
		if(document.getElementById("password").value == document.getElementById("password1").value){
  				return true;
  		}
  		else{
  			alert("两次密码不一致");
  			return false;
  		}
	}
</script>
	<div class="header_wrap">
        <div class = "header">
            <div class="topMenuAll">
                <div class="logo">
                    <a href="login.jsp">
                        <div class="logo_pic">
                            <img src="img/logo2.png" width="40" alt="logo"/>
                        </div>    
                    </a>
                </div>
                <ul class="top_menu">
                    <li class="top_menu_item">
                        <a href="login.jsp" class="menu_hd"><span>登录页面</span></a>
                    </li>
                    <li class="top_menu_item">
                        <a href="#" class="menu_hd"><span>客服</span></a>
                    </li>
                    <li class="top_menu_item">
                        <a href="#" class="menu_hd"><span>关于我们</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="BG">
            <div class="login_box">
                <div class="Description">
                    <div class="login_title">
                        <h1>AirHelper</h1>
                    </div>
                    <div class="login_subtitle">
                        <h2>As Convenient As Possible</h2>
                    </div>
                </div>
                <form class="register_form"  action="/AirHelper/register.action" method="post" onsubmit="return check()">
                    <div class="form_row">
                    	<input type="text" name="username" required placeholder="请输入用户名">
                    </div>
                    <div class="form_row">
                    	<input type="password" id="password" name="password" required placeholder="请输入密码">
                    </div>
                    <div class="form_row" >
                        <input type="password" id="password1" name="password1" required placeholder="请再次确认密码">
                    </div>
                    <div class="form_row">
                        <input class="small radius button left" id="loginbtn" type="submit" value="注册">
                        <input class="small radius button right" type="reset" value="重置">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>Copyright&copy;2015-2018 鑫鑫娱乐有限公司. All rights reserved.</p>
    </div>
</body>
</html>