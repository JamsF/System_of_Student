package com.Sys_of_Stu.utils;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @ClassName: DoDelete
 * @Description: TODO(包含所有的删除方法)
 * @author JamsF
 * @date 2020年5月3日下午4:08:04
 */
public class DoDelete {
	
	/**
	 * 
	 * @Title: deleteStu
	 * @Description: TODO(执行学生删除事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:08:22
	 * @param studentno
	 * @return int
	 * @throws SQLException
	 */
	public static int deleteStu(String studentno) throws SQLException {
		java.sql.Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		
		conn = datasource.getConnection();
		String selectScore = "DELETE FROM student where studentno=?";
		psta = (PreparedStatement) conn.prepareStatement(selectScore);
		psta.setString(1, studentno);
		int rs = psta.executeUpdate();
		System.out.println("删除结果：" + rs);
		
		psta.close();
		conn.close();
		return rs;
	}
}
