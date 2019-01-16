<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"/>
<jsp:directive.page import="com.jason.entity.CartItem"/>
<jsp:directive.page import="com.jason.entity.Product"/>
<jsp:directive.page import="com.jason.entity.User"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/modal.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/shoppingcart.css" />
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/index.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js" ></script>
	</head>

	<body>
		<div class="header">
			<div class="header-content clear">
				<div class="logo">
					<img src="img/dell-logo.png" width="101px" />
				</div>
				<div class="banner">
					戴尔官方旗舰店
					<a href="#"><img src="img/head-img1.gif"></a>
					<a href="#"><img src="img/tobuy1.png"></a>
					<a href="#"><img src="img/tobuy2.png" /></a>
				</div>
				<div class="login">
					<c:choose>
						<c:when test="${ empty sessionScope.login }">
							<p>你好，请登录</p>
							<input type="button" value="登录" id="showModal" />
							<a href="/WebDemo/Skip?name=userpage">注册账号</a>
						</c:when>
						<c:otherwise>
							<p>你好，${ sessionScope.login.nickname }</p>
							<a href="/WebDemo/LogoutServlet">退出登录</a>
						</c:otherwise>
					</c:choose>
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
					<div class="shoppingCart">
						<table class="cart-table">
							<thead>
								<tr>
									<th>选择</th>
									<th>商品信息</th>
									<th>单价</th>
									<th>数量</th>
									<th>金额</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty requestScope.cart }">
										<tr><td colspan="7">购物车内没东西，快去添加吧~</td></tr>
									</c:when>
									<c:otherwise>
										<c:set var="index" value="${1}" scope="page" />
										<c:forEach var="cartItem" items="${ requestScope.cart }" varStatus="status">
										<c:set var="trPrice" value="${cartItem.product.price*cartItem.amount}" scope="page" />
											<tr>
												<td><input type="checkbox" name="product" /></td>
												<td class="clear">
													<img src="${cartItem.product.headerimg}" width="80"/>
													<p><a href="ProductDetail?id=${cartItem.product.id}">${cartItem.product.name}</a><p>
												</td>
												<td>￥<span class="singlePrice">${cartItem.product.price}</span></td>
												<td>
													<span class="fa fa-minus dis-btn" id="dis_update_cart_${pageScope.index}"></span>
													<input disabled="disabled" class="q-input" type="number" value="${cartItem.amount}" /> 
													<span class="fa fa-plus add-btn" id="add_update_cart_${pageScope.index}"></span>
													<input style="display: none;" value="${cartItem.product.resnum}" />
												</td>
												<td>￥<span class="trPrice">${trPrice}</span></td>
												<td><i class="fa fa-close" id="remove_from_cart_${cartItem.product.id}">删除</i></td>				
											</tr>
											<c:set var="index" value="${pageScope.index+1}" scope="page" />
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>	
						<div class="table-footer">
							<p><input type="checkbox" id="chooseAll">全选</td></p>
							<p>已选商品<span id="chooseNum" class="chooseNum">0</span>件</p>
							<p>合计(不含运费)：<span class="totalPrice">￥<span id="totalPrice">0</span></span></p>
							<div>去结算</div>
						</div>
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
									<a href="#">小米(MI)Pro 15.6英寸金属轻薄笔记本(i5-8250U 8G 256G PCIE SSD</a>
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
				<div class="message">
					用户协议 | 商城意见反馈：028-8888888 | 在线反馈：6666666（QQ群）
				</div>
				<div class="copyright">
					Copyright © 1998-2018 JasonWu. All Right Reserved. 吴建成 版权所有</p>
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
							<label>用户名</label>
							<input type="text" id="username" name="username" title="请填写用户名" value="">
							<div id="username_prompt" class="prompt"></div>
						</div>
						<div class="control-group">
							<label>密码</label>
							<input type="password" id="password" name="password" title="请填写密码">
							<div id="password_prompt" class="prompt"></div>
						</div>
						<div class="checkbox-group">
							<label><input type="checkbox" id="remember_username" name="remember_username" />记住用户名</label>
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
		<script type="text/javascript" src="js/loginCheck.js" ></script>
		<script type="text/javascript" src="js/cartFunction.js" ></script>
	</body>

</html>