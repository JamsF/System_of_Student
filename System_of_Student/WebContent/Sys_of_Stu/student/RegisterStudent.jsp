<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新生注册</title>
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
			  <li role="presentation"><a href="SelectStudent.jsp">学生信息查询</a></li>
			  <li role="presentation"><a href="UpdateStudent.jsp">学生信息修改</a></li>
			  <li role="presentation"><a href="ScoreStudent.jsp">成绩查询</a></li>
			  <li role="presentation" class="active"><a href="#">新生注册</a></li>
			  <li role="presentation"><a href="DeleteStudent.jsp">毕业生移除</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 30px;">
			<div class="page-header col-lg-12" style="margin-top: 0px;">
			  <h1><small>请直接输入要注册的学生信息</small></h1>
			</div>
			<div class="col-lg-8">
				<form action="../.././RegisterStu" method="post" class="form-horizontal text-left" name="Regist_form">
					<table style="width:100%; font-size: 15px;">
						<tr>
							<td style="margin-right: 20px;">学号</td>
							<td><input type="text" class="form-control" name="studentno" id="studentno" placeholder="studentno" required="required" autocomplete="off" style="margin-bottom: 25px;"onblur="loadCheck()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="存在重学生编号，不允许注册"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">姓名</td>
							<td><input type="text" class="form-control" name="sname" id="sname" placeholder="sname" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">性别</td>
							<td><input type="text" class="form-control" name="sex" id="sex" placeholder="sex" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">生日</td>
							<td><input type="text" class="form-control" name="birthday" id="birthday" placeholder="birthday" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">班级</td>
							<td><input type="text" class="form-control" name="classno" id="classno" placeholder="classno" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">入学成绩</td>
							<td><input type="number" class="form-control" name="point" id="point" placeholder="point" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">联系电话</td>
							<td><input type="tel" class="form-control" name="phone" id="phone" placeholder="phone" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">电子邮件</td>
							<td><input type="email" class="form-control" name="email" id="email" placeholder="email" required="required" autocomplete="off" style="margin-bottom: 25px;"></td>
						</tr>
					</table>
					<div style="margin-left: 100px;margin-right: 100px;margin-top: 15px;margin-bottom: 30px;">
						<input type="submit" id="submit_btn" class="btn btn-primary btn-lg btn-block" value="注册">
					</div>
				</form>
				<script type="text/javascript">
				var xmlhttp;
				function loadCheck(){
					var studentno = document.Regist_form.studentno.value;
					console.log(studentno);
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
								$('#studentno').popover('show');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled"
								
							}
							else{
								$('#studentno').popover('hide');
								document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block"
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