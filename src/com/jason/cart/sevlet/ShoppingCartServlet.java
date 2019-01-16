package com.jason.cart.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jason.dao.CartDao;
import com.jason.dao.ProductDao;
import com.jason.dao.impl.mysql.CartDaoImpl;
import com.jason.dao.impl.mysql.ProductDaoImpl;
import com.jason.entity.CartItem;
import com.jason.entity.Product;
import com.jason.entity.User;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/ShoppingCart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter pw=response.getWriter();
		
		ProductDao productDao = new ProductDaoImpl();
		CartDao cartDao = new CartDaoImpl();
		
		User user = (User)session.getAttribute("login");
		
		int uid = 0;
		if(user != null) {
			uid = user.getId();
		}else {
			pw.write("noLogin");
			pw.close();
			return;
		}
		
		String func = request.getParameter("func");
		String pidStr = request.getParameter("pid");
		String numStr = request.getParameter("num");
		
		if("show".equals(func)) {
			//进入购物车页面
			List<CartItem> cartItems = cartDao.findCartItemByUser(user);
			request.setAttribute("cart", cartItems);
			
			request.getRequestDispatcher("WEB-INF/shoppingCart.jsp").forward(request, response);
			pw.close();

		}else if("add".equals(func)) {
			//添加商品进入购物车
			try {
				int pid = Integer.parseInt(pidStr);
				int num = Integer.parseInt(numStr);
				
				Product product = productDao.findProductById(pid);
				
				if(product != null) {
					int countC = cartDao.countCartItem(uid, pid);
					if(countC>0) {
						CartItem cartItem = cartDao.findCartItem(uid, pid);
						if(cartItem.getAmount()+num > product.getResnum()){
							pw.write("亲，您已选购本商品"+cartItem.getAmount()+"件，总共购买量不能超过库存");
						}else {
							cartDao.updateCartItem(uid, pid, cartItem.getAmount()+num);
							pw.write("在购物车等亲哦~");
						}					
					}else {
						cartDao.insertCartItem(uid, pid, num);
						pw.write("在购物车等亲哦~");
					}	
				}
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				pw.close();
			}
		}else if("remove".equals(func)) {
			try {
				int pid = Integer.parseInt(pidStr);
				cartDao.deleteCartItem(uid, pid);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if("update".equals(func)) {
			try {
				int pid = Integer.parseInt(pidStr);
				int num = Integer.parseInt(numStr);
				cartDao.updateCartItem(uid, pid, num);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
