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
	            title: '��ʾ��Ϣ',
	            message: '${requestScope.msg}',
	            buttons: [{
	                label: 'ȷ��',
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