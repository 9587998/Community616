<%@ page pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp">
	<jsp:param value="${requestScope.title}" name="title" />
</jsp:include>
<script>
		$(function(){
			BootstrapDialog.show({
	            title: '提示信息',
	            message: '${requestScope.msg}',
	            buttons: [{
	                label: '确定',
	                action: function(dialog) {
	                	location.replace('${requestScope.href}');
				}
			} ]
		});
	});
</script>
</head>
<body background="images/BG/bg_Login.jpg">
</body>
</html>