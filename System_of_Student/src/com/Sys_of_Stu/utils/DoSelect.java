package com.Sys_of_Stu.utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Sys_of_Stu.bean.Course;
import com.Sys_of_Stu.bean.Score;
import com.Sys_of_Stu.bean.Student;
import com.Sys_of_Stu.bean.Teacher;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @ClassName: DoSelect
 * @Description: TODO(包含所有的查询方法)
 * @author JamsF
 * @date 2020年5月3日下午4:15:24
 */
public class DoSelect {

	/**
	 * 
	 * @Title: selectScore
	 * @Description: TODO(查询指定学生的所有课程成绩)
	 * @author JamsF
	 * @date 2020年5月3日下午4:17:39
	 * @param studentno
	 * @return ArrayList<Score>
	 * @throws SQLException
	 */
	public static ArrayList<Score> selectScore(String studentno) throws SQLException {
		java.sql.Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		ArrayList<Score> list = new ArrayList<Score>();
		
		conn = datasource.getConnection();
		String selectScore = "SELECT student.studentno,sname,cname,usually,final FROM student,score,course WHERE student.studentno = score.studentno AND score.courseno = course.courseno AND student.studentno =?";
		psta = (PreparedStatement) conn.prepareStatement(selectScore);
		psta.setString(1, studentno);
		ResultSet rs = psta.executeQuery();
		
		while(rs.next()) {
			Score score = new Score();
			score.setStudentno(rs.getString(1));
			score.setSname(rs.getString(2));
			score.setCname(rs.getString(3));
			score.setUsually(rs.getDouble(4));
			score.setFinall(rs.getDouble(5));
			list.add(score);//将查询结果放到一个list中
		}
		psta.close();
		conn.close();
		return list;
	}
	
	/**
	 * 
	 * @Title: selectScore
	 * @Description: TODO(查询指定学生的指定课程成绩)
	 * @author JamsF
	 * @date 2020年5月3日下午4:18:48
	 * @param studentno
	 * @param courseno
	 * @return Score
	 * @throws SQLException
	 */
	public static Score selectScore(String studentno,String courseno) throws SQLException {
		java.sql.Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String selectScore = "SELECT student.studentno,sname,cname,usually,final FROM student,score,course WHERE student.studentno = score.studentno AND score.courseno = course.courseno AND student.studentno =? AND course.courseno = ?";
		psta = (PreparedStatement) conn.prepareStatement(selectScore);
		psta.setString(1, studentno);
		psta.setString(2, courseno);
		ResultSet rs = psta.executeQuery();
		
		Score score = new Score();
		
		if(rs.next()) {
			score.setStudentno(rs.getString(1));
			score.setSname(rs.getString(2));
			score.setCname(rs.getString(3));
			score.setUsually(rs.getDouble(4));
			score.setFinall(rs.getDouble(5));
		}
		psta.close();
		conn.close();
		return score;
	}
	
	/**
	 * 
	 * @Title: selectCourseScore
	 * @Description: TODO(查询指定课程的全部学生成绩)
	 * @author JamsF
	 * @date 2020年5月3日下午5:09:29
	 * @param courseno
	 * @return ArrayList<Score>
	 * @throws SQLException
	 */
	public static ArrayList<Score> selectCourseScore(String courseno) throws SQLException {
		java.sql.Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		ArrayList<Score> list = new ArrayList<Score>();
		
		conn = datasource.getConnection();
		String selectScore = "SELECT student.studentno,sname,cname,usually,final FROM student,score,course WHERE student.studentno = score.studentno AND course.courseno = score.courseno AND course.courseno=?";
		psta = (PreparedStatement) conn.prepareStatement(selectScore);
		psta.setString(1, courseno);
		ResultSet rs = psta.executeQuery();
		
		while(rs.next()) {
			Score score = new Score();
			score.setStudentno(rs.getString(1));
			score.setSname(rs.getString(2));
			score.setCname(rs.getString(3));
			score.setUsually(rs.getDouble(4));
			score.setFinall(rs.getDouble(5));
			list.add(score);//将查询结果放到一个list中
		}
		psta.close();
		conn.close();
		return list;
	}	
	
	/**
	 * 
	 * @Title: selectCourse
	 * @Description: TODO(查询课程号是否合法)
	 * @author JamsF
	 * @date 2020年5月3日下午4:19:30
	 * @param courseno
	 * @return Course
	 * @throws SQLException
	 */
	public static Course selectCourse(String courseno) throws SQLException {
		java.sql.Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String selectCourse = "SELECT * FROM course WHERE courseno = ?";
		psta = (PreparedStatement) conn.prepareStatement(selectCourse);
		psta.setString(1, courseno);
		ResultSet rs = psta.executeQuery();
		
		Course course = new Course();
		
		if(rs.next()) {
			course.setCourseno(rs.getString(1));
			course.setCname(rs.getString(2));
			course.setType(rs.getString(3));
			course.setPeriod(Double.parseDouble(rs.getString(4)));
			course.setCredit(Double.parseDouble(rs.getString(5)));
		}
		psta.close();
		conn.close();
		return course;
	}
	
	/**
	 * 
	 * @Title: selectStu
	 * @Description: TODO(根据学号查询学生信息)
	 * @author JamsF
	 * @date 2020年5月3日下午4:20:23
	 * @param studentno
	 * @return Student
	 * @throws SQLException
	 */
	public static Student selectStu(String studentno) throws SQLException {
		java.sql.Connection conn = null;
		java.sql.PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		Student student = new Student();
		
		conn = datasource.getConnection();
		String selectUser = "SELECT * FROM student WHERE studentno=?";
		psta = conn.prepareStatement(selectUser);
		psta.setString(1, studentno);
		ResultSet rs = psta.executeQuery();
		
		if(rs.next()) {
			student.setStudentno(rs.getString(1));
			student.setSname(rs.getString(2));
			student.setSex(rs.getString(3));
			student.setBirthday(rs.getString(4));
			student.setClassno(rs.getString(5));
			student.setPoint(rs.getDouble(6));
			student.setPhone(rs.getString(7));
			student.setEmail(rs.getString(8));
		}
		psta.close();
		conn.close();
		return student;
	}
	
	/**
	 * 
	 * @Title: selectAllStu
	 * @Description: TODO(查询所有学生信息)
	 * @author JamsF
	 * @date 2020年5月3日下午4:21:09
	 * @return ArrayList<Student>
	 * @throws SQLException
	 */
	public static ArrayList<Student> selectAllStu() throws SQLException {
		java.sql.Connection conn = null;
		java.sql.Statement sta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		ArrayList<Student> list = new ArrayList<Student>();
		
		conn = datasource.getConnection();
		String selectUser = "SELECT * FROM student";
		sta = conn.createStatement();
		ResultSet rs = sta.executeQuery(selectUser);
		
		while(rs.next()) {
			Student student = new Student();
			student.setStudentno(rs.getString(1));
			student.setSname(rs.getString(2));
			student.setSex(rs.getString(3));
			student.setBirthday(rs.getString(4));
			student.setClassno(rs.getString(5));
			student.setPoint(rs.getDouble(6));
			student.setPhone(rs.getString(7));
			student.setEmail(rs.getString(8));
			list.add(student);//将查询结果放到一个list中
		}
		sta.close();
		conn.close();
		return list;
	}
	
	/**
	 * 
	 * @Title: selectTeacher
	 * @Description: TODO(查询指定教师信息)
	 * @author JamsF
	 * @date 2020年5月3日下午4:22:43
	 * @param teacherno
	 * @return Teacher
	 * @throws SQLException
	 */
	public static Teacher selectTeacher(String teacherno) throws SQLException {
		java.sql.Connection conn = null;
		java.sql.PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		Teacher teacher = new Teacher();
		
		conn = datasource.getConnection();
		String selectteacher = "SELECT * FROM teacher WHERE teacherno=?";
		psta = conn.prepareStatement(selectteacher);
		psta.setString(1, teacherno);
		ResultSet rs = psta.executeQuery();
		
		if(rs.next()) {
			teacher.setTeacherno(rs.getString(1));
			teacher.setTname(rs.getString(2));
			teacher.setMajor(rs.getString(3));
			teacher.setProf(rs.getString(4));
			teacher.setDepartment(rs.getString(5));
		}
		psta.close();
		conn.close();
		return teacher;
	}
	
	/**
	 * 
	 * @Title: selectAllTeacher
	 * @Description: TODO(查询所有教师信息)
	 * @author JamsF
	 * @date 2020年5月3日下午4:23:19
	 * @return ArrayList<Teacher>
	 * @throws SQLException
	 */
	public static ArrayList<Teacher> selectAllTeacher() throws SQLException {
		java.sql.Connection conn = null;
		java.sql.Statement sta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		
		conn = datasource.getConnection();
		String selectAllTeacher = "SELECT * FROM teacher";
		sta = conn.createStatement();
		ResultSet rs = sta.executeQuery(selectAllTeacher);
		
		while(rs.next()) {
			Teacher teacher = new Teacher();
			teacher.setTeacherno(rs.getString(1));
			teacher.setTname(rs.getString(2));
			teacher.setMajor(rs.getString(3));
			teacher.setProf(rs.getString(4));
			teacher.setDepartment(rs.getString(5));
			list.add(teacher);//将查询结果放到一个list中
		}
		sta.close();
		conn.close();
		return list;
	}
	
	/**
	 * 
	 * @Title: selectUserpass
	 * @Description: TODO(查询指定用户的密码)
	 * @author JamsF
	 * @date 2020年5月3日下午6:28:19
	 * @param username
	 * @return
	 * @throws SQLException
	 */
	public static String selectUserpass(String username) throws SQLException {
		java.sql.Connection conn = null;
		java.sql.PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String selectUserpass = "SELECT password FROM admin where username=?";
		psta = conn.prepareStatement(selectUserpass);
		psta.setString(1, username);
		ResultSet rs = psta.executeQuery();
		
		String password = "";
		
		if(rs.next()) {
			password = rs.getString(1);
		}
		psta.close();
		conn.close();
		return password;
	}
}
