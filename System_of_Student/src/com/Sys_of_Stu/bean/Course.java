package com.Sys_of_Stu.bean;
/**
* 
* @author JamsF
* @version 创建时间：2020年5月3日 下午3:20:09
*/
public class Course {
	private String courseno;
	private String cname;
	private String type;
	private double period;
	private double credit;
	public String getCourseno() {
		return courseno;
	}
	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPeriod() {
		return period;
	}
	public void setPeriod(double period) {
		this.period = period;
	}
	public double getCredit() {
		return credit;
	}
	public void setCredit(double credit) {
		this.credit = credit;
	}
	
}
