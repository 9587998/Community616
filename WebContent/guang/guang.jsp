<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="用户管理-C616" name="title" />
</jsp:include>

</head>
<body background="images/bggg.gif">
<!-- 导入标题栏-->
	<div style="width:100%;height:120px;"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
		<div style="width:100%; height: 0 auto;background:00bfff;"> 
		<div
						style="width: 100%; height: 40px; background:#337AB7; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 14px; text-align: center;">用户管理</a>
					</div>
					<div style="width: 100%">
					<table class="table table-bordered table-condensed table-hover">
						<thead>
							<tr style="background: #00bfff">
								<th>#流水号</th>
								<th>用户id</th>
								<th>用户名</th>
								<th>密码</th>
								<th>昵称</th>
								<th>ident</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${Users}" var="u" varStatus="status">
							<tr class="info" >
								<td>${status.index+1}</td>
								<td>${u.id}</td>
								<td>${u.userName}</td>
								<td>${u.passWord}</td>
								<td>${u.ninkname}</td>
								<td>${u.ident}</td>
								
							<td><c:if test="${u.ident==0}"><a class="btn btn-xs btn-danger" role="button"
									href="guang_user_del.xu?id=${u.id}"
									onclick="return confirm('确认要删除该用户么？')"><span
											class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</a></c:if>
										</td>
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