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
			  <li role="presentation"><a href="RegisterStudent.jsp">新生注册</a></li>
			  <li role="presentation" class="active"><a href="#">毕业生移除</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 50px;">
			<div class="col-lg-12">
				<div class="col-lg-4">
					<label class="sr-only" for="inputHelpBlock">Input with help text</label>
					<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock"onblur="loadCheck()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="bottom"
								data-content="学生信息不存在">
					<span id="helpBlock" class="help-block">请输入学号进行移除</span>
				</div>
				<div>
					<button class="btn btn-primary" id="btn_delete" onclick="selectstuInfo()">移除学生</button>
				</div>
			</div>
			<script type="text/javascript">
			 	var xmlhttp;
				function selectstuInfo(){
					var studentno = document.getElementById("inputHelpBlock").value;
					if(studentno.length <= 0){
						document.getElementById("alerttext").innerHTML="请输入要删除的学号";
						$('.alert-danger').removeClass('hide').addClass('in');
					}
					else{
						$('.alert-danger').removeClass('in').addClass('hide');
						window.location.href="../.././DeleteStu?studentno="+studentno;
					}
				}
				function loadCheck(){
					var studentno = document.getElementById("inputHelpBlock").value;
					if(studentno.length <= 0){
						document.getElementById("btn_delete").className="btn btn-primary disabled"
					}
					else{
						document.getElementById("btn_delete").className="btn btn-primary"
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
								$('#inputHelpBlock').popover('hide');
								document.getElementById("btn_delete").className="btn btn-primary"
								
							}
							else{
								$('#inputHelpBlock').popover('show');
								document.getElementById("btn_delete").className="btn btn-primary disabled"
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

</body>
</html>