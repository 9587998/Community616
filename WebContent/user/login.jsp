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
						$("#message").html('<p style="color:#008b45">��½�ɹ�</p><p>���Ժ�....</p>');
						setTimeout(function() {
							window.location.href = "home.xu";
						}, 2000);
					})
			}else if(${sessionScope.qdl}==2){
				$("#lg-form").slideUp('slow', function() {
					$("#message").html('<p style="color:#ff00ff">��ӭ�𾴵Ĺ���Ա��${sessionScope.nn}....</p>');
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
	<!--  ע��Ի���-->
	<div class="modal fade" id="modal-register" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog"
			style="background: rgba(255, 255, 255, .5); border-radius: 18px">
			<div class="modal-content"
				style="background: rgba(255, 255, 255, .5); border-radius: 18px">
				<div class="modal-header"
					style="background: rgba(255, 255, 255, .5); border-radius: 18px">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">��</button>
					<h3 class="modal-title text-center text-primary" id="myModalLabel">�û�ע��</h3>
				</div>
				<form class="form-horizontal" role="form" method="post"
					action="register.xu">
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="username">�û���:</label>
							<div class="col-sm-6">
								<input class="form-control" name="un" type="text" required>
								<span style="color: #ff0000; font-size: 10px">*֧��������ĸ��6-12�ַ�</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="pwd">����:</label>
							<div class="col-sm-6">
								<input class="form-control" name="pw" type="password" required>
								<span id="pwds1" style="color: #ff0000; font-size: 10px">*֧��������ĸ��6-12�ַ�</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="pw2">ȷ������:</label>
							<div class="col-sm-6">
								<input class="form-control" name="pwd2" type="password" required>
								<span id="pwds2" style="color: #ff0000; font-size: 10px">*�����뱣��һ��</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="phone">�ǳ�:</label>
							<div class="col-sm-6">
								<input class="form-control" name="nn" type="text" required>
								<span style="color: #ff0000; font-size: 10px">*֧�����ġ����֡���ĸ��24�ַ�����</span>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">ע��</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">ȡ��</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- ����ģ�� -->
	<iframe allowtransparency="true" frameborder="0" width="350"
		height="96" scrolling="no"
		src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=0&v=0&d=2&bd=0&k=&f=ff00ff&ltf=009944&htf=cc0000&q=1&e=0&a=1&c=71554&w=290&h=96&align=right"></iframe>

	<!--   ��½ģ�� -->
	<div class="lg-container">
		<h1>Community616</h1>
		<form id="lg-form" name="lg-form" method="post" action="login.xu">
			<div>
				<label for="username">�û���:</label> <input type="text" name="un"
					id="username" placeholder="�������û���" />
			</div>
			<div>
				<label for="password">�� ��:</label> <input type="password" name="pw"
					id="password" placeholder="������&nbsp;��&nbsp;��" />
			</div>
			<div>
				<button type="submit" id="login" title="�����ڲ�">��¼</button>
				<a href="#modal-register" role="button" class="btn"
					data-toggle="modal" style="color: inherit;">
					<button type="button" id="login2" onclick="#modal-register"
						title="ע��">ע��</button>
				</a><a style="color: #0000ff" href="yk.xu">�ο�</a>
			</div>
		</form>
		<div id="message"></div>
	</div>

	<div style="width: 100%; height: 66%"></div>


	<!-- ������ -->
	<jsp:include page="/Includes/Bottom.jsp" />