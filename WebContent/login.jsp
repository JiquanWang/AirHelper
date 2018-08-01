<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>航班管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
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
                <ul class="top_menu">
                    <li class="top_menu_item">
                        <a href="#" class="menu_hd"><span>登录页面</span></a>
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
                <form class="login_form" action="login.action" method="post">
                    <div class="form_row">
                        <input type="text" name="username" required placeholder="请输入用户名" > 
                    </div>
                    <div class="form_row">
                        <input type="password" name="password" required placeholder="请输入密码">
                    </div>
                    <div class="form_row" >
                        <div id="input_radio">
                            <input id="admin" type="radio" name="level" value="admin">
                            <label for="admin">管理员</label>
                            <input id="user" type="radio" name="level" value="user" checked="checked">
                            <label for="user">用户</label>
                        </div>
                    </div>
                    <div class="form_row">
                        <input class="small radius button left" id="loginbtn" type="submit" value="登录">
                        <input class="small radius button right" type="reset" value="重置">
                    </div>
                    <div class="form_row">
                        <p><a href="register.jsp">点击注册</a></p>
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