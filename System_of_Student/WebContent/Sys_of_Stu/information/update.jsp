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
	  		<li role="presentation"><a href="../student/student.jsp">学生面板</a></li>
	  		<li role="presentation"><a href="../teacher/teacher.jsp">教师面板</a></li>
	  		<li role="presentation" class="active"><a href="#">修改密码</a></li>
		</ul>
	</div>
	<div class="col-lg-8" style="padding-top: 30px;">
			<div class="page-header col-lg-12" style="margin-top: 0px;">
			  <h1><small>修改密码</small></h1>
			</div>
			<div class="col-lg-8">
				<form action="../.././UpdateAdmin" method="post" class="form-horizontal text-left" name="Regist_form">
					<table style="width:100%; font-size: 15px;">
						<tr>
							<td style="margin-right: 20px;">原始密码</td>
							<td><input type="password" class="form-control" name="oldpass" id="oldpass" placeholder="oldpass" required="required" autocomplete="off" style="margin-bottom: 25px;"onblur="CheckOldpass()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="请输入原密码"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">新密码</td>
							<td><input type="password" class="form-control" name="pass" id="pass" placeholder="pass" required="required" autocomplete="off" style="margin-bottom: 25px;"onblur="CheckNewpass()" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="请输入新密码"></td>
						</tr>
						<tr>
							<td style="margin-right: 20px;">确认密码</td>
							<td><input type="password" class="form-control" name="confirm" id="confirm" placeholder="confirm" required="required" autocomplete="off" style="margin-bottom: 25px;" title="Warning"
								data-container="body" data-toggle="popover" data-placement="right"
								data-content="确认密码输入不一致"></td>
						</tr>
					</table>
					<div style="margin-left: 100px;margin-right: 100px;margin-top: 15px;margin-bottom: 30px;">
						<input type="button" id="submit_btn" class="btn btn-primary btn-lg btn-block" onclick="CheckConfirm()" value="修改">
					</div>
				</form>
				<div id="result" style="display: none;">
					
				</div>
				<script type="text/javascript">
				var xmlhttp;
				function CheckOldpass() {
					var oldpass = document.Regist_form.oldpass.value;
					if(oldpass.length <= 0){
						$('#oldpass').popover('show');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled";
					}
					else{
						$('#oldpass').popover('hide');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block";
					}
				}
				
				function CheckNewpass() {
					var pass = document.Regist_form.pass.value;
					if(pass.length <= 0){
						$('#pass').popover('show');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled";
					}
					else{
						$('#pass').popover('hide');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block";
					}
				}
				
				function CheckConfirm() {
					var pass = document.Regist_form.pass.value;
					var confirm = document.Regist_form.confirm.value;
					if(pass == confirm){
						$('#confirm').popover('hide');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block";
						var oldpass = document.Regist_form.oldpass.value;
						var pass = document.Regist_form.pass.value;
						if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
						else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
						xmlhttp.open("POST","../.././UpdateAdmin",true);
						xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
						xmlhttp.send("oldpass="+oldpass+"&pass="+pass);
						xmlhttp.onreadystatechange=getResult;
						
					}
					else{
						$('#confirm').popover('show');
						document.getElementById("submit_btn").className="btn btn-primary btn-lg btn-block disabled";
					}
				}
				
				function getResult(){
					if (xmlhttp.readyState==4) {		
						if(xmlhttp.status==200){
							var rec=xmlhttp.responseText;
							if(rec == 1){
								var result = document.getElementById("result");
								result.innerHTML = '<p class="lead">密码修改成功，请重新登录</p>';
								result.style.display='';
								var interval=self.setInterval("checkout()",5000);
							}
							else if(rec == 2){
								var result = document.getElementById("result");
								result.innerHTML = '<p class="lead"><strong>原密码输入错误</strong></p>';
								result.style.display='';
							}
							else{
								var result = document.getElementById("result");
								result.innerHTML = '<p class="lead"><strong>密码修改失败</strong></p>';
								result.style.display='';
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