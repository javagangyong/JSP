e<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="frame">
	<c:if test="${empty param.category }">
		<c:set var="list" value="${dao.selectList() }"/>
	</c:if>
	<c:if test="${not empty param.category }">
		<c:set var="list" value="${dao.selectListCategory(param.category) }"/>
	</c:if>
	
	<div>
		<form action="list.jsp"><input type="text" name="search" placeholder="검색"><button>검색</button></form>
		<a href="${cpath }/add_form.jsp"><button>추가</button></a>
	</div>
	
	
	<div class="bbox">
		<c:forEach var="dto" items="${list }">
			<div class="box">
				${dto.name }
				${dto.price }
			</div>
		</c:forEach>
	</div>
	
</section>


</body>
</html>