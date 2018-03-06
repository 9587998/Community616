<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="���԰�-Community616" name="title" />
</jsp:include>
</head>
<body background="images/BG/bg_Login.jpg" style="height: 100%">
	<!-- ���������-->
	<jsp:include page="/Includes/navbar.jsp" />


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1">
				<c:choose>
					<c:when test="${sessionScope.qdl==2}">
						<div style="height: 120px;"></div>
						<jsp:include page="/Includes/kzt.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include page="/Includes/sidebar.jsp"></jsp:include>
					</c:otherwise>

				</c:choose>
			</div>

			<div class="col-md-8">
				<!-- ��������ģ�� -->
				<jsp:include page="/Includes/wea.jsp"></jsp:include>
				<div
					style="background: rgba(255, 255, 254, .8); border-radius: 10px;">
					<c:forEach items="${bbsCount}" var="b">
						<div
							style="width: 100%; height: 40px; background: rgba(139, 139, 0, .8); border-radius: 5px">
							<a href="#" class="navbar-brand"
								style="font-size: 18px; float: right; text-align: center;">

								���԰�:${b}��</a>
						</div>
					</c:forEach>
					<c:forEach items="${bbsData}" var="b">
						<div class="media">
							<div class="media-left">
								<img class="media-object" src="images/ic_pipi.png" alt="..."
									width="80px" height="80px" style="margin: 10px;">
							</div>
							<div class="media-body" style="width: 400px;">
								<h4 class="media-heading" style="color: #548d54">�ǳƣ�${b.author}</h4>
								<p
									style="word-wrap: break-word; word-break: break-all; overflow: hidden;">
									<br>&nbsp;&nbsp;&nbsp;&nbsp;${b.bbss}
								</p>
								<p style="color: #7b68de">${b.id}¥&nbsp;&nbsp;${b.putTime}����</p>
								<hr>
							</div>
						</div>
					</c:forEach>
					<div class="text-center">
						<a class="navbar-brand" style="float: right;" href="#">���ض���</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div style="width: 100%; height: 100px;"></div>
				<div
					style="background: rgba(255, 255, 254, .8); border-radius: 10px;">
					<div
						style="width: 100%; height: 40px; background: rgba(148, 0, 211, .8); border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 18px; text-align: center;">д����</a>
					</div>
					<c:choose>
						<c:when test="${sessionScope.qdl== 1}">
							<form role="form" action="putbbs.xu" class="form-inline"
								style="margin: 20px">
								<div class="form-group">

									<label for="exampleInputPassword1"> �ǳƣ�<input name="nn"
										value="${sessionScope.nn}" readonly type="text">
									</label><br>
									<!-- 			<input type="text" name="bbss"
					id="username" placeholder="�������û���" />		 -->
									<textarea cols="35" rows="5" name="bbss" placeholder="200������"></textarea>
								</div>
								<br>
								<button type="submit" class="btn btn-default"
									style="background: rgba(238, 130, 133, .8);">����</button>
								<button type="reset" class="btn btn-default"
									style="background: rgba(190, 190, 190, .8);">��д</button>
							</form>
						</c:when>
						<c:when test="${sessionScope.qdl== 2}">
							<form role="form" action="putbbs.xu" class="form-inline"
								style="margin: 20px">
								<div class="form-group">

									<label for="exampleInputPassword1"> �ǳƣ�<input name="nn"
										value="${sessionScope.nn}" readonly type="text">
									</label><br>
									<!-- 			<input type="text" name="bbss"
					id="username" placeholder="�������û���" />		 -->
									<textarea cols="35" rows="5" name="bbss" placeholder="200������"></textarea>
								</div>
								<br>
								<button type="submit" class="btn btn-default"
									style="background: rgba(238, 130, 133, .8);">����</button>
								<button type="reset" class="btn btn-default"
									style="background: rgba(190, 190, 190, .8);">��д</button>
							</form>
						</c:when>
						<c:otherwise>
							<a href="index.xu" class="navbar-brand">ȥ��½&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

























	<!--     ������ -->
	<div style="width: 100%; height: 80px;"></div>
	<jsp:include page="/Includes/Bottom.jsp" />