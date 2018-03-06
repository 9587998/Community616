<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
} /*�ǳ���Ҫ����ʽ�ñ���ͼƬ100%��Ӧ������Ļ*/
.bg {
	display: table;
	width: 100%;
	height: 100%;
	padding: 100px 0;
	text-align: center;
	color: #fff;
	background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat
		bottom center;
	background-color: #000;
	background-size: cover;
}

.my-navbar {
	padding: 20px 0;
	transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;
}

.my-navbar a {
	background: transparent !important;
	color: #fff !important
}

.my-navbar a:hover {
	color: #45bcf9 !important;
	background: transparent;
	outline: 0
}

.my-navbar a {
	transition: color 0.5s ease-in-out;
} /*-webkit-transition ;-moz-transition*/
.top-nav {
	padding: 0;
	background: rgba(0, 206, 209, .8);
}
</style>

<script>
	$(window).scroll(function() {
		if ($(".navbar").offset().top > 50) {
			$(".navbar-fixed-top").addClass("top-nav");
		} else {
			$(".navbar-fixed-top").removeClass("top-nav");
		}
	})
</script>
<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">�л�����</span>
			</button>
			<a class="navbar-brand" href="home.xu"><img alt=""
				src="images/navbar.gif" height="25px"></a> <a class="navbar-brand"
				href="home.xu">��ҳ</a> 
			
				 <c:if test="${sessionScope.qdl==1||sessionScope.qdl==2}">
				<a class="navbar-brand" href="wantPutWeb.xu">���뷢����վ</a>
				</c:if>
				 <a
				class="navbar-brand" href="readFirst.xu">����˵��</a> <a class="navbar-brand"
				href="bbs.xu">���԰�</a>
				<c:if test="${sessionScope.qdl==1||sessionScope.qdl==2}">	
				<a class="navbar-brand"
				href="my.xu">������Ϣ</a></c:if>
				
		</div>

       
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
			<c:choose>
			<c:when test="${sessionScope.qdl==1||sessionScope.qdl==2}">
				<li class="dropdown">
				<a class="dropdown-toggle" href="#"
					data-toggle="dropdown"> 	
					<span class="glyphicon glyphicon-user"
						aria-hidden="true">
			          </span>��ӭ�㣬${sessionScope.nn}<strong
						class="caret"></strong></a>
					<ul class="dropdown-menu"
						style="background: rgba(0, 206, 209, .8);">
						<li><a href="my.xu">�޸�����</a></li>
						<li class="divider"></li>
						<li><a href="byebye.xu">�˳���½</a></li>
					</ul></li>
				</c:when>	

		<c:otherwise>
			<a href="index.xu" class="navbar-brand" >ȥ��½&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</c:otherwise>	
		</c:choose>		
			</ul>
		</div>
	</div>
</nav>