<%@ page pageEncoding="GBK"%>
<meta charset="GBK">
<style type="text/css">
#container {
	width: 100%;
	margin: 0 auto;
}

#container li {
	position: relative;
	width: 230px;
	border: 1px solid #ccc;
	height: 150px;
	line-height: 0px;
	text-align: center;
	margin: 10px;
	float: left;
	cursor: pointer;
	overflow: hidden;
}

#container li p {
	height: 150px;
	width: 100%;
	position: absolute;
	left: 0;
	top: -150px;
	color: #ffffff;
	z-index: 2;
}

#container li .img {
	width: 230px;
	height: 150px;
	display: block;
	-moz-transition: .5s ease-in;
	-webkit-transition: .5s ease-in;
	-o-transition: .5s ease-in;
	-ms-transition: .5s ease-in;
	transition: .5s ease-in;
}

#container li:hover .img {
	transform: scale(1.1, 1.1);
	-moz-transform: scale(1.1, 1.1);
	-webkit-transform: scale(1.1, 1.1);
	-o-transform: scale(1.1, 1.1)
}

#container li p i {
	width: 100%;
	height: 100%;
	display: block;
	position: absolute;
	left: 0;
	top: 0;
	z-index: -1;
	background: #000000;
	opacity: 0.7;
	-moz-opacity: 0.7;
	filter: alpha(opacity = 70);
	font-size: 16px;
}

#container li p span {
	display: block;
	width: 94%;
	margin: 0 auto;
	line-height: 24px;
	font-size: 12px;
	padding-top: 60px;
}

#container li p a {
	display: block;
	position: absolute;
	width: 32px;
	height: 32px;
	left: 50%;
	margin-left: -16px;
	top: 20px;
	background: url("images/link.png") no-repeat 0 0;
}

.lg-container {
	width: 320px;
	margin: 50px auto;
	padding: 20px 40px;
	border: 1px solid #f4f4f4;
	background: rgba(255, 255, 255, .5);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	position: fixed;
	top: 51px;
	left: 37%;
	-webkit-box-shadow: 0 0 2px #aaa;
	-moz-box-shadow: 0 0 2px #aaa;
	box-shadow: 0 0 2px #aaa;
}

.lg-container h1 {
	font-size: 40px;
	text-align: center;
	font-family: 'Oleo Script', cursive;
	text-align: center;
}

#lg-form>div {
	margin: 10px 5px;
	padding: 5px 0;
}

#lg-form label {
	display: none;
	font-size: 20px;
	line-height: 25px;
}

#lg-form input[type="text"], #lg-form input[type="password"] {
	border: 1px solid rgba(51, 51, 51, .5);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	padding: 5px;
	font-size: 16px;
	line-height: 20px;
	width: 100%;
	font-family: 'Oleo Script', cursive;
	text-align: center;
}

#lg-form div:nth-child(3) {
	text-align: center;
}

#lg-form button {
	font-family: 'Oleo Script', cursive;
	font-size: 18px;
	border: 1px solid #000;
	padding: 5px 10px;
	border: 1px solid rgba(51, 51, 51, .5);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 2px 1px 1px #aaa;
	-moz-box-shadow: 2px 1px 1px #aaa;
	box-shadow: 2px 1px 1px #aaa;
	cursor: pointer;
}

#lg-form button:active {
	-webkit-box-shadow: 0px 0px 1px #aaa;
	-moz-box-shadow: 0px 0px 1px #aaa;
	box-shadow: 0px 0px 1px #aaa;
}

#lg-form button:hover {
	background: blueviolet;
}

.card-holder {
	position: fixed;
	width: 30px;
	overflow: visible;
}

a:link, a:hover, a:visited, a:active {
	color: #fff;
	text-decoration: none;
}

.card-wrapper {
	display: inline-block;
	float: right;
	clear: both;
}

.card {
	position: relative;
	left: 30px;
	padding: 16px 32px 16px 64px;
	margin: 8px;
	top: 100px;
	x-box-shadow: 0 0 8px 0px rgba(0, 0, 0, 0.5);
	box-shadow: 8px 0 8px -8px rgba(0, 0, 0, 0.5);
	background: #fff;
	transition: all 0.3s ease-in-out 0.1s;
}

.card:hover {
	position: relative;
	left: 100%;
	margin-left: -42px;
	box-shadow: 0 -8px 8px -8px rgba(0, 0, 0, 0.5), 0 8px 8px -8px
		rgba(0, 0, 0, 0.5);
	transition: all 0.3s ease-in-out;
}

.bg-01 {
	background: #539770;
	border-radius: 15px;
}

.bg-03 {
	background: #8DC2BC;
	border-radius: 15px;
}

.bg-04 {
	background: #EDD6B4;
	border-radius: 15px;
}

.bg-05 {
	background: #BE7467;
	border-radius: 15px;
}

.bg-06 {
	background: #E2AE63;
	border-radius: 15px;
}

.bg-07 {
	background: darkmagenta;
	border-radius: 15px;
}

.bottom {
	text-align: center;
	padding: 5px 0;
	line-height: 25px;
	color: #bebebe;
	margin-left: 25%;
	border-top: #ddd 1px solid;
	width: 50%;
}

#message {
	width: 100%;
	text-align: center
}
</style>
<div class="bottom">
	<a href="#" rel="nofollow" style="color: white">精勤博学</a>| <a
		href="https://pan.baidu.com/s/1o7Q7YQY" target="_blank"rel="nofollow" style="color: #8A2BE2">手机APP</a>| <a href="#"
		rel="nofollow" style="color: #C9302C">背景素材</a>| <a href="#"
		rel="nofollow" style="color: #2E6DA4;">来自赵旭</a>| <a href="#"
		rel="nofollow" style="color: pink">老师相册</a>| <a target="_blank" href="./About.jsp"
		rel="nofollow" style="color: yellow">关于本站</a>| <a href="#"
		rel="nofollow" style="color: white">学以致用</a><br /> <a
		href="http://lncainfo.miitbeian.gov.cn" target="_blank" style="color: #a020f0;">@
		1996-2017 辽ICP备17021554号-1 Community616 版权所有 </a>
</div>
</body>
</html>