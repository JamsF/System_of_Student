package com.Sys_of_Stu.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Sys_of_Stu.bean.DBScore;
import com.Sys_of_Stu.bean.Score;
import com.Sys_of_Stu.utils.DoInsert;
import com.Sys_of_Stu.utils.DoSelect;

/**
 * Servlet implementation class ScoreInsert
 */
@WebServlet("/ScoreInsert")
public class ScoreInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreInsert() {
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
		
		DBScore dbscore = new DBScore();
		Score score = new Score();
		
		dbscore.setStudentno(request.getParameter("studentno"));
		dbscore.setCourseno(request.getParameter("courseno"));
		dbscore.setUsually(Double.parseDouble(request.getParameter("usually")));
		dbscore.setFinall(Double.parseDouble(request.getParameter("finall")));
		
		int InsertResult = -1;
		try {
			InsertResult = DoInsert.ScoreInsert(dbscore);
			score = DoSelect.selectScore(dbscore.getStudentno(), dbscore.getCourseno());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("InsertResult", InsertResult);
		request.setAttribute("score", score);
		request.getRequestDispatcher("Sys_of_Stu/teacher/Score_Result.jsp").forward(request, response);
	}

}
