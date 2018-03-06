<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="login-Community616" name="title" />
</jsp:include>
<script type="text/javascript"> 
			$(function() {			
				if(${sessionScope.qdl}==1){
					$("#lg-form").slideUp('slow', function() {
						$("#message").html('<p style="color:#008b45">登陆成功</p><p>请稍后....</p>');
						setTimeout(function() {
							window.location.href = "home.xu";
						}, 2000);
					})
			}else if(${sessionScope.qdl}==2){
				$("#lg-form").slideUp('slow', function() {
					$("#message").html('<p style="color:#ff00ff">欢迎尊敬的管理员：${sessionScope.nn}....</p>');
					setTimeout(function() {
						window.location.href = "kzt.xu";
					}, 3000);
				})
		}
				});
		</script>
</head>
<body background="images/BG/bg_Login.jpg"
	style="height: 100%; width: 100%">
	<!--  注册对话框-->
	<div class="modal fade" id="modal-register" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog"
			style="background: rgba(255, 255, 255, .5); border-radius: 18px">
			<div class="modal-content"
				style="background: rgba(255, 255, 255, .5); border-radius: 18px">
				<div class="modal-header"
					style="background: rgba(255, 255, 255, .5); border-radius: 18px">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title text-center text-primary" id="myModalLabel">用户注册</h3>
				</div>
				<form class="form-horizontal" role="form" method="post"
					action="register.xu">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="username">用户名:</label>
							<div class="col-sm-6">
								<input class="form-control" name="un" type="text" required>
								<span style="color: #ff0000; font-size: 10px">*支持数字字母，6-12字符</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="pwd">密码:</label>
							<div class="col-sm-6">
								<input class="form-control" name="pw" type="password" required>
								<span id="pwds1" style="color: #ff0000; font-size: 10px">*支持数字字母，6-12字符</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="pw2">确认密码:</label>
							<div class="col-sm-6">
								<input class="form-control" name="pwd2" type="password" required>
								<span id="pwds2" style="color: #ff0000; font-size: 10px">*与密码保持一致</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="phone">昵称:</label>
							<div class="col-sm-6">
								<input class="form-control" name="nn" type="text" required>
								<span style="color: #ff0000; font-size: 10px">*支持中文、数字、字母，24字符以内</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">注册</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 天气模块 -->
	<iframe allowtransparency="true" frameborder="0" width="350"
		height="96" scrolling="no"
		src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=0&v=0&d=2&bd=0&k=&f=ff00ff&ltf=009944&htf=cc0000&q=1&e=0&a=1&c=71554&w=290&h=96&align=right"></iframe>

	<!--   登陆模块 -->
	<div class="lg-container">
		<h1>Community616</h1>
		<form id="lg-form" name="lg-form" method="post" action="login.xu">
			<div>
				<label for="username">用户名:</label> <input type="text" name="un"
					id="username" placeholder="请输入用户名" />
			</div>
			<div>
				<label for="password">密 码:</label> <input type="password" name="pw"
					id="password" placeholder="请输入&nbsp;密&nbsp;码" />
			</div>
			<div>
				<button type="submit" id="login" title="进入内部">登录</button>
				<a href="#modal-register" role="button" class="btn"
					data-toggle="modal" style="color: inherit;">
					<button type="button" id="login2" onclick="#modal-register"
						title="注册">注册</button>
				</a><a style="color: #0000ff" href="yk.xu">游客</a>
			</div>
		</form>
		<div id="message"></div>
	</div>

	<div style="width: 100%; height: 66%"></div>


	<!-- 到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />