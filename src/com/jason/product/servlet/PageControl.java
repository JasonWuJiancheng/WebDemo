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
 * Servlet implementation class PageControl
 */
@WebServlet("/PageControl")
public class PageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pageIndex= request.getParameter("pageIndex");//获得当前页数
	    if(pageIndex == null){
	        pageIndex= "1";
	    }
	    int currPageNo = Integer.parseInt(pageIndex);
	    
	    ProductDao productDao = new ProductDaoImpl();
		int totalCount = productDao.getTotalCount();//获得总记录数
		
		Page pages = new Page();
		pages.setPageSize(9);    //设置每页条数
		pages.setTotalCount(totalCount);   //设置总记录数
		int totalpages = pages.getTotalPageCount();
		
		/*对首页与末页越界进行控制*/
	    if(currPageNo < 1){
	        currPageNo = 1;
	    }else if(currPageNo > pages.getTotalPageCount()){
	        currPageNo = totalpages;
	    }
		
	    pages.setCurrPageNo(currPageNo);    //设置当前页面
		List<Product> productList = productDao.getPageProductList(pages.getCurrPageNo(), pages.getPageSize());
		pages.setListProduct(productList);  //设置每页显示的集合
		
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
