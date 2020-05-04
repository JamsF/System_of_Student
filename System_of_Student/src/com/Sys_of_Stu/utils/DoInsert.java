package com.Sys_of_Stu.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.Sys_of_Stu.bean.DBScore;
import com.Sys_of_Stu.bean.Student;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @ClassName: DoInsert
 * @Description: TODO(包含所有的注册及添加方法)
 * @author JamsF
 * @date 2020年5月3日下午4:11:40
 */
public class DoInsert {
	
	/**
	 * 
	 * @Title: DoRegisterStu
	 * @Description: TODO(执行注册学生事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:04:12
	 * @param student
	 * @return int
	 * @throws SQLException
	 */
	public static int DoRegisterStu(Student student) throws SQLException {
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String InsterStu = "INSERT INTO student VALUE(?,?,?,?,?,?,?,?)";
		psta = conn.prepareStatement(InsterStu);
		
		psta.setString(1, student.getStudentno());
		psta.setString(2, student.getSname());
		psta.setString(3, student.getSex());
		psta.setString(4, student.getBirthday());
		psta.setString(5, student.getClassno());
		psta.setDouble(6, student.getPoint());
		psta.setString(7, student.getPhone());
		psta.setString(8, student.getEmail());
		
		int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
		
		return rsInsert;
	}
	
	/**
	 * 
	 * @Title: ScoreInsert
	 * @Description: TODO(执行成绩录入事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:06:31
	 * @param dbscore
	 * @return int
	 * @throws SQLException
	 */
	public static int ScoreInsert(DBScore dbscore) throws SQLException {
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String InsterStu = "INSERT INTO score VALUE(?,?,?,?)";
		psta = conn.prepareStatement(InsterStu);
		
		psta.setString(1, dbscore.getStudentno());
		psta.setString(2, dbscore.getCourseno());
		psta.setDouble(3, dbscore.getUsually());
		psta.setDouble(4, dbscore.getFinall());
		
		int rsInsert = psta.executeUpdate();//插入成功返回受影响的行数
		
		return rsInsert;
	}

}
