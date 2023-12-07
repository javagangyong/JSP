<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-show.jsp</title>
</head>
<body>

<h1>ex07-action에서 선택한 값 출력</h1>
<hr>

<img src="<%=((MemberDTO)request.getAttribute("dto")).getImgPath() %>">

<img src="${requestScope.dto.imgPath }">
<!-- el태그는 내장객체(Attribute)에서 꺼내서 '출력'하기 위한 태그 -->
expression
<img src="${dto.imgPath }" height="150">

</body>
</html>