<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="更新本站-C616" name="title" />
</jsp:include>

</head>
<body background="images/bggg.gif">
	<!-- 导入标题栏-->
	<div style="width: 100%; height: 120px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div style="width: 100%; height: 0 auto; background: 00bfff;">
					<div
						style="width: 100%; height: 40px; background: #f0ad4e; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 14px; text-align: center;">修改网站</a>
					</div>
					<div class="modal-content"
						style="background: #fffff0; border-radius: 5px">
						<form class="form-horizontal" role="form" action="editWebs.xu"
							method="post" enctype="multipart/form-data">
					<c:forEach items="${webData}" var="ww" begin="0" end="0">
							<div class="modal-body">
								<div class="form-group">
									<label class="col-sm-4 control-label">网站ID:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webId"
											value="${webData.id}" readonly type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">网站名称:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webName" type="text" 
									value="${webData.webName}"	required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">网站作者:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webAuthor" type="text"
										value="${webData.webAuthor}"required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">网站简介:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webPs" type="text" 
										value="${webData.webPs}" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">网站Url:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webUrl" type="text" 
										value="${webData.webUrl}" required>
									</div>
								</div>
									<div class="form-group">
									<label class="col-sm-4 control-label">网站图片:</label>
									<div class="col-sm-6">
										<input class="form-control" name="webIcon" type="text" 
										value="${webData.webIcon}" required>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default" onclick="javascrtpt:window.location.href='guang_web.xu'"
									data-dismiss="modal">返回</button>
							</div>
							</c:forEach>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-1">

				<jsp:include page="/Includes/kzt.jsp" />




			</div>
		</div>
	</div>


	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />