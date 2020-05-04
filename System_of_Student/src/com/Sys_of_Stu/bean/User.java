package com.Sys_of_Stu.bean;
/**
* 
* @author JamsF
* @version 创建时间：2020年4月29日 上午10:31:03
*/
public class User {
	private String username;	//用户名
	private String password;	//密码
	private int role;			//用户角色：1、超级管理员	2、教师	3、学生
	private int dataflag;		//帐号状态：1、可用		2、禁用
	public int getDataflag() {
		return dataflag;
	}
	public void setDataflag(int dataflag) {
		this.dataflag = dataflag;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
