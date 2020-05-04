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
	  		<li role="presentation" class="active"><a href="#">教师面板</a></li>
	  		<li role="presentation"><a href="../information/update.jsp">修改密码</a></li>
		</ul>
	</div>
	<div class="col-lg-10">
		<div class="col-lg-2" style="padding-top: 50px;text-align: center;">
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation" class="active"><a href="#">教师信息查询</a></li>
			  <li role="presentation"><a href="UpdateTeacher.jsp">教师信息修改</a></li>
			  <li role="presentation"><a href="ScoreInput.jsp">成绩录入</a></li>
			  <li role="presentation"><a href="ScoreSelect.jsp">成绩查询</a></li>
			  <li role="presentation"><a href="ScoreUpdate.jsp">成绩修改</a></li>
			</ul>
		</div>
		<div class="col-lg-10" style="padding-top: 50px;">
			<div class="col-lg-12">
				<div class="col-lg-4">
					<label class="sr-only" for="inputHelpBlock">Input with help text</label>
					<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock">
					<span id="helpBlock" class="help-block">请输入教师编号进行信息查询</span>
				</div>
				<div>
					<button class="btn btn-primary" onclick="selectstuInfo()">查询教师信息</button>
					<button class="btn btn-info" onclick="selectallInfo()">查询全部教师信息</button>
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
						var teacherno = document.getElementById("inputHelpBlock").value;
						stutable.innerHTML = '<tr><th>工号</th><th>姓名</th><th>专业</th><th>职称</th><th>所属学院</th></tr>';
						if(teacherno .length <= 0){
							document.getElementById("alerttext").innerHTML="请输入要查询的教师编号";
							$('.alert-danger').removeClass('hide').addClass('in');
						}
						else{
							$('.alert-danger').removeClass('in').addClass('hide');
							if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
							else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
							xmlhttp.open("POST","../.././SelectTeacher",true);
							xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							xmlhttp.send("teacherno="+teacherno);
							xmlhttp.onreadystatechange=getResult;
						}
					}
					function selectallInfo(){
						var stutable = document.getElementById("stutable");
						stutable.innerHTML = '<tr><th>工号</th><th>姓名</th><th>专业</th><th>职称</th><th>所属学院</th></tr>';
						if (window.XMLHttpRequest) {xmlhttp=new XMLHttpRequest();}
						else{xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");}	
						xmlhttp.open("POST","../.././SelectAllTeacher",true);
						xmlhttp.send("information=getall");
						xmlhttp.onreadystatechange=getResult;
					}
					function getResult(){
						if (xmlhttp.readyState==4) {		
							if(xmlhttp.status==200){
								var rec=xmlhttp.responseText;
								var arr = JSON.parse(rec);
								var stutable = document.getElementById("stutable");
								for(var i in arr){//遍历arr数组时，i为索引
									var teacher = eval(arr[i]);
									var teacherno = teacher.teacherno;
									var tname = teacher.tname;
									var major = teacher.major;
									var prof = teacher.prof;
									var department = teacher.department;
									stutable.innerHTML += '<tr><td>'+ teacherno +'</td><td>'+ tname +'</td><td>'+ major +'</td><td>'+ prof +'</td><td>'+ department +'</td></tr>';
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