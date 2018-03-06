<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="�������-C616" name="title" />
</jsp:include>

</head>
<body background="images/bggg.gif">
	<!-- ���������-->
	<div style="width: 100%; height: 120px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div style="width: 100%; height: 0 auto; backgroun: #000;">
					<div
						style="width: 100%; height: 40px; background: #ec971f; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 15px; text-align: center;">�������</a>
					</div>
					<div style="width: 100%">
						<table class="table table-bordered table-condensed  table-hover"
							style="table-layout: fixed">
							<thead>
								<tr style="background: #FFDEAD">
									<th>#��ˮ��</th>
									<th>������</th>
									<th>��վ��</th>
									<th>������</th>
									<th>���</th>
									<th>��ע</th>
									<th>����ʱ��</th>
									<th>״̬</th>
									<th>����</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${wwRecord}" var="w" varStatus="status">
									<tr class="${w.wwColor}">
										<td>${status.index+1}</td>
										<td>${w.id}</td>
										<td>${w.wwName}</td>
										<td>${w.wwNN}</td>
										<td style="word-wrap: break-word">${w.wwPs}</td>
										<td style="word-wrap: break-word">${w.wwBz}</td>
										<td>${w.wwTime}</td>
										<td>${w.wwState}</td>
										<td><a class="btn btn-xs btn-success" role="button"
											href="guang_webdata_yes.xu?id=${w.id}"><span
												class="glyphicon glyphicon-ok " aria-hidden="true"></span> </a>
											<a class="btn btn-xs btn-warning" role="button"
											href="guang_webdata_no.xu?id=${w.id}"><span
												class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</a> <a class="btn btn-xs btn-danger" role="button"
											href="guang_webdata_del.xu?id=${w.id}"
											onclick="return confirm('ȷ��ɾ������������')"><span
												class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
			</div>
			<div class="col-md-1">
				<jsp:include page="/Includes/kzt.jsp" />
			</div>
		</div>
	</div>


	<!--     ������ -->
	<jsp:include page="/Includes/Bottom.jsp" />