<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-view.jsp</title>
</head>
<body>

<h1>게시글 읽기</h1>
<hr>
<%
	int[] arr = { 4, 8, 2, 7, 6 };
	out.print("<p>");
	for(int i = 0; i < arr.length; i++) {
		out.print(arr[i]);
	}
	out.print("</p>");
%>

<pre>
	1979년 10.26 사건으로 유신체제가 사실상 붕괴한 후 5.18 민주화운동이 신군부에 의해 
	무참하게 짓밟힐 때까지 한국에 민주화의 희망이 찾아왔던 기간(1979년 10월 27일 ~ 1980년 5월 17일)을 일컫는 말.
	1968년 체코슬로바키아의 프라하의 봄에 빗댄 것이다. 프라하의 봄처럼 서울의 봄도 7개월을 못 가고 잠깐의 봄으로 끝났다.
	쉽게 말하면 10.26 사건으로 말미암아 박정희가 사망하면서 암흑 천지의 겨울이 가고 
	민주주의라는 봄날의 햇살이 다시 찾아올 것이라는 희망을 고대했지만 찾아온 건 전두환과 신군부였다.
</pre>

<jsp:include page="ex04-list.jsp"/>

</body>
</html>