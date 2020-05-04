package com.Sys_of_Stu.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Sys_of_Stu.bean.DBScore;
import com.Sys_of_Stu.bean.Student;
import com.Sys_of_Stu.bean.Teacher;
import com.Sys_of_Stu.bean.User;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @ClassName: DoUpdate
 * @Description: TODO(包含所有的修改和更新方法)
 * @author JamsF
 * @date 2020年5月3日下午4:12:57
 */
public class DoUpdate {
	
	/**
	 * 
	 * @Title: DoUpdateStu
	 * @Description: TODO(处理修改学生信息事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:13:36
	 * @param student
	 * @return int
	 * @throws SQLException
	 */
	public static int DoUpdateStu(Student student) throws SQLException {
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String UpdateStu = "UPDATE student SET sname=?,sex=?,birthday=?,classno=?,point=?,phone=?,email=? where studentno=?";
		psta = conn.prepareStatement(UpdateStu);
		
		psta.setString(8, student.getStudentno());
		psta.setString(1, student.getSname());
		psta.setString(2, student.getSex());
		psta.setString(3, student.getBirthday());
		psta.setString(4, student.getClassno());
		psta.setDouble(5, student.getPoint());
		psta.setString(6, student.getPhone());
		psta.setString(7, student.getEmail());
		
		int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
		
		return rsInsert;
	}
	
	
	/**
	 * 
	 * @Title: DoUpdateTeacher
	 * @Description: TODO(处理修改教师信息事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:14:37
	 * @param teacher
	 * @return int
	 * @throws SQLException
	 */
	public static int DoUpdateTeacher(Teacher teacher) throws SQLException {
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String UpdateStu = "UPDATE teacher SET tname=?,major=?,prof=?,department=? where teacherno=?";
		psta = conn.prepareStatement(UpdateStu);
		
		psta.setString(5, teacher.getTeacherno());
		psta.setString(1, teacher.getTname());
		psta.setString(2, teacher.getMajor());
		psta.setString(3, teacher.getProf());
		psta.setString(4, teacher.getDepartment());
		
		int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
		
		return rsInsert;
	}
	
	/**
	 * 
	 * @Title: DoUpdateScore
	 * @Description: TODO(处理修改学生成绩事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:48:46
	 * @param dbscore
	 * @return int
	 * @throws SQLException
	 */
	public static int DoUpdateScore(DBScore dbscore) throws SQLException {
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String UpdateStu = "UPDATE score SET usually=?,final=? where studentno=? AND courseno=?";
		psta = conn.prepareStatement(UpdateStu);
		
		psta.setDouble(1, dbscore.getUsually());
		psta.setDouble(2, dbscore.getFinall());
		psta.setString(3, dbscore.getStudentno());
		psta.setString(4, dbscore.getCourseno());
		
		int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
		
		return rsInsert;
	}
	
	
	public static int DoUpdateAdmin(String oldpass,User user) throws SQLException {
		if(oldpass.equals(DoSelect.selectUserpass(user.getUsername()))) {
			Connection conn = null;
			PreparedStatement psta = null;
			ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
			
			conn = datasource.getConnection();
			String UpdateStu = "UPDATE admin SET password=? where username=?";
			psta = conn.prepareStatement(UpdateStu);
			
			psta.setString(1, user.getPassword());
			psta.setString(2, user.getUsername());
			
			int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
			
			return rsInsert;
		}
		else
			return 2;//与原密码不匹配，返回2
	}
}
