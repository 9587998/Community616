<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="个人信息-Community616" name="title" />
</jsp:include>
<script type="text/javascript">
	
</script>

</head>
<body background="images/BG/bg_Login.jpg" style="height: 100%">
	<!-- 导入标题栏-->
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

			<div class="col-md-3">
			</div>

			<div class="col-md-4">
				<div style="width: 100%; height: 120px;"></div>
				<div
					style="background: #e0ffff; border-radius: 5px; height: 0 auto;">
					<div
						style="width: 100%; height: 40px; background: rgba(130, 139, 61, .8); border-radius: 5px">
						<a href="bbs.xu" class="navbar-brand"
							style="font-size: 18px; text-align: center;">个人信息</a>
					</div>
					<form action="upUser.xu" method="post">
						&nbsp;
							<c:forEach items="${Users}" var="u"> 
								</c:forEach>
						<div class="rowElem" >
							<label>用户名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
								<input name="un"
									value="${Users.userName}" readonly type="text"><label style="font-size: 10px;color: #ff0000;">*不能更改</label>
						</div>
						<div class="rowElem">
							<label>昵&nbsp;&nbsp;&nbsp;称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input
									value="${Users.ninkname}" readonly type="text"><label style="font-size: 10px;color: #ff0000;">*不能更改</label>
						</div>
						<div class="rowElem">
							<label>旧密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="text"readonly  name="ps" Value="${Users.passWord }" /><label style="font-size: 10px;color: #ff0000;">*不能更改</label>
						</div>
						<div class="rowElem">
							<label>新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="text" name="npw" placeholder="6-24字符" />
						</div>
						<div class="rowElem">
							<label>确认新密码:&nbsp;&nbsp;&nbsp;</label>
							<input type="text" name="npw2" placeholder="与新密码保持一致" />
						</div>
						<div class="rowElem">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="submit" value="提交" /> <input type="reset" value="重置" />
						</div>
					</form>

				</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div style="width: 100%; height: 80px;"></div>
	<div class="list-group"
		style="background: rgba(255, 255, 255, .5); border-radius: 10px;">

	</div>




	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />