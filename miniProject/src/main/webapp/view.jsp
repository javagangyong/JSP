<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<c:set var="dto" value="${movieDAO.selectOneList(param.idx) }"/>
	<c:set var="likeDto" value="${likeDAO.selectLike(login.userid, dto.idx) }"/>
	<div id="viewbox">
		<div style="width: 510px;">
			<div style="font-size: 25px;"><h2> ${dto.title } </h2></div>
			<div>💡 장르 : ${dto.genre }</div>
			<div>💡 개봉일 : ${dto.releaseDate }</div>
			<div>💡 출연 : ${dto.actor }</div>
			<br>
			<div id="mentbox">❛ ${dto.ment } ❜</div>
			<div id="scoreAndPerson">
            <div class="flex">
               <div id="score">
                  <img src="https://cdn-icons-png.flaticon.com/512/13579/13579939.png" width="40px;">
                  <div style="display: flex; align-items: center;">${dto.score }점</div>
               </div>
               <div id="person">
                  <img src="https://cdn-icons-png.flaticon.com/512/878/878719.png" width="40px;">
                  <div style="display: flex; align-items: center;">${dto.person }명</div>
               </div>
            </div>
            
            <div>
               <a href="${cpath }/likeMovie.jsp?idx=${dto.idx }">
                  <img src="${cpath }/image/likey${empty likeDto ? '_not_' : '_' }checked.png" width="50px">
                  +${likeDAO.count(dto.idx) }
               </a>
            </div>
         </div>
		</div>
		<div id="viewPoster"><img src="image/${dto.poster }" width="350px;"></div>
	</div>
	<br>
	<div id="viewContent">${dto.content }</div>
	
	<div id="trailer">
		<div id="trailerTitle"><h3>▶ 트레일러</h3></div>
		<video id="trailervideo" autoplay="" muted="">
	             <source src="${dto.trailer }" type="video/mp4">
	    </video>
	</div>
</section>

<%@ include file="footer.jsp" %>