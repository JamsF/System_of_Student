package com.Sys_of_Stu.bean;
/**
* 
* @author JamsF
* @version 创建时间：2020年5月2日 下午9:20:40
*/
public class Score {
	private String studentno;//学号
	private String sname;//姓名
	private String cname;//课程名
	private double usually;//平时成绩
	private double finall;//期末成绩
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
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public double getUsually() {
		return usually;
	}
	public void setUsually(double usually) {
		this.usually = usually;
	}
	public double getFinall() {
		return finall;
	}
	public void setFinall(double finall) {
		this.finall = finall;
	}
	
}
