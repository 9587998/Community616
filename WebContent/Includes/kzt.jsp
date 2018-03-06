<%@ page pageEncoding="GBK"%>
<div
	style="width: 77px; position: fixed; height: 0 auto; background: rgba(255, 0, 255, .5); border-radius: 10px;">
	<div
		style="width: 100%; height: 40px; background: rgba(148, 0, 211, .8); border-radius: 5px">
		<a href="#" class="navbar-brand" style="font-size: 14px;">控制台</a>
	</div>
	<div style="height: 301px; border-radius: 10px;">
		<div class="btn-group-vertical" style="width: 100%;">
			<button type="button" class="btn btn-primary"
				onclick="javascrtpt:window.location.href='kzt.xu'">用户</button>
			<button type="button" class="btn btn-success"
				onclick="javascrtpt:window.location.href='guang_bbs.xu'">留言</button>
			<button type="button" class="btn btn-warning"
				onclick="javascrtpt:window.location.href='guang_webdata.xu'">申请</button>
			<button type="button" class="btn btn-danger"
				onclick="javascrtpt:window.location.href='guang_web.xu'">网站</button>
			<div style="height: 10px;"></div>
			<button type="button" class="btn btn-info"
				onclick="window.open('home.xu')&${sessionScope.qdl==2}">to:首页</button>
			<a href="byebye.xu" class="ujg"
				onclick="return confirm('退出吗，${sessionScope.nn}？')"><button
					type="button" class="btn btn-default" style="width: 100%">out:${sessionScope.nn}</button></a>
			<div style="height: 20px;"></div>
			<button type="button" class="btn btn-info"
				style="background: #000000"
				onclick="window.open('https://ecs.console.aliyun.com/vnc/index.htm?spm=5176.2020520101.107.d515.66d2c282m7Balo&instanceId=i-2ze60594b90k9mwf3s6f&regionId=cn-beijing&accounttraceid=6bc90aeb-798a-469b-89e9-5480118fbb9d')">go:服务器</button>
			<button type="button" style="background: #000000; font-size: 12px;"
				class="btn btn-danger"
				onclick="javascrtpt:window.location.href='up616.xu'">do:更新616</button>
		</div>
	</div>


</div>
