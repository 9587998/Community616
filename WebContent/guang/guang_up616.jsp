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
	<div style="width:100%;height:120px;"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
		<div style="width:100%; height: 0 auto;background:00bfff;"> 
		<div
						style="width: 100%; height: 40px; background:#2f4f4f; border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 14px; text-align: center;">更新本站</a>
					</div>
					
					<form class="form-horizontal" role="form" action="guang_upWAR.xu"
							method="post" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="form-group"style="background: #555555">
									<input name="file" id="lefile" type="file"
										style="display: none;">
									<div class="input-append">
										<input placeholder="传WAR包通道~" id="photoCover"
											class="input-large" type="text"
											style="height: 30px; margin-left: 20px;"> <a
											class="btn" style="background-color: #d8dfd8"
											onclick="$('input[id=lefile]').click();">选择文件</a>
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default"
									data-dismiss="modal">重置</button>	</div>

									<script type="text/javascript">
										$('input[id=lefile]').change(
												function() {
													$('#photoCover').val(
															$(this).val());
												});
									</script>
								</div>
							</div>
							
								
						
						</form>
						<!-- 上传其他文件 -->
							<form class="form-horizontal" role="form" action="guang_putDongxi.xu"
							method="post" enctype="multipart/form-data">
							<div class="modal-body">
								<div class="form-group"style="background: #555555">
									<input name="file2" id="lefile2" type="file"
										style="display: none;">
									<div class="input-append">
										<input placeholder="传其他文件~" id="photoCover2"
											class="input-large" type="text"
											style="height: 30px; margin-left: 20px;"> <a
											class="btn" style="background-color: #d8dfd8"
											onclick="$('input[id=lefile2]').click();">选择文件</a>
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-default"
									data-dismiss="modal">重置</button>	</div>

									<script type="text/javascript">
										$('input[id=lefile2]').change(
												function() {
													$('#photoCover2').val(
															$(this).val());
												});
									</script>
								</div>
							</div>
							
								
						
						</form>
		</div>
		</div>
		<div class="col-md-2">
		</div>
		<div class="col-md-1">
		
		<jsp:include page="/Includes/kzt.jsp" />
		
					
					
	
		</div>
	</div>
</div>


	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />