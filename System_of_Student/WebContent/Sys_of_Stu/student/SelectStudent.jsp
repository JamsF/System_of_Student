<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Sys_of_Stu.bean.Student" %>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息查询</title>
<link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="../../jquery-1.11.1/jquery.js"></script>
<script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
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
	  		<li role="presentation"><a href="../teacher/teacher.jsp">教师面板</a></li>
	  		<li role="presentation"><a href="../information/update.jsp">修改密码</a></li>
		</ul>
	</div>
	<div class="col-lg-10">
		<div class="col-lg-2" style="padding-top: 50px;text-align: center;">
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation" class="active"><a href="#">学生信息查询</a></li>
			  <li role="presentation"><a href="UpdateStudent.jsp">学生信息修改</a></li>
			  <li role="presentation"><a href="ScoreStudent.jsp">成绩查询</a></li>
			  <li role="presentation"><a href="RegisterStudent.jsp">新生注册</a></li>
			  <li role="presentation"><a href="DeleteStudent.jsp">毕业生移除</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 50px;">
			<div class="col-lg-12">
				<div class="col-lg-4">
					<label class="sr-only" for="inputHelpBlock">Input with help text</label>
					<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock">
					<span id="helpBlock" class="help-block">请输入学生学号进行信息查询</span>
				</div>
				<div>
					<button class="btn btn-primary" onclick="selectstuInfo()">查询学生信息</button>
					<button class="btn btn-info" onclick="selectallInfo()">查询全部学生信息</button>
				</div>
			</div>
			<div class="col-lg-12" id="table_stu" style="margin-top: 20px;display: none;">
				<div class="table-responsive">
				  <table class="table table-condensed" id="stutable">
				  	
				  </table>
				</div>
			</div>
			<script type="text/javascript">
				    var xmlhttp;
					function selectstuInfo(){
						var studentno = document.getElementById("inputHelpBlock").value;
						stutable.innerHTML = '<tr><th>学号</th><th>姓名</th><th>性别</th><th>生日</th><th>班级</th><th>入学成绩</th><th>联系电话</th><th>电子邮件</th></tr>';
						if(studentno.length <= 0){
							document.getElementById("alerttext").innerHTML="请输入要查询的学号";
							$('.alert-danger').removeClass('hide').addClass('in');
						}
						else{
							$('.alert-danger').removeClass('in').addClass('hide');
							if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
							else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
							xmlhttp.open("POST","../.././SelectStu",true);
							xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							xmlhttp.send("studentno="+studentno);
							xmlhttp.onreadystatechange=getResult;
						}
					}
					function selectallInfo(){
						var stutable = document.getElementById("stutable");
						stutable.innerHTML = '<tr><th>学号</th><th>姓名</th><th>性别</th><th>生日</th><th>班级</th><th>入学成绩</th><th>联系电话</th><th>电子邮件</th></tr>';
						if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
						else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
						xmlhttp.open("POST","../.././SelectAllStu",true);
						xmlhttp.send("information=getall");
						xmlhttp.onreadystatechange=getResult;
					}
					function getResult(){
						if (xmlhttp.readyState==4) {		
							if(xmlhttp.status==200){
								var rec=xmlhttp.responseText;
								console.log(rec);
								var arr = JSON.parse(rec);
								var stutable = document.getElementById("stutable");
								for(var i in arr){//遍历arr数组时，i为索引
									var student = eval(arr[i]);
									var birthday = student.birthday;
									var phone = student.phone;
									var sname = student.sname;
									var sex = student.sex;
									var classno = student.classno;
									var studentno = student.studentno;
									var email = student.email;
									var point = student.point;
									stutable.innerHTML += '<tr><td>'+ studentno +'</td><td>'+ sname +'</td><td>'+ sex +'</td><td>'+ birthday +'</td><td>'+ classno +'</td><td>'+ point +'</td><td>'+ phone +'</td><td>'+ email +'</td></tr>';
								}
								document.getElementById("table_stu").style.display='';
							}
						}
					}
			    </script>
		</div>
	</div>
</body>
</html>