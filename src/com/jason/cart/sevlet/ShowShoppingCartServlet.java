package com.jason.cart.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.johnzon.mapper.Mapper;
import org.apache.johnzon.mapper.MapperBuilder;

import com.jason.dao.CartDao;
import com.jason.dao.impl.mysql.CartDaoImpl;
import com.jason.entity.CartItem;
import com.jason.entity.User;

/**
 * Servlet implementation class ShowProductList
 */
@WebServlet("/ShowShoppingCart")
public class ShowShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		PrintWriter pw=response.getWriter();

		User user = (User)session.getAttribute("login");
		
		if(user != null) {
			try {
				
				CartDao cartDao = new CartDaoImpl();
				List<CartItem> list = cartDao.findCartItemByUser(user);
				
				Mapper mapper = new MapperBuilder().build();
				mapper.writeObject(list, pw);
				
				pw.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			pw.write("{\"message\":\"请先登录再查看购物车\"}");
			pw.close();
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
