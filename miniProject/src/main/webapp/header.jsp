<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.*, board.*, movie.*, reply.*, like.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="movieDAO" value="${MovieDAO.getInstance()}" />
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }" />
<c:set var="likeDAO" value="${LikeDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>miniProject</title>
<link rel="stylesheet" type="text/css"
	href="${cpath }/resources/css/style.css">
<style>
</style>
</head>
<body>
	<div id="head">
		<img
			src="https://adimg.cgv.co.kr/images/202312/Alienoid/0109_980x80.jpg">
	</div>
	<header>
		<div class="sb">
			<div id="logo">
				<a href="${cpath }"><img
					src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"></a>
				<span>C U L T U R E P L E X</span>
			</div>
			<div id="logocontent">
				<nav>
					<ul>
						<li><img
							src="https://img.cgv.co.kr/WingBanner/2023/0208/16758461047540.png"></li>
						<c:if test="${empty login }">
							<li><a href="${cpath }/login.jsp"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그인" style="width: 36px;"></a> <br> <span>로그인</span>
							</li>
							<li><a href="${cpath }/join.jsp"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
									alt="회원가입" style="width: 36px;"></a> <br> <span>회원가입</span>
							</li>
						</c:if>
						<c:if test="${not empty login }">
							<li><a href="${cpath }/logout.jsp"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그아웃" style="width: 36px;"></a> <br> <span>로그아웃</span>
							</li>
						</c:if>
						<li><a href="${cpath }/mypage.jsp"><img
								src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png"
								alt="내정보" style="width: 36px;"></a> <br> <span>MY
								CGV</span></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<div class="menu">
		<ul id="menubar">
			<li><a href="${cpath }">홈</a></li>
			<li><a href="${cpath }/movieList.jsp">무비차트</a></li>
			<li><a href="${cpath }/boardList.jsp">무비리뷰</a></li>
			<li><a href="https://www.instagram.com/cgv_korea/?hl=ko"> <img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAKS0lEQVR4AZ2UA5RkS7ZA94mIq8ys6mrb7v7PGNu2bdu2bdvssZ9trme03V1VWZWZFxFxfv5a41n6s8/al2EJ/Ccve8P566a78YSF6+Ys745PLW2bbA42LSQQbFQVNWJjUKIniRZRkOiNiSImqiRirdZ+YLNkl4HbxvdOTnSS7CbgGv4N+ehTLuFvjK+IW6/faT/nPfeAlEG3ouUcje9jYsAhmCgkUTExIgquAadgQ8QEcDFim4ioINFgsbRahlgGMPGizfdY9Lx/boh892XXAXCl7HzktVeNbUvzhCJTUtNgQwQFh5JKQNQgPpLEgFOQCDYG0iCYAAaP/duIeMBHiIpEwUQIA5jqKusfMu/RwDYA5yf7zH90cuyN781/PtI2jJg+Ogg4DSQGRJXqkKc3WSJ1iYlg1cw0wkbFhIBvFIvBxohDEAxZO6G9IEfEEGsQY7GFkAw8+3974OcP/uwxJwOXyWl/uCn/9Zf3f/32K6onLVlt0SZgRUmc4eitk8TxktX/M8qCFW06bcElCUbMTMUOj0TFqMEOVQ/BN9TdQG97j0PXjlNkKWOrRmh8RFWwScLE7QNGThz95aanLHqm23fN3gf0dvQetXA0IeuVGCAxhv0X72PtsW0e99W7svm+K/hvuO203Zz72gvoXrmPuWvm4xUolblzDH7X4CGDm/v3czecOXVHM9C8VUSSKpJnjn0X7+Buj1rGc37yYAAgcPC6w/T2l2it4BUNEdUIgBGLNYKkik0c2dI28zbOZc19lrHmisfxu8f9il0/3c2c1YsI2oATTO2d3xmOcWHCLO/EmrSJpAambhxn6yljw8ofBMBl37mCC999KdWeAdIEbIyYqFgEiFgiZiaY0TrLtJ+goMOdv/FQNjxzCw/6yUP55ak/oHfJEVorRolRQRWO9DuOXjdr2QTnA84Gku44937ZKYBw3U+v4cdP/wlLs7nMX9TG/q1Ca3ABpO8BJckcKgbjoTrSZ+2jTqTf7/OHZ30Vlz+fNU/cxJZXHsuFT/kTrilQI2hUqJrcdZw2sazIBOrD0yxb3+aYJ20C4OJPnMuqZJQFK1uEqiRxFlMr5a79VLEkT9uICr2mpDAZTTQseuQW7vTzRwIgD6y47IU/Hzbgzax98mZufsNF6KEedl5OJGLKsnCZjbVvarJUaCammbd+HohhfPshwnVHmTs/w1Q9cmvx3S6DQ/tYfq8trHzBnRk5dhFGDUev2c/Or1zIntPOJx5dxN9ouZSJyUl6uyZoLx+jWJHT232IRHMQkEHpXBJrmTlMiORNn86oAFDvmyQru2QjYzgnMDVNPHSAO33pCax8/j35Z0a2LGDlE47llq8ew1XP+wbnn/ppGG3TO2M3Hdei2tWdaUA6x9GnxEpFULBk0RUmaDQlmUSiluS5AEAIZFRktsGqoXdwByd+7okzlQcN3Pbh3zLx6+sRNcx+2DGsfsP9WffcO2Gk4prnfolRVtGZPUZvfAppIgBpKlgaTPQYFYxRnKNBhuYEIn0y6wGQGEkZvict/I7DrHjAZla++AEAXPGgD3DkjxdTsAgQDp5/PhNnXMdJf3w1a55zTw7/+EqqP+1EbENCjcQAgBWPxWOQmXuiDSbVmlRKclvTTnokpgRAYiA3FWk6IKkPsfRxJwBw2yd/SvePp7FwzQY6a0fprB5l6bL1HP3TWWz/2O8BWPKYU/B0MRpQPBoDAKIRS42RCoOCCqZIBhRuQD40G5raGgBBaaU9cp2imG/pnLwGgMGZFzO7NYrJexgzjWOAcQ2jtOmddiUA7TsuJ0lybF1hqCAoAFbAILgQMTSoqXFJUmKykiz12KJPkg0AcK4mb0+RFQWmPQAbAXC2gqzEpCUIIA3ESGoHWAYAiAacGb7TwhEQUQCiRoSAAVwMmOjFZEmlrbSkyIe2+qRZBYDYSNoevo9WuGYf1XXXATB6r+PR8ZvJWgFXeGyrweUVMewY/tsKQP+i25CqiysEQwPmbyPQYKhBAkbBKZhWVtFKB2T50GKKNK0BkBTSTp+kKMnnw9QffwnAwpc+i/aT701z8R/h4PVDb6Z/7WmM3e8uLHndEwA4+tMzyQC1FZaAEQHAEf/6HlCJKKjLskpdMY0rFNupsGkJgE2EZNSTtAZkmxZRXX4a4z/6NrOf8HRWfPuLTNzlJMozLiB6YezOz2H+K54NwK7PbyP8+RyKNZvwZYUxATEAEBUEjxARiagEXDLTgAFpITDaYG2Xv41AMlLjWh4c5BsWM/WZN2ELx+jDn8zcF78Ihv4zB765jalXfIjOyqWEVDF1RG2DJgaAWFUIAVGPiGBiFDcccrGFx+UR02mwOgmAzJ6NG1Nc0UddgnRaJK0l9D/xcspzfkv7QU8lXb0OwVLefBPj3/0p1a/OZmTLWnxeoN0S1JAUgls0C4A4MY3BAQGDRQji0lk+Gh1giwQ3p4XWB1AgW7iWZPkCzMHtyLx10NRI0cHO20q98zy6H/oLks9Fa0PYNwlmhNadNxBLh+kNkJEO5d49ZGtX0Fq7kAaIu46QpCmqEQmKyRNvJPdl0VayvCFZ1Eamb2Fw2S8xQPG41+D9Lky5AzOimKLBtAPpptWkJ2wkWTmbdPkYxYnrybYsQ/IKSRvIa8LeG6m6tzL/DU8BGJ6OZw0bvp1kLEeiMhNOS2dmtyuJ+3GZhdyQaoG/4MvoSY9g5PhHYF7xU8JZn0F7ByAGCAGpA6YUtInERpCBQB/ilCP2UqgK7JIlLHv/25j7hHvRAAc+8UtyCsSB8QExlqTtKhfNYMJkBjsimBTMnA1w8Bp6215K61GfpX38Y4j/5+GboXeI2FSY4JGgRB/RoBANUQVCgpJgZi8gXb8BEYjAbY9/J3rh1aRrjiNUHoxDiUQ1U7L3L194ZHbVth+mWmbMakPqsNYQjt4AS48hvdNrSRbfAeH/hwLTZ1/A/jd/gfqC20g3HUPVd0Sf4AcJTXRh7DEnPEV2XXNOkl79na+OHLny6TpvBSYJqLOYNIPpXcRQI3M3Q3sRalsIDhOE6APa+KEKZYAKfKnEbo0emqJ/2z4GF92OjbOIi9fgJxJ8PwEpmN4xgTlu/e9XvOCBz5D9X7ySsOHCjbMObLsycXmunTHUKeIcuASLEMtx1E+hIYKfkVh7pFRi3xMHDaHXQFfxk4HQBa1nEdwCwnRCM2Hw/QzftAlHIoPJmlXvecEdgYscwxd7yYk3Du42/Zjk6AW/NXlAkwKxBdFCNALFUmQmgBARHyB4qCK2CpiywfRqdNpjpiN+WglHFR0XmiqimUOqiJ0c0J/wdJ5x78cfvvm6iwDsM1fdhf7RQ/SuaN3cvv/yHzrbbCLL1pgsw1mBNAFrcFYxBowoGMVqRPCICUio/2oDTY0MamK/JDQRug1EhzYpfZ9dyF23PNT3B6cPZShy6SM/xr+z9eNz15h49BjaYwu08R2QZUI6V4lNDF5M8GgIaipvY+2T0NRo6SX2gml6lQ3TTWbLfNztnTw0befvqa+fODDIxq4Cruff+F/YMSYOvVvlzAAAAABJRU5ErkJggg=="
					style="width: 24px; height: 24px;"> 인스타그램
			</a></li>
			<li><a href="https://www.facebook.com/CJCGV/"> <img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAA1UlEQVR4AWOwDp9LUzTELRi1wDdtaf+8w9sPXDtx7h4Q7Tt2c92OS9SxwCZibtesg0+fv3756i0aoo4FkxcdgxhHEwtiite8ePmGhhas3HIB2cRL1x5t3HV5xebzEEQFC67efAI3/cDxW7aR86icip6/QIRP9+xD1E+myOHTPv3AqAVA1DJ1/76jN+EI2YKLVx8hS+0+cgMY5yRbMHfVKbBxhNGFqw+B6mloweY9V2hrAbAIIceCugl7gE6DI2QTT124jyyVXrNxEKaiUQtGLRi1YNQCAMs01I34bbYCAAAAAElFTkSuQmCC"
					style="border-radius: 5px; width: 22px; height: 22px;"> 페이스북
			</a></li>
			<li><a href="https://www.youtube.com/@CGVKOREA"> <img
					src="image/유투브로고.png" style="width: 25px;"> 유튜브
			</a></li>
		</ul>
	</div>
	<div id="btn_gotoTop" class="hidden">
		<img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png">
	</div>
	<div id="btn_mypage" class="hidden">
		<a href="${cpath }/mypage.jsp">MY CGV</a>
	</div>

<script>
      const btn_gotoTop = document.getElementById('btn_gotoTop')
      const btn_mypage = document.getElementById('btn_mypage')
      
      document.body.onscroll = function(event) {
         const flag = window.scrollY > 213
         console.log(window.scrollY)
         if (flag) {
            document.querySelector('.menu').style.backgroundImage = 'linear-gradient(to right, rgb(215, 67, 87), rgb(241,79,58) 59%, rgb(239, 100, 47))'
            document.querySelector('.menu').style.color = 'white'
            btn_gotoTop.classList.remove('hidden')
            btn_gotoTop.style.zIndex = '5'
            btn_mypage.classList.remove('hidden')
            btn_mypage.style.zIndex = '5'
            btn_mypage.style.right = '465px'
         } else {
            document.querySelector('.menu').style.background = 'inherit'
            document.querySelector('.menu').style.color = 'inherit'
            btn_gotoTop.classList.add('hidden')
            btn_gotoTop.style.zIndex = '-5'
            btn_mypage.classList.add('hidden')
            btn_mypage.style.zIndex = '-5'
            btn_mypage.style.right = '409px'
         }
      }
      
      btn_gotoTop.onclick = function() {
         window.scrollTo(0, 0)
      }

   </script>