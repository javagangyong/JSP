<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
div#mainVideobtn:hover{
	cursor:pointer;
}
</style>

<main>
	<div id="movieVideo">
		<div id="mainVideo">
			<div id="gra"></div>
			<video autoplay="" muted="" style="width: 980px; z-index:-5;">
				<source
					src="https://adimg.cgv.co.kr/images/202401/dogman/Dogman_PC_1080x608.mp4"
					type="video/mp4">
			</video>
			<div id="mainVideoTitle">도그맨</div>
			<div id="mainVideoSub">
				불행이 있는 곳 마다 <br>신은 개를 보낸다
			</div>
			<div id="mainVideobtn"><a href="http://www.cgv.co.kr/movies/detail-view/?midx=87932">상세보기 ></a></div>
		</div>
	</div>
	<section>
		<h2>최신영화 TOP5</h2>
		<div id="slider">
			<div class="wrap">
				<c:set var="list" value="${movieDAO.selectListBestMovie() }" />
				<c:forEach var="dto" items="${list }">
					<div class="item">
						<div id="movieImg">
							<a href="${cpath }/view.jsp?idx=${dto.idx}"><img
								src="image/${dto.poster }" width="225px"></a> <em>${dto.idx }</em>
						</div>
						<div id="flexCenter">
							<div id="movieBox">
								<strong class="title">${dto.title }</strong>
								<div>${dto.releaseDate }</div>
								<div>${dto.genre }</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<script>
			const arr = Array.from(document.querySelectorAll('.item'))
			function slider() {

				arr[0].style.left = '-400px'
				arr[0].style.opacity = 0.2
				arr[0].style.scale = '50%'
				arr[0].style.zIndex = -2
				arr[0].style.transform = 'rotateY(60deg)'

				arr[1].style.left = '-200px'
				arr[1].style.opacity = 0.5
				arr[1].style.scale = '70%'
				arr[1].style.zIndex = -1
				arr[1].style.transform = 'rotateY(30deg)'

				arr[2].style.left = '0px'
				arr[2].style.zIndex = 1
				arr[2].style.scale = '100%'

				arr[3].style.left = '200px'
				arr[3].style.opacity = 0.5
				arr[3].style.scale = '70%'
				arr[3].style.zIndex = -1
				arr[3].style.rotateX = '30deg'
				arr[3].style.transform = 'rotateY(30deg)'

				arr[4].style.left = '400px'
				arr[4].style.opacity = 0.2
				arr[4].style.scale = '50%'
				arr[4].style.zIndex = -2
				arr[4].style.transform = 'rotateY(60deg)'

				arr[3].style.opacity = 1
				arr.push(arr.shift())
			}
			for (let i = 0; i < 4; i++) {
				slider()
			}
			setInterval(slider, 2000)
		</script>

		<h2>시사회 / 무대인사</h2>
		<div class="box">
			<img
				src="https://cf.lottecinema.co.kr//Media/Event/71f5e15e0845468aa6d447dae2ce82c8.jpg">
			<img
				src="https://cf.lottecinema.co.kr//Media/Event/c86273c27f4a4d808a97c0fb055fc16e.jpg">
			<img
				src="https://cf.lottecinema.co.kr//Media/Event/d55f2a3e1070478ca779b7c99df8b692.jpg">
		</div>
		<h2>이벤트</h2>
		<div class="box">
			<div class="eventbox">
				<div>
					<img
						src="https://img.cgv.co.kr/WebApp/contents/eventV4/39359/17030554898320.jpg"
						width="310px">
				</div>
				<strong>[위시]이모티콘 이벤트</strong>
				<div>2023.12.21~2024.01.14</div>
			</div>
			<div class="eventbox">
				<div>
					<img
						src="https://img.cgv.co.kr/WebApp/contents/eventV4/39416/17038143213450.jpg"
						width="310px">
				</div>
				<strong>[인투 더 월드]4DX 스페셜 굿즈</strong>
				<div>2023.12.29~2024.01.16</div>
			</div>
			<div class="eventbox">
				<div>
					<img
						src="https://img.cgv.co.kr/WebApp/contents/eventV4/39511/17049489199520.jpg"
						width="310px">
				</div>
				<strong>[MOINTS]CGV 영화 커뮤니티 1-2월</strong>
				<div>2024.01.11~2024.02.29</div>
			</div>
		</div>
		<div id="gongji">
			<div id="gongjibox">
				<div id="gongjiContent">
					<div id="gongjiContent1">
						<strong>공지사항</strong>
						<div>[행사/이벤트][CGV] 무대인사 예매취소 정책 변경</div>
					</div>
					<div id="gongjiContent2">
						<strong>고객센터</strong>
						<div>
							1544-1122 <br>고객센터 운영시간 (평일 09:00~18:00) <br>업무시간 외
							자동응답 안내 가능합니다.
						</div>
					</div>
				</div>
				<div id="QRcode">
					<Strong>앱 다운로드</strong>
					<div style="font-size: 12px;">cgv앱에서 더 편리하게 이용하세요</div>
					<br>
					<div>
						<img
							src="https://img.cgv.co.kr/R2014/images/common/img_qrcode.gif">
					</div>
					<br>
					<div style="font-size: 12px;">
						QR코드를 스캔하고 <br>앱설치 페이지로 바로 이동하세요
					</div>
				</div>
			</div>
			<div id="bugs">
				<img
					src="https://adimg.cgv.co.kr/images/202302/house/CGV_BUGS_226x259.png">
			</div>
		</div>
	</section>
</main>

<br>

<%@ include file="footer.jsp"%>