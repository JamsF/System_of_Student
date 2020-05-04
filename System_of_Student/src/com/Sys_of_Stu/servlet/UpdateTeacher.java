package com.Sys_of_Stu.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sys_of_Stu.bean.Teacher;
import com.Sys_of_Stu.utils.DoUpdate;

/**
 * Servlet implementation class UpdateTeacher
 */
@WebServlet("/UpdateTeacher")
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeacher() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int resInsert = -1;
		
		Teacher teacher = new Teacher();
		
		teacher.setTeacherno(request.getParameter("teacherno"));
		teacher.setTname(request.getParameter("tname"));
		teacher.setMajor(request.getParameter("major"));
		teacher.setProf(request.getParameter("prof"));
		teacher.setDepartment(request.getParameter("department"));
		
		try {
			resInsert = DoUpdate.DoUpdateTeacher(teacher);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(resInsert == 1)
			resInsert = 1;//为统一返回页面设置不同标志来区分
		else
			resInsert = 2;
		request.setAttribute("InsertResult", resInsert);
		request.setAttribute("teacher", teacher);
		request.getRequestDispatcher("Sys_of_Stu/teacher/Teacher_Result.jsp").forward(request, response);
	}

}
