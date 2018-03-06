<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="��ҳ-Community616" name="title" />
</jsp:include>
<script type="text/javascript"> 
</script>

</head>
<body background="images/BG/bg_Login.jpg" style="height: 100%">
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

			<div class="col-md-8">

				<!-- 	��������ģ�� -->
				<div style="width: 100%; height: 100px"></div>
				<!--����&���� -->
				<div
					style="background: rgba(255, 255, 255, .5); height: 200px; border-radius: 10px;">
					<h4 class="list-group-item active"
						style="text-align: center; background: rgba(178, 34, 34, .8);">������</h4>
					<div style="width: 49%; float: left;">
						<ul class="list-group" style="margin-left: 13px;">
							<li class="list-group-item"><p
									style="font-size: 20px; color: #ff3030; float: none;">
									�����������������ļ�ֵ��<img alt="" src="images/xdd.png" width="250px"
										height="100px">
								</p></li>

						</ul>
					</div>

					<div style="width: 49%; float: left;">
						<ul class="list-group" style="margin-left: 13px;">
							<li class="list-group-item">
							<c:choose>
							<c:when test="${sessionScope.qdl==1||sessionScope.qdl==2}">
							<a href="wantPutWeb.xu"
								style="font-size: 22px; color: #0000ff"> ��վ��������ͨ���ѿ������������<br>
								<img alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"></a>
								</c:when>			
								<c:otherwise>
			                       <a href="index.xu"
								style="font-size: 20px; color: #0000ff"> ��վ��������ͨ���ѿ�������½������<br>
								<img alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"></a>
								             </c:otherwise>	
								</c:choose>	
									</li>

						</ul>

					</div>



				</div>
				<!-- ��վ�Ƽ� -->
				<div class="list-group"
					style="background: rgba(255, 255, 255, .5); border-radius: 10px;">
					<h4 class="list-group-item active">��վ�б�</h4>


					<ul id="container" class="clearfix">
						<c:forEach items="${webData}" var="w">
							<li><img class="img" src="images/webIcon/${w.webIcon}">
								<p>
									<span>��վ����${w.webName}<br>@author:${w.webAuthor}<br>��վ��飺${w.webPs}
									</span> <a target="_blank" href="http://www.community616.top/${w.webUrl}" title="${w.webAuthor}"></a>
									<i></i>
								</p></li>
						</c:forEach>
						<c:choose>
						<c:when test="${sessionScope.qdl==1||sessionScope.qdl==2}">
								<li><a href="wantPutWeb.xu"><img class="img"
										src="images/webIcon/joinWeb.png"></a></li>

							</c:when>
							<c:otherwise>
								<li><a href="index.xu"><img class="img"
										src="images/webIcon/joinWeb.png"></a></li>
							</c:otherwise>
						</c:choose>
					</ul>



				</div>


			</div>
			<div class="col-md-3 ">
				<div style="width: 100%; height: 110px;"></div>
				<div
					style="background: #e0ffff; border-radius: 5px; height: 0 auto;">
					<div
						style="width: 100%; height: 40px; background: rgba(130, 139, 61, .8); border-radius: 5px">
						<a href="bbs.xu" class="navbar-brand"
							style="font-size: 18px; text-align: center;">��������</a>
					</div>
					<c:forEach items="${bbsData2}" var="b">


						<div class="media">
							<div class="media-body">
								<h4 class="media-heading" style="color: #191970">�ǳƣ�${b.author}</h4>
								<p style="">&nbsp;&nbsp;&nbsp;&nbsp;${b.bbss}</p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bbs.xu"
									style="color: #0000ff">...�鿴</a>
								<p style="color: #8b4513">${b.id}¥&nbsp;&nbsp;${b.putTime}����</p>
								<div style="width: 100%; height: 2px; background: #555555"></div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div style="width: 100%; height: 30px;"></div>

				<div
					style="background: rgba(255, 255, 255, .5); border-radius: 5px; height: 330px">
					<div
						style="width: 100%; height: 40px; background: rgba(148, 0, 211, .8); border-radius: 5px">
						<a href="#" class="navbar-brand"
							style="font-size: 18px; text-align: center;">�����</a>
					</div>
					<div style="width: 100%; hight: 100%; margin: 10px">
						<img alt="" src="images/ggggwl.png" width="120px" height="120px"
							style="margin: 5px"> <img alt="" src="images/ggggwl.png"
							width="120px" height="120px" style="margin: 5px"> <img
							alt="" src="images/ggggwl.png" width="120px" height="120px"
							style="margin: 5px"> <img alt="" src="images/ggggwl.png"
							width="120px" height="120px" style="margin: 5px">
					</div>


				</div>

			</div>
		</div>



	</div>
	<div style="width: 100%; height: 80px;"></div>
	<div class="list-group"
		style="background: rgba(255, 255, 255, .5); border-radius: 10px;">





	</div>


	<!-- �м�listgroup��Ч -->
	<script>
			$("#container li").each(function() {
				$(this).on('mouseenter', function(e) {
					var e = e || window.event;
					var angle = direct(e, this)
					mouseEvent(angle, this, 'in')
				})
				$(this).on('mouseleave', function(e) {
					var e = e || window.event;
					var angle = direct(e, this)
					mouseEvent(angle, this, 'off')
				})
			})

			function direct(e, o) {
				var w = o.offsetWidth;
				var h = o.offsetHeight;
				var top = o.offsetTop; //���������������Ĳ���
				var left = o.offsetLeft;
				var scrollTOP = document.body.scrollTop || document.documentElement.scrollTop;
				var scrollLeft = document.body.scrollLeft || document.documentElement.scrollLeft;
				var offTop = top - scrollTOP;
				var offLeft = left - scrollLeft;
				//console.log(offTop+";"+offLeft)
				// e.pageX|| e.clientX;
				//pageX �Ǵ�ҳ��0 0 �㿪ʼ  clientX�ǵ�ǰ��������0 0��ʼ  �����й�����ʱclientX  С��  pageX
				//ie678��ʶ��pageX
				//PageY=clientY+scrollTop-clientTop;(ֻ����Y��,X��ͬ��,��ͬ) ҳ���ϵ�λ��=��������λ��+ҳ���������ȥ�߶�-����border�߶�
				var ex = (e.pageX - scrollLeft) || e.clientX;
				var ey = (e.pageY - scrollTOP) || e.clientY;
				var x = (ex - offLeft - w / 2) * (w > h ? (h / w) : 1);
				var y = (ey - offTop - h / 2) * (h > w ? (w / h) : 1);

				var angle = (Math.round((Math.atan2(y, x) * (180 / Math.PI) + 180) / 90) + 3) % 4 //atan2���ص��ǻ��� atan2(y,x)
				var directName = ["��", "��", "��", "��"];
				return directName[angle]; //���ط���  0 1 2 3��Ӧ �� �� �� ��
			}

			function mouseEvent(angle, o, d) { //����  Ԫ��  ������/�뿪
				var w = o.offsetWidth;
				var h = o.offsetHeight;

				if(d == 'in') {
					switch(angle) {
						case '��':
							$(o).find("p").css({
								left: 0,
								top: -h + "px"
							}).stop(true).animate({
								left: 0,
								top: 0
							}, 300)
							setTimeout(function() {
								$(o).find("p a").css({
									left: '50%',
									top: -h + "px"
								}).stop(true).animate({
									left: '50%',
									top: '20px'
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p").css({
								left: w + "px",
								top: 0
							}).stop(true).animate({
								left: 0,
								top: 0
							}, 300)
							setTimeout(function() {
								$(o).find("p a").css({
									left: w + "px",
									top: '20px'
								}).stop(true).animate({
									left: '50%',
									top: '20px'
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p").css({
								left: 0,
								top: h + "px"
							}).stop(true).animate({
								left: 0,
								top: 0
							}, 300)
							setTimeout(function() {
								$(o).find("p a").css({
									left: '50%',
									top: h + "px"
								}).stop(true).animate({
									left: '50%',
									top: '20px'
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p").css({
								left: -w + "px",
								top: 0
							}).stop(true).animate({
								left: 0,
								top: 0
							}, 300)
							setTimeout(function() {
								$(o).find("p a").css({
									left: -w + "px",
									top: '20px'
								}).stop(true).animate({
									left: '50%',
									top: '20px'
								}, 300)
							}, 200)
							break;
					}
				} else if(d == 'off') {
					switch(angle) {
						case '��':
							$(o).find("p a").stop(true).animate({
								left: '50%',
								top: -h + "px"
							}, 300)
							setTimeout(function() {
								$(o).find("p").stop(true).animate({
									left: 0,
									top: -h + "px"
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p a").stop(true).animate({
								left: w + "px",
								top: '20px'
							}, 300)
							setTimeout(function() {
								$(o).find("p").stop(true).animate({
									left: w + "px",
									top: 0
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p a").stop(true).animate({
								left: '50%',
								top: h + "px"
							}, 300)
							setTimeout(function() {
								$(o).find("p").stop(true).animate({
									left: 0,
									top: h + "px"
								}, 300)
							}, 200)
							break;
						case '��':
							$(o).find("p a").stop(true).animate({
								left: -w + "px",
								top: '20px'
							}, 300)
							setTimeout(function() {
								$(o).find("p").stop(true).animate({
									left: -w + "px",
									top: 0
								}, 300)
							}, 200)
							break;
					}
				}
			}
		</script>
	<!--     ������ -->
	<jsp:include page="/Includes/Bottom.jsp" />