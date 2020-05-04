package com.Sys_of_Stu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Sys_of_Stu.bean.User;
import com.Sys_of_Stu.utils.DoLogin;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter pw = response.getWriter();
			
			String USERNAME = request.getParameter("username");//获取用户名
			String PASSWORD = request.getParameter("password");//获取密码
			
			User user = new User();//新建用户
			user.setUsername(USERNAME);
			user.setPassword(PASSWORD);
			
			int flag = DoLogin.userLogin(user);
			if(flag == 1) {
				//密码正确，允许登录
				Cookie userName = new Cookie("username", USERNAME);//将用户信息写入cookie
				Cookie passWord = new Cookie("password", PASSWORD);
				HttpSession session = request.getSession();
				session.setAttribute("username", USERNAME);
				response.addCookie(userName);
				response.addCookie(passWord);
				pw.print(flag);
			}
			else if(flag == 2){
				//密码错误
				pw.print(flag);
			}
			else if(flag == 3){
				//账户冻结
				pw.print(flag);
			}
			else {
				//账户不存在
				pw.print(flag);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
