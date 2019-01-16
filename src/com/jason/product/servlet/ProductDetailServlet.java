package com.jason.product.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jason.dao.ProductDao;
import com.jason.dao.impl.mysql.ProductDaoImpl;
import com.jason.entity.Product;

/**
 * Servlet implementation class InitProductListServlet
 */
@WebServlet("/ProductDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idstr = (String)request.getParameter("id");
		int id = Integer.parseInt(idstr);
		
		ProductDao productDao = new ProductDaoImpl();
		Product product = productDao.findProductById(id);
		
		request.setAttribute("product", product);
		request.getRequestDispatcher("WEB-INF/productDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
