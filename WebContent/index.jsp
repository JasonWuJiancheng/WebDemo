<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jason.entity.User"%>
<%@page import="com.jason.entity.Product"%>
<%@page import="com.jason.util.Page"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/modal.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" href="css/productlist.css" />

<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
</head>

<body>
	<div class="header">
		<div class="header-content clear">
			<div class="logo">
				<img src="img/dell-logo.png" width="101px" />
			</div>
			<div class="banner">
				戴尔官方旗舰店 <a href="#"><img src="img/head-img1.gif"></a> <a
					href="#"><img src="img/tobuy1.png"></a> <a href="#"><img
					src="img/tobuy2.png" /></a>
			</div>
			<div class="login">
				<%
					User user = (User)session.getAttribute("login");
					if(user == null){
				%>
				<p>你好，请登录</p>
				<input type="button" value="登录" id="showModal" /> <a
					href="/WebDemo/Skip?name=userpage">注册账号</a>
				<%
					}else {
				%>
				<p>
					你好，<%=user.getNickname() %></p>
				<a href="/WebDemo/LogoutServlet">退出登录</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="main-content clear">
			<div class="left-side">
				<div class="navigator">
					<ul class="first-menu">
						<a href="#">
							<li class="first-li">首页</li>
						</a>
						<a href="PageControl?pageIndex=1">
							<li class="first-li">全部产品</li>
						</a>
						<li class="first-li">笔记本
							<ul class="second-menu">
								<a href="ProductList?type=1">
									<li><i class="fa fa-angle-right"></i>游戏本</li>
								</a>
								<a href="ProductList?type=2">
									<li><i class="fa fa-angle-right"></i>轻薄本</li>
								</a>
								<a href="ProductList?type=3">
									<li><i class="fa fa-angle-right"></i>XPS系列</li>
								</a>
								<a href="ProductList?type=4">
									<li><i class="fa fa-angle-right"></i>外星人系列</li>
								</a>
							</ul>
						</li>
						<li class="first-li">台式机
							<ul class="second-menu">
								<a href="ProductList?type=5">
									<li><i class="fa fa-angle-right"></i>台式机</li>
								</a>
								<a href="ProductList?type=6">
									<li><i class="fa fa-angle-right"></i>一体机</li>
								</a>
							</ul>
						</li>
						<a href="ProductList?type=7">
							<li class="first-li">显示器</li>
						</a>
						<a href="ProductList?type=8">
							<li class="first-li">外设</li>
						</a>
					</ul>
					<input type="text" id="search-text" class="search-text" placeholder="搜索..." />
					<input type="button" id="search-btn" class="search-btn" />
				</div>
				<div class="plist clear">
					<%
					Page pages = (Page) request.getAttribute("pages");
					if (pages == null) {
						response.sendRedirect("PageControl?pageIndex=1");
					}else{
						int totalPages = pages.getTotalPageCount(); //总页数
						int pageIndex = pages.getCurrPageNo(); //当前页码
						List<Product> productList = (List<Product>)pages.getListProduct();
						if(productList == null || productList.size() == 0){
				%>
					<p>没有找到你想要的产品！</p>
					<%
						}else{
							Product p = null;
								for(int i=0;i<productList.size();i++){
									p = productList.get(i);
				%>
					<div class="product" id="<%=i %>">
						<div class="p-img">
							<img src="<%=p.getHeaderimg() %>" alt="图片加载失败" />
						</div>
						<div class="p-info">
							<p class="pricedetail">
								￥ <span class="price"><%=p.getPrice() %></span>
							</p>
							<p class="title">
								<a href="ProductDetail?id=<%=p.getId() %>"><%=p.getName() %></a>
							</p>
						</div>
					</div>
					<%
							}
								
				%>
				</div>
				<div class="pages">
					当前页数：[<%=pageIndex%>/<%=totalPages%>]
					<%
					if (pageIndex > 1) { //如果当前不是第一页
				%>
					<a href="PageControl?pageIndex=1">首页</a>&nbsp; <a
						href="PageControl?pageIndex=<%=pageIndex - 1%>">上一页</a>
					<%
					}
					if (pageIndex < totalPages) { //当前不是最后一页
				%>
					<a href="PageControl?pageIndex=<%=pageIndex + 1%>">下一页</a> <a
						href="PageControl?pageIndex=<%=totalPages%>">末页</a>
					<%
						}
					}
				}
				%>
				</div>
			</div>
			<div class="right-side">
				<p>----- 热门商品 -----</p>
				<div class="aside-content">
					<ul>
						<li>
							<div class="p-img">
								<a href="#"><img src="img/p-img1.jpg" width="180px"></a>
							</div>
							<div class="p-name">
								<a href="#">戴尔（DELL） Precision M5520 15.6英寸移动工作站笔记本 微边框</a>
							</div>
							<div class="p-price">
								<strong>￥35799.00</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"><img src="img/p-img2.jpg" width="180px"></a>
							</div>
							<div class="p-name">
								<a href="#">小米(MI)Pro 15.6英寸金属轻薄笔记本(i5-8250U 8G 256G PCIE
									SSD</a>
							</div>
							<div class="p-price">
								<strong>￥5699.00</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"><img src="img/p-img3.jpg" width="180px"></a>
							</div>
							<div class="p-name">
								<a href="#">Apple MacBook Pro 13.3英寸笔记本电脑 深空灰色 2018新</a>
							</div>
							<div class="p-price">
								<strong>￥13888.00</strong>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-content">
			<div class="message">用户协议 | 商城意见反馈：028-8888888 |
				在线反馈：6666666（QQ群）</div>
			<div class="copyright">
				Copyright © 1998-2018 JasonWu. All Right Reserved. 吴建成 版权所有
			</div>
		</div>
	</div>
	
	<div id="modal" class="modal">
		<div class="modal-content">
			<header class="modal-header">
				<h4>登录</h4>
				<span class="close">×</span>
			</header>
			<div class="modal-body">
				<form method="post" id="login" class="login_form">
					<div class="control-group">
						<label>用户名</label> <input type="text" id="username"
							name="username" title="请填写用户名" value="">
						<div id="username_prompt" class="prompt"></div>
					</div>
					<div class="control-group">
						<label>密码</label> <input type="password" id="password"
							name="password" title="请填写密码">
						<div id="password_prompt" class="prompt"></div>
					</div>
					<div class="checkbox-group">
						<label><input type="checkbox" id="remember_username"
							name="remember_username" />记住用户名</label>
					</div>
				</form>
			</div>
			<footer class="modal-footer">
				<button id="sure">登录</button>
				<button id="cancel">取消</button>
			</footer>
		</div>
	</div>
	
	<div id='popup_cart' class='popup_cart'></div>
	<div id="go_to_cart" class="go_to_cart"><i class="fa fa-shopping-cart"></i></div>
	
	<script type="text/javascript" src="js/defaultFunction.js" ></script>
	<script type="text/javascript" src="js/cartFunction.js" ></script>
	<script type="text/javascript" src="js/loginCheck.js"></script>
</body>

</html>