
<%@ page pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class='card-holder'>

	<div class='card-wrapper'>
	<c:choose>
							<c:when test="${sessionScope.qdl==1}">
			<a href='my.xu'>

				<div class='card bg-01'>
					<span class='card-content'>我的</span>
				</div>
			</a>
		</c:when>
		<c:otherwise >
			<a href='index.xu'>

				<div class='card bg-01'>
					<span class='card-content'>登陆</span>
				</div>
			</a>
		</c:otherwise>
		</c:choose>
	</div>
	<div class='card-wrapper'>
		<a href='ttlhb.jsp'>
			<div class='card bg-03'>
				<span class='card-content'>红包</span>
			</div>
		</a>
	</div>
	<div class='card-wrapper'>
		<a target="_blank"
			href="tencent://message/?Menu=yes&uin=996112112& Service=300&sigT=45a1e5847943b64c6ff3990f8a9e644d2b31356cb0b4ac6b24663a3c8dd0f8aa12a595b1714f9d45">
			<div class='card bg-04'>
				<span class='card-content'>作者</span>
			</div>
		</a>
	</div>
	<div class='card-wrapper'>
		<a href='#'>
			<div class='card bg-05'>
				<span class='card-content'>顶部</span>
			</div>
		</a>
	</div>
</div>