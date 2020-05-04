package com.Sys_of_Stu.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Sys_of_Stu.bean.User;
import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @ClassName: DoLogin
 * @Description: TODO(包含登录事务)
 * @author JamsF
 * @date 2020年5月3日下午4:12:23
 */
public class DoLogin {
	
	/**
	 * 
	 * @Title: userLogin
	 * @Description: TODO(处理登录事务)
	 * @author JamsF
	 * @date 2020年5月3日下午4:12:07
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	public static int userLogin(User user) throws SQLException {
		/*
		 * 返回数据说明：
		 * 1、允许登录
		 * 2、密码错误
		 * 3、账号被冻结
		 * 4、用户不存在
		 */
		Connection conn = null;
		PreparedStatement psta = null;
		ComboPooledDataSource datasource = new ComboPooledDataSource("dbPoolc3p0");
		int flag = -1;
			conn = datasource.getConnection();
			String selectUser = "SELECT * FROM admin WHERE username=?";
			psta = conn.prepareStatement(selectUser);
			psta.setString(1, user.getUsername());
			ResultSet rs = psta.executeQuery();
			if(rs.next()) {
				String passW = rs.getString(2);//获取数据库中的密码
				int dataF = rs.getInt(4);//获取数据库中帐号状态
				if(user.getPassword().equals(passW)) {
					//密码匹配成功
					if(dataF == 0) {
						//账号被冻结
						flag = 3;
					}
					else {
						//账号正常，允许登录
						flag = 1;
					}
				}
				else {
					//密码不匹配
					flag = 2;
				}
			}
			else {
				//用户不存在，返回标志
				flag = 4;
			}
		return flag;
	}

}
