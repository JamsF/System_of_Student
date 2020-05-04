package com.Sys_of_Stu.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sys_of_Stu.bean.Student;
import com.Sys_of_Stu.utils.DoUpdate;

/**
 * Servlet implementation class UpdateStu
 */
@WebServlet("/UpdateStu")
public class UpdateStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStu() {
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
		
		Student student = new Student();
		
		student.setStudentno(request.getParameter("studentno"));
		student.setSname(request.getParameter("sname"));
		student.setSex(request.getParameter("sex"));
		student.setPoint(Double.parseDouble(request.getParameter("point")));
		student.setPhone(request.getParameter("phone"));
		student.setEmail(request.getParameter("email"));
		student.setClassno(request.getParameter("classno"));
		student.setBirthday(request.getParameter("birthday"));
		
		try {
			resInsert = DoUpdate.DoUpdateStu(student);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(resInsert == 1)
			resInsert = 3;//为统一返回页面设置不同标志来区分
		else
			resInsert = 4;
		request.setAttribute("InsertResult", resInsert);
		request.setAttribute("student", student);
		request.getRequestDispatcher("Sys_of_Stu/student/RegisterStudent_Result.jsp").forward(request, response);
	}

}
