<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="���뷢��-Community616" name="title" />
</jsp:include>
<script type="text/javascript">
	
</script>

</head>
<body background="images/BG/bg_Login.jpg" style="height: 100%;">
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


			<div class="col-md-6">
				<div style="width: 100%; height: 120px;"></div>
				<div
					style="background: #e0ffff; border-radius: 5px; height: 0 auto;">
					<div
						style="width: 100%; height: 40px; background: rgba(130, 139, 61, .8); border-radius: 5px">
						<a href="bbs.xu" class="navbar-brand"
							style="font-size: 18px; text-align: center;">���뵥</a>
					</div>

					<div class="modal-content"
						style="background: rgba(255, 255, 255, .5); border-radius: 5px">
						<form class="form-horizontal" role="form" action="upload.xu"
							method="post" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="pwd">������:</label>
									<div class="col-sm-6">
										<input class="form-control" name="nn"
											value="${Users.ninkname}" readonly type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="pw2">��վ����:</label>
									<div class="col-sm-6">
										<input placeholder="��ʾ�������ظ�����" class="form-control"
											name="wwName" type="text" required>
									</div>
								</div>
									<div class="form-group">
									<label class="col-sm-4 control-label" for="pw2">��վ����:</label>
									<div class="col-sm-6">
										<input placeholder="����ϴ���ȴ��ϴ�����" class="form-control"
											name="wwAuthor" type="text" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="phone">��վ���:</label>
									<div class="col-sm-6">
										<input placeholder="��ʾ���ϴ������������½�" class="form-control" 
										name="wwPs"
											type="text" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="address">��ע:</label>
									<div class="col-sm-6">
										<input placeholder="�ϴ����������ĵȴ�������ˢ��" class="form-control" 
										name="wwBz"
											type="text" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label" for="address">�ϴ�ѹ����:</label>
									<input name="file" id="lefile" type="file"
										style="display: none;">
									<div class="input-append">
										<input placeholder="���ϴ�zip�����ļ�" id="photoCover"
											class="input-large" type="text"
											style="height: 30px; margin-left: 20px;"> <a
											class="btn" style="background-color: #d8dfd8"
											onclick="$('input[id=lefile]').click();">ѡ���ļ�</a>
									</div>

									<script type="text/javascript">
										$('input[id=lefile]').change(
												function() {
													$('#photoCover').val(
															$(this).val());
												});
									</script>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">�ύ</button>
								<button type="reset" class="btn btn-default"
									data-dismiss="modal">����</button>
							</div>
						</form>
					</div>

				</div>
			</div>


			<div class="col-md-5">
				<div style="width: 100%; height: 120px;"></div>

				<div
					style="background: rgba(255, 255, 255, .5); border-radius: 5px; height: 130px">
					<div
						style="width: 100%; height: 40px; background: rgba(178, 34, 34, .8); border-radius: 5px">
						<h4 class="list-group-item active"
							style="text-align: center; background: rgba(178, 34, 34, .8);">����ǰ�ؿ�</h4>
					</div>
					<div style="width: 100%; hight: 2px; margin: 10px"></div>
					<a target="_blank"
						style="margin: 10px; font-size: 30px; color: #b22222;"
						href="readFirst.xu">����ǰ�������ϸ�Ķ�������</a>

				</div>

				<div style="width: 100%; height: 20px;"></div>
				<div
					style="background: rgba(255, 255, 255, .5); border-radius: 5px; height: 330px">
					<div
						style="width: 100%; height: 40px; background: rgba(148, 0, 211, .8); border-radius: 5px">
						<h4 class="list-group-item active" style="text-align: center;">��������¼</h4>
					</div>
					<table class="table table-bordered table-condensed table-hover">
						<thead>
							<tr>
								<th>���</th>
								<th>��վ��</th>
								<th>������</th>
								<th>����ʱ��</th>
								<th>״̬</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${wwRecord}" var="w">
							<tr class="${w.wwColor}">
								<td>${w.id}</td>
								<td>${w.wwName}</td>
								<td>${w.wwNN}</td>
								<td>${w.wwTime}</td>
								<td>${w.wwState}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>


			</div>
		</div>
		<div style="width: 100%; height: 80px;"></div>
		<div class="list-group"
			style="background: rgba(255, 255, 255, .5); border-radius: 10px;">

		</div>
	</div>



	<!--     ������ -->
	<jsp:include page="/Includes/Bottom.jsp" />