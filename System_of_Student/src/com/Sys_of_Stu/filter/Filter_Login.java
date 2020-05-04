package com.Sys_of_Stu.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class Filter_Login
 */
@WebFilter(filterName = "Filter_Login",
			urlPatterns = {"*.jsp"})
public class Filter_Login implements Filter {

    /**
     * Default constructor. 
     */
    public Filter_Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		StringBuffer url = req.getRequestURL();
		String urlname = url.toString();//得到当前请求的url
		
		if(!urlname.equals("http://localhost:8080/System_of_Student/Login.jsp")) {
			//请求非登录页面
			if(!isLogin(req)) {
				//未登录，跳转到登录页面
				resp.sendRedirect("http://localhost:8080/System_of_Student/Login.jsp");
			}else {
				//已登录，执行其他过滤
				chain.doFilter(request, response);
			}
		}
		else {
			//请求登录页面
			chain.doFilter(request, response);
		}

	}
	
	private boolean isLogin(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null && cookies.length > 0) {
			String inputUsername = "";
			String inputPassword = "";
			for(Cookie  cookie : cookies) {
				if((cookie.getName( )).compareTo("username") == 0) { 
					inputUsername = cookie.getValue();
				}
				else if((cookie.getName( )).compareTo("password") == 0) {
					inputPassword = cookie.getValue();
				}
			}
			if(inputUsername.equals("") || inputPassword.equals("")) {
				//cookie中内容为空
				return false;
			}
			else {
				return true;
			}
		}
		else {
			return false;
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
