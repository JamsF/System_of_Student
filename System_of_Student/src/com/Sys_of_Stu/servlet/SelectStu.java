package com.Sys_of_Stu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sys_of_Stu.bean.Student;
import com.Sys_of_Stu.utils.DoSelect;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SelectStu
 */
@WebServlet("/SelectStu")
public class SelectStu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStu() {
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
		PrintWriter pw = response.getWriter();
		
		Student student = new Student();
		
		String studentno = request.getParameter("studentno");
		try {
			student = DoSelect.selectStu(studentno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Student> list = new ArrayList<Student>();
		list.add(student);//将查询结果放到一个list中
		
		JSONArray listArray = JSONArray.fromObject(list);//将list对象转换为json字符串传回ajax
		String returnstr = listArray.toString();
		pw.print(returnstr);
	}

}
