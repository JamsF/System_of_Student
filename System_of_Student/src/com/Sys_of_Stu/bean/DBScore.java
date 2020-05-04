package com.Sys_of_Stu.bean;
/**
* 
* @author JamsF
* @version 创建时间：2020年5月3日 上午11:00:53
*/
public class DBScore {
	private String studentno;//学号
	private String courseno;//课程号
	private double usually;//平时成绩
	private double finall;//期末成绩
	public String getStudentno() {
		return studentno;
	}
	public void setStudentno(String studentno) {
		this.studentno = studentno;
	}
	public String getCourseno() {
		return courseno;
	}
	public void setCourseno(String courseno) {
		this.courseno = courseno;
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
