<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="网站管理-C616" name="title" />
</jsp:include>

</head>
<body background="images/bggg.gif">
	<!-- 导入标题栏-->
	<div style="width: 100%; height: 120px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div
					style="width: 100%; height: 0 auto; background: rgba(255, 255, 255, .0);">
					<div
						style="width: 100%; height: 40px; background: #d9534f; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 15px; text-align: center;">网站管理</a>
					</div>
					<div style="width: 100%">
						<table class="table table-bordered table-condensed table-hover">
							<thead>
								<tr style="background: #ff6a6a;">
									<th>#流水号</th>
									<th>编号</th>
									<th>网站名</th>
									<th>网站作者</th>
									<th>网站简介</th>
									<th>网站网址</th>
									<th>网站图标</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr class="success">
									<form role="form" action="add_web.xu" class="form-inline">
										<td>new</td>
										<td>new</td>
										<td><input type="text" size="2" name="wName"></td>
										<td><input type="text" size="2" name="wAuthor"></td>
										<td><input type="text" size="3" name="wPs"></td>
										<td><input type="text" size="10" name="wUrl"></td>
										<td><input type="text" size="3" name="wIcon"></td>
										<td><button style="border-radius: 10px;" class="submit btn-success">+</button></td>
									</form>
								</tr>

								<c:forEach items="${webData}" var="w" varStatus="status">

									<tr class="danger">
										<td>${status.index+1}</td>
										<td>${w.id}</td>
										<td>${w.webName}</td>
										<td>${w.webAuthor}</td>
										<td>${w.webPs}</td>
										<td>${w.webUrl}</td>
										<td>${w.webIcon}</td>
										<td>
										<a class="btn btn-xs btn-warning" role="button" 
									href="web_edit.xu?id=${w.id }"><span
											class="glyphicon glyphicon-edit" aria-hidden="true"></span>
										</a>
										<a class="btn btn-xs btn-danger" role="button"
											href="web_del.xu?id=${w.id}"
											onclick="return confirm('确认删除这个网站吗？')"><span
												class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-1">
				<jsp:include page="/Includes/kzt.jsp" />
			</div>
		</div>
	</div>


	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />