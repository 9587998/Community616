<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="Includes/head.jsp">
	<jsp:param value="About-Community616" name="title" />
</jsp:include>

</head>
<body style="height: 100%; background: rgba(0, 139, 139, .5);">
	<!-- 导入标题栏-->
	<jsp:include page="Includes/navbar.jsp" />
	<div class="container-fluid" style="margin-top: 60px;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">

					<div class="cont_right"
						style="background: rgba(255, 255, 224, .8); border-radius: 10px;">
						<div class="cont_word">
							<h2>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;利用MVC+MySQL+服务器实现一个可以帮同学发布自己做的项目到外网上的功能。
							</h2>
							<p>
								<br /> 网址：http://www.community616.top<br /> 用户层：<br />
								·实现了网站展示和简单的留言板功能。<br />
								·用户不登陆时可以以游客模式进入首页并查看网站列表，留言板，但不能发布留言和申请发布网站<br />
								·登陆后可以进行留言，申请发布网站申请等操作，阅读了发布网站的流程后可以提交发布申请，<br />
								我审核通过后即在首页展示用户发布的项目，发布成功的项目网址一般为：http://www.community616.top/项目文件夹名<br />
								·注：发布到外网后随时随地通过网址就能访问了，可以在过年时给亲戚朋友看看，这就是自己做的Web项目，留个纪念也好。<br />
								管理层：<br /> ·以管理员账户登录后将会跳转至管理员控制台，实现对用户信息，留言，申请记录，<br />
								用户网站的一系列操作以及对本站的更新等操作。<br />
								<br /> 感谢教我人机交互的赵旭老师和教我Web的张娜老师的帮助，让我可以做出这个网站。<br />
								网站初期还有很多的问题和瑕疵，还在逐渐完善中，如遇到什么问题或者有好的建议也可以随时联系我。
							</p>
							<p>
								@Author:李中光<br /> 网站更新时间：2017/12/27
							</p>

						</div>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</div>
	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />