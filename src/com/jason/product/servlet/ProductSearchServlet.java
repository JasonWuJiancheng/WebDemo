package com.jason.product.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jason.dao.ProductDao;
import com.jason.dao.impl.mysql.ProductDaoImpl;
import com.jason.entity.Product;
import com.jason.util.Page;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/ProductSearch")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String key = (String)request.getParameter("key");
		
		List<Product> productList = null;
		ProductDao productDao = new ProductDaoImpl();
		
		if(key == null || key.trim() == "") {
			productList = productDao.findAllProduct();
		}else {
			productList = productDao.findProductByKeyInTitle(key);
		}
		
		Page pages = new Page();
		pages.setListProduct(productList);
		
	    request.setAttribute("pages", pages);
	    request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
