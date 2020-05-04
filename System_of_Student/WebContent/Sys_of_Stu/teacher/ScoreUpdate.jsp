<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.css">
<script type="text/javascript" src="../../jquery-1.11.1/jquery.js"></script>
<script type="text/javascript" src="../../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
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
	  		<li role="presentation"><a href="../student/student.jsp">学生面板</a></li>
	  		<li role="presentation" class="active"><a href="#">教师面板</a></li>
	  		<li role="presentation"><a href="../information/update.jsp">修改密码</a></li>
		</ul>
	</div>
	<div class="col-lg-10">
		<div class="col-lg-2" style="padding-top: 50px;text-align: center;">
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation"><a href="SelectTeacher.jsp">教师信息查询</a></li>
			  <li role="presentation"><a href="UpdateTeacher.jsp">教师信息修改</a></li>
			  <li role="presentation"><a href="ScoreInput.jsp">成绩录入</a></li>
			  <li role="presentation"><a href="ScoreSelect.jsp">成绩查询</a></li>
			  <li role="presentation" class="active"><a href="#">成绩修改</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 30px;">
			<div class="page-header col-lg-12" style="margin-top: 0px;">
			  <h1><small>成绩修改</small></h1>
			</div>
			<div class="col-lg-8">
				<form action="../.././ScoreUpdate" method="post" class="form-horizontal text-left" name="Regist_form">
					<table style="width:100%; font-size: 15px;">
						<tr>
							<td style="margin-right: 20px;">学号</td>
							<td><input type="text" class="form-control" name="studentno" id="studentno" placeholder="studentno" required="required" autocomplete="off" style="margin-bottom: 25px;"onblur="loadCheck()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="学生信息不存在"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">课程号</td>
							<td><input type="text" class="form-control" name="courseno" id="courseno" placeholder="courseno" required="required" autocomplete="off" style="margin-bottom: 25px;"onblur="CheckCourse()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="课程信息不存在"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">平时成绩</td>
							<td><input type="text" class="form-control" name="usually" id="usually" placeholder="usually" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">期末成绩</td>
							<td><input type="text" class="form-control" name="finall" id="finall" placeholder="finall" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
					</table>
					<div style="margin-left: 100px;margin-right: 100px;margin-top: 15px;margin-bottom: 30px;">
						<input type="submit" id="submit_btn" class="btn btn-primary btn-lg btn-block" value="修改">
					</div>
				</form>
				<script type="text/javascript">
				var xmlhttp;
				function loadCheck(){
					var studentno = document.Regist_form.studentno.value;
					if(studentno.length <= 0){
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled"
					}
					else{
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block"
						if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
						else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
						xmlhttp.open("POST","../.././CheckRegister",true);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("studentno="+studentno);
						xmlhttp.onreadystatechange=getResult;
					}
					
				}
				
				function getResult(){
					if (xmlhttp.readyState==4) {		
						if(xmlhttp.status==200){
							var rec=xmlhttp.responseText;
							if(rec == "false"){
								$('#studentno').popover('hide');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block"
								
							}
							else{
								$('#studentno').popover('show');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled"
							}
						}
						else{
							alert("连接失败");
						}
					}
				}
				
				
				function CheckCourse(){
					var courseno = document.Regist_form.courseno.value;
					if(courseno.length <= 0){
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled"
					}
					else{
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block"
						if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
						else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
						xmlhttp.open("POST","../.././CheckCourse",true);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("courseno="+courseno);
						xmlhttp.onreadystatechange=getResultCourse;
					}
					
				}
				function getResultCourse(){
					if (xmlhttp.readyState==4) {		
						if(xmlhttp.status==200){
							var rec=xmlhttp.responseText;
							if(rec == "false"){
								$('#courseno').popover('hide');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block"
								
							}
							else{
								$('#courseno').popover('show');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled"
							}
						}
						else{
							alert("连接失败");
						}
					}
				}
				</script>
			</div>
		</div>
	</div>

	
</body>
</html>