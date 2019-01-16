package com.jason.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jason.dao.UserDao;
import com.jason.dao.impl.mysql.UserDaoImpl;
import com.jason.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username").toLowerCase();
		String password = request.getParameter("password");
		UserDao userDao = new UserDaoImpl();
		
		int count = userDao.countUserByName(username);
		
		if(count == 0) {
			pw.write("no-such-user");
		} else {
			User user = userDao.findUserByName(username);	
			
			if(user == null) {
				pw.write("error");
			} else {
				if(password.equals(user.getPassword())) {
					session.setAttribute("login", user);
					pw.write("login-success");
				} else {
					pw.write("wrong-password");
				}
			}
		}
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
