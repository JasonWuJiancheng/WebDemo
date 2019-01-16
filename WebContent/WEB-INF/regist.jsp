<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>用户注册</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/normal.css" />
        <link rel="stylesheet" type="text/css" href="css/regist.css" />
        <script type="text/javascript" src="js/jquery-1.12.4.js" ></script>
    </head>
    <body>
		<div class="header">
			<div class="header-content">
				<img src="img/dell-logo-white.png" width="40px" style="display: inline-block;" />
				<h3>用户注册</h3>
			</div>
		</div>
		<div class="main">
			<div class="main-content clear">
				<div class="message">
				    <form method="post" action="/WebDemo/RegistServlet" id="regist">
				    	<div class="control-group">
							<label for="username">用户名</label>
							<input type="text" id="username" name="username" placeholder="请输入5~20位用户名">			
						</div>
						<div class="control-group">
							<label for="nickname">显示名</label>
							<input type="text" id="nickname" name="nickname" placeholder="请输入大家对你的称呼">
						</div>
						<div class="control-group">
							<label for="password">密码</label>
							<input type="password" id="password" name="password" placeholder="请输入8~16位英文、数字或符号的密码">					
						</div>
						<div class="control-group">
							<label for="password2">重复密码</label>
							<input type="password" id="password2" name="password2" placeholder="请再次输入密码">
						</div>
						<div class="control-group">
							<label for="email">邮箱地址</label>
							<input type="email" id="email" name="email" placeholder="请输入你的邮箱地址">					
						</div>
						<div class="control-group">
							<label for="other">个人简介</label>
							<textarea id="other" name="other"></textarea>						
						</div>
					</form>	
				</div>
				<div class="prompt">
					<div id="username_prompt"></div>
					<div id="nickname_prompt"></div>
					<div id="password_prompt"></div>
					<div id="password2_prompt"></div>
					<div id="email_prompt"></div>
					<div id="intro_prompt"></div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-content">
				<div class="btn-group">
					<input type="button" value="注册" onclick="doRegist()" />
					<input type="button" value="取消" onclick="cancelRegist()"/>
				</div>
			</div>
		</div>
 	</body>
 	<script type="text/javascript" src="js/registCheck.js" ></script>
</html>