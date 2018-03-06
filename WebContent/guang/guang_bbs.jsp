<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="留言管理-C616" name="title" />
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
						style="width: 100%; height: 40px; background: #449d44; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 15px; text-align: center;">留言管理</a>
					</div>
					<div style="width: 100%">
						<table class="table table-bordered table-condensed table-hover"
							style="table-layout: fixed">
							<thead>
								<tr style="background: #90ee90">
									<th>#流水号</th>
									<th>留言id</th>
									<th>留言者</th>
									<th>留言内容</th>
									<th>留言时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bbsData}" var="b" varStatus="status">
									<tr class="success">
										<td>${status.index+1}</td>
										<td>${b.id}</td>
										<td>${b.author}</td>
										<td style="word-wrap: break-word">${b.bbss}</td>

										<td>${b.putTime}</td>

										<td><a class="btn btn-xs btn-danger" role="button"
											href="guang_bbs_del.xu?id=${b.id}"
											onclick="return confirm('确认要删除该条留言么？')"><span
												class="glyphicon glyphicon-remove" aria-hidden="true"></span>
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