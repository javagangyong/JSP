<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${memberDAO.update(dto) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/"/>
</c:if>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${memberDAO.update(dto) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/"/>
</c:if>

>>>>>>> refs/remotes/origin/master
<%@ include file="footer.jsp" %>