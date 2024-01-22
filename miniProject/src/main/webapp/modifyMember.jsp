<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${memberDAO.update(dto) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/"/>
</c:if>

<%@ include file="footer.jsp" %>