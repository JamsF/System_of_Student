package com.Sys_of_Stu.bean;
/**
* 
* @author JamsF
* @version 创建时间：2020年4月29日 上午10:21:13
*/
public class Student {
	private String studentno;	//学号
	private String sname;		//姓名
	private String sex;			//性别
	private String birthday;	//生日
	private String classno;		//班级号
	private double point;		//入学成绩
	private String phone;		//联系电话
	private String email;		//电子邮件
	public String getStudentno() {
		return studentno;
	}
	public void setStudentno(String studentno) {
		this.studentno = studentno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getClassno() {
		return classno;
	}
	public void setClassno(String classno) {
		this.classno = classno;
	}
	public double getPoint() {
		return point;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
