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

import com.Sys_of_Stu.bean.Teacher;
import com.Sys_of_Stu.utils.DoSelect;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SelectTeacher
 */
@WebServlet("/SelectTeacher")
public class SelectTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTeacher() {
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
		
		Teacher teacher = new Teacher();
		
		String teacherno = request.getParameter("teacherno");
		try {
			teacher = DoSelect.selectTeacher(teacherno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		list.add(teacher);//将查询结果放到一个list中
		
		JSONArray listArray = JSONArray.fromObject(list);//将list对象转换为json字符串传回ajax
		String returnstr = listArray.toString();
		pw.print(returnstr);
	}

}
