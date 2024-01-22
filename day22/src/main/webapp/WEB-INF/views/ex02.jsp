<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- WEB-INF는 설정폴더라서 출력불가능 -->
<!-- 그냥 ex02.jsp를 실행하면 접근불가하다 -->
<!-- 하지만 servlet에서 실행하는건 실행가능하다 -->
<!-- 사용자가 주소로 jsp파일접근을 할때 막기위함. 반드시 servlet으로만 접근할 수 있게 -->
<h1>서블릿에서 넘겨준 데이터 화면에 출력하기</h1>
<hr>

<h3>${data }</h3>

</body>
</html>