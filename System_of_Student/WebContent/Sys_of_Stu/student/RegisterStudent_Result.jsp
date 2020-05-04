<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import="java.lang.*" %>
    <%@ page import="com.Sys_of_Stu.bean.Student" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生面板</title>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<link rel="stylesheet" href="${path}/bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="${path}/jquery-1.11.1/jquery.js"></script>
<script type="text/javascript" src="${path}/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
	<div class="alert alert-danger alert-dismissable hide" role="alert" style="position: absolute;top:50px;right: 10px;">
	       <button type="button" class="close" data-dismiss="alert" aria-label="Close">          
	          <span aria-hidden="true">&times;</span>
	       </button>
	       <strong id="alerttext"> </strong>
	</div>
	<div id="head_tit" class="col-lg-12" style="height:50px;padding-top: 5px;padding-bottom:5px;box-shadow: 0px 1px 4px rgba(0,0,0,0.4);">
		<div class="col-lg-8"></div>
		<div class="col-lg-2" style="position: relative;top:50%;transform:translateY(-50%);">
			<span id="tit_time" style="margin-right: 20px;"></span>
			<script type="text/javascript">
				var interval=self.setInterval("gettime()",500)
				function gettime() {
					var time = new Date();
					var timestr = time.toLocaleString();
					var tit_time = document.getElementById("tit_time");
					tit_time.innerText=timestr;
				}
			</script>
		</div>
		<div class="col-lg-1" style="font-size: 20px;position: relative;top:50%;transform:translateY(-50%);">
			<span class="glyphicon glyphicon glyphicon-user" aria-hidden="true"> </span>  ${cookie.username.value}
		</div>
		<div class="col-lg-1" style="position: relative;top:50%;transform:translateY(-50%);">
			<span style="margin-right: 20px;"><button class="btn btn-danger" onclick="checkout()">注销登录</button></span>
			<script type="text/javascript">
				function checkout() {
					document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/System_of_Student;";
					document.cookie = "password=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/System_of_Student;";
					window.location.href="../../Login.jsp";
				}
			</script>
		</div>
	</div>
	<div class="col-lg-2" style="padding-top: 20px;text-align: center;">
		<ul class="nav nav-pills nav-stacked">
	  		<li role="presentation" class="active"><a href="#">学生面板</a></li>
	  		<li role="presentation"><a href="${path}/Sys_of_Stu/teacher/teacher.jsp">教师面板</a></li>
	  		<li role="presentation"><a href="${path}/Sys_of_Stu/information/update.jsp">修改密码</a></li>
		</ul>
	</div>
	<div class="col-lg-10">
		<div class="col-lg-2" style="padding-top: 50px;text-align: center;">
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation"><a href="${path}/Sys_of_Stu/student/SelectStudent.jsp">学生信息查询</a></li>
			  <li role="presentation"><a href="${path}/Sys_of_Stu/student/UpdateStudent.jsp">学生信息修改</a></li>
			  <li role="presentation"><a href="${path}/Sys_of_Stu/student/ScoreStudent.jsp">成绩查询</a></li>
			  <li role="presentation"><a href="${path}/Sys_of_Stu/student/RegisterStudent.jsp">新生注册</a></li>
			  <li role="presentation"><a href="${path}/Sys_of_Stu/student/DeleteStudent.jsp">毕业生移除</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 50px;">
			<% 
				int result = (int)request.getAttribute("InsertResult");
				String resultstr = "";
				Student student = (Student)request.getAttribute("student");
				if(result == 1){
					resultstr = "注册结果： 恭喜你，下列学生信息注册成功";
				}
				else if(result == 2){
					resultstr = "注册结果： 对不起，下列学生信息注册失败";
				}
				else if(result == 3){
					resultstr = "修改结果： 恭喜你，下列学生信息修改成功";
				}
				else if(result == 4){
					resultstr = "修改结果： 对不起，下列学生信息修改失败";
				}
				else if(result == 5){
					resultstr = "移除结果： 恭喜你，下列学生信息移除成功";
				}
				else if(result == 6){
					resultstr = "移除结果： 对不起，下列学生信息移除失败";
				}
			%>
			<h1><%=resultstr %></h1>
			<table class="table table-condensed" style="margin-top: 40px;">
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>出生日期</th>
					<th>班级</th>
					<th>入学成绩</th>
					<th>联系方式</th>
					<th>电子邮箱</th>
				</tr>
				<tr>
					<td><%=student.getStudentno() %></td>
					<td><%=student.getSname() %></td>
					<td><%=student.getSex() %></td>
					<td><%=student.getBirthday() %></td>
					<td><%=student.getClassno() %></td>
					<td><%=student.getPoint() %></td>
					<td><%=student.getPhone() %></td>
					<td><%=student.getEmail() %></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>