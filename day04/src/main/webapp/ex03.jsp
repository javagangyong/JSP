<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
<style>
	#root {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		
		background-color: #f5f6f7;
	}
</style>
</head>
<body>

<div id="root">
	<h1>Page Not Found</h1>
	<img src="image/noyunseo.jpg">
	<h3>잘못된 주소입니다</h3>
</div>
<!-- 특정 요청에 대해서만 이 페이지를 올리는게 아니라 day04전체에서 잘못된 주소를 입력했을때 이 페이지를 올리고 싶을때 -->
<!-- 프로젝트 우클릭 > java EE Tools > generate 로 WEB-INF에 web.xml을 만들고 web.xml에 에러페이지를 만든다 -->

1) error-page (directive) 현재페이지의 에러 설정
2) response status code (web.xml) 전역설정
3) exception-type (web.xml)

</body>
</html>