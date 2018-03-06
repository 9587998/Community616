<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="/Includes/head.jsp">
	<jsp:param value="首页-Community616" name="title" />
</jsp:include>
<script type="text/javascript"> 
</script>

</head>
<body background="images/BG/bg_Login.jpg" style="height: 100%">
	<!-- 导入标题栏-->
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

				<!-- 	引用天气模块 -->
				<div style="width: 100%; height: 100px"></div>
				<!--新闻&公告 -->
				<div
					style="background: rgba(255, 255, 255, .5); height: 200px; border-radius: 10px;">
					<h4 class="list-group-item active"
						style="text-align: center; background: rgba(178, 34, 34, .8);">公告栏</h4>
					<div style="width: 49%; float: left;">
						<ul class="list-group" style="margin-left: 13px;">
							<li class="list-group-item"><p
									style="font-size: 20px; color: #ff3030; float: none;">
									大力弘扬社会主义核心价值观<img alt="" src="images/xdd.png" width="250px"
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
								style="font-size: 22px; color: #0000ff"> 网站发布申请通道已开启！点击申请<br>
								<img alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"></a>
								</c:when>			
								<c:otherwise>
			                       <a href="index.xu"
								style="font-size: 20px; color: #0000ff"> 网站发布申请通道已开启！登陆后申请<br>
								<img alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"><img
									alt="" src="images/hxx.gif" width="98px" height="108px"></a>
								             </c:otherwise>	
								</c:choose>	
									</li>

						</ul>

					</div>



				</div>
				<!-- 网站推荐 -->
				<div class="list-group"
					style="background: rgba(255, 255, 255, .5); border-radius: 10px;">
					<h4 class="list-group-item active">网站列表</h4>


					<ul id="container" class="clearfix">
						<c:forEach items="${webData}" var="w">
							<li><img class="img" src="images/webIcon/${w.webIcon}">
								<p>
									<span>网站名：${w.webName}<br>@author:${w.webAuthor}<br>网站简介：${w.webPs}
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
							style="font-size: 18px; text-align: center;">最新留言</a>
					</div>
					<c:forEach items="${bbsData2}" var="b">


						<div class="media">
							<div class="media-body">
								<h4 class="media-heading" style="color: #191970">昵称：${b.author}</h4>
								<p style="">&nbsp;&nbsp;&nbsp;&nbsp;${b.bbss}</p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bbs.xu"
									style="color: #0000ff">...查看</a>
								<p style="color: #8b4513">${b.id}楼&nbsp;&nbsp;${b.putTime}发表</p>
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
							style="font-size: 18px; text-align: center;">广告栏</a>
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


	<!-- 中间listgroup特效 -->
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
				var top = o.offsetTop; //包含滚动条滚动的部分
				var left = o.offsetLeft;
				var scrollTOP = document.body.scrollTop || document.documentElement.scrollTop;
				var scrollLeft = document.body.scrollLeft || document.documentElement.scrollLeft;
				var offTop = top - scrollTOP;
				var offLeft = left - scrollLeft;
				//console.log(offTop+";"+offLeft)
				// e.pageX|| e.clientX;
				//pageX 是从页面0 0 点开始  clientX是当前可视区域0 0开始  即当有滚动条时clientX  小于  pageX
				//ie678不识别pageX
				//PageY=clientY+scrollTop-clientTop;(只讨论Y轴,X轴同理,下同) 页面上的位置=可视区域位置+页面滚动条切去高度-自身border高度
				var ex = (e.pageX - scrollLeft) || e.clientX;
				var ey = (e.pageY - scrollTOP) || e.clientY;
				var x = (ex - offLeft - w / 2) * (w > h ? (h / w) : 1);
				var y = (ey - offTop - h / 2) * (h > w ? (w / h) : 1);

				var angle = (Math.round((Math.atan2(y, x) * (180 / Math.PI) + 180) / 90) + 3) % 4 //atan2返回的是弧度 atan2(y,x)
				var directName = ["上", "右", "下", "左"];
				return directName[angle]; //返回方向  0 1 2 3对应 上 右 下 左
			}

			function mouseEvent(angle, o, d) { //方向  元素  鼠标进入/离开
				var w = o.offsetWidth;
				var h = o.offsetHeight;

				if(d == 'in') {
					switch(angle) {
						case '上':
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
						case '右':
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
						case '下':
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
						case '左':
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
						case '上':
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
						case '右':
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
						case '下':
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
						case '左':
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
	<!--     到底啦 -->
	<jsp:include page="/Includes/Bottom.jsp" />