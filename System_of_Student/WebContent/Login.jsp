<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录/Login</title>
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<script src="jquery-1.11.1/jquery.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	</head>
	<body>
		<div class="alert alert-danger alert-dismissable hide" role="alert" style="position: absolute;left: 0;right: 0;">
	       <button type="button" class="close" data-dismiss="alert" aria-label="Close">          
	          <span aria-hidden="true">&times;</span>
	       </button>
	       <strong id="alerttext"> </strong>
	   </div>
		<div class="col-lg-2"> </div>
		<div class="col-lg-8" style="height:375px; margin-top: 150px;position: relative;top: 50%;transfrom:translateY(-50%);box-shadow: 6px 6px 6px rgba(0,0,0,0.4);padding: 0;">
			<div class="col-lg-7" style="background-image: url('img/Login_bg.jpeg');background-size: cover;height: 100%;padding: 0;">
				<h2 id="tit_left" class="text-center" style="position: absolute;top: 23%;left: 25%;color: #FFF;font-family: serif;">学 生 管 理 系 统</h2>
			</div>
			<div class="col-lg-5" style="padding: 15px;">
				<p style="font-family:inherit;font-size: 25px;margin: 5px;margin-bottom: 30px;">登录/Login</p>
				<form class="form-horizontal text-left" name="login_form" method="post" action="Login" style="margin: 10px;mar">
			  		<div class="form-group">
			    		<div class="col-sm-10">
			      			<input type="text" class="form-control" name="Username" id="Username" placeholder="Username" required="required" autocomplete="off" style="margin-bottom: 25px;">
			      			<input type="password" class="form-control" name="Password" id="Password" placeholder="Password" required="required">
			    		</div>
			  		</div>
			  		<div class="form-group">
			    		<div style="margin-top: 10px;margin-left: 0;padding-left: 15px;padding-right: 75px;">
			      			<input type="button" class="btn btn-primary btn-lg btn-block" onclick="checkLogin()" value="登录">
			    		</div>
			  		</div>
			  		<div class="form-group" style="margin-top: 20px;margin-bottom: 20px;padding-left: 15px;padding-right: 75px;">
			    		<div >
				  			<div>
					  			<input type="button" class="btn btn-warning btn-lg btn-block " value="忘记密码" data-toggle="modal" data-target="#myModal">
				  			</div>
				  		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                <h4 class="modal-title" id="myModalLabel">提示 / Tips</h4>
					            </div>
					            <div class="modal-body">如果您忘记了自己的密码，请与您的系统管理员联系</div>
					        </div><!-- /.modal-content -->
					    </div><!-- /.modal -->
					</div>
			    </div>
			  </div>
			</form>
			</div>
		</div>
		<script type="text/javascript">
				    var xmlhttp;
					function checkLogin(){
						var username = document.getElementById("Username").value;
						var password = document.getElementById("Password").value;
						if(username.length <= 0 || password.length<=0){
							document.getElementById("alerttext").innerHTML="用户名或密码为空";
							$('.alert-danger').removeClass('hide').addClass('in');
						}
						else{
							$('.alert-danger').removeClass('in').addClass('hide');
							if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
							else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
							xmlhttp.open("POST","./Login",true);
							xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							xmlhttp.send("username="+username+"&password="+password);
							xmlhttp.onreadystatechange=getResult;
						}
					}
					
					function getResult(){
						if (xmlhttp.readyState==4) {		
							if(xmlhttp.status==200){
								var rec=xmlhttp.responseText;
								if(rec == 1){
									window.location.href="Sys_of_Stu/index.jsp";
								}
								if(rec == 2){
									document.getElementById("alerttext").innerHTML="用户名与密码不匹配";
									$('.alert-danger').removeClass('hide').addClass('in');
								}
								if(rec == 3){
									document.getElementById("alerttext").innerHTML="该账号已被禁用";
									$('.alert-danger').removeClass('hide').addClass('in');
								}
								if(rec == 4){
									document.getElementById("alerttext").innerHTML="账号不存在";
									$('.alert-danger').removeClass('hide').addClass('in');
								}
							}
							else{
								document.getElementById("alerttext").innerHTML="服务器连接失败";
								$('.alert-danger').removeClass('hide').addClass('in');
							}
						}
					}
			    </script>
	</body>
</html>
