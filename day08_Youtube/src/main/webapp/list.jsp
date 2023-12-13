<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="list" value="${dao.selectList() }"/>
	
	<div class="box">
		<c:forEach var="dto" items="${list }">
			<div class="item">
				<div class="img">
					<a href="${cpath }/view.jsp?idx=${dto.idx }">
						<img src="${dto.thumbNail }">
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

</body>
</html>