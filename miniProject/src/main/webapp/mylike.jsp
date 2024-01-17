<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
   <table id="myLikeList">
      <div><h2>📌 ${login.userid }님이 좋아요한 영화</h2></div>
      <c:set var="list" value="${movieDAO.selectListLikeMovie(login.userid) }"/>
      <c:forEach var="dto" items="${list }">
      <thead>
         <tr>
            <th>번호</th>
            <th>영화</th>
            <th>장르</th>
            <th>출연진</th>
            <th>개봉일</th>
            <th>평점</th>
         </tr>
      </thead>
         <tr>
            <td>${dto.idx }</td>
            <td>
               <div style="display: flex; justify-content: center; align-items: center;">
                  <img src="image/${dto.poster }" width="100px;">
                  <a href="${cpath}/view.jsp?idx=${dto.idx}">
                  ${dto.title }</a>
               </div>
            </td>
            <td>${dto.genre }</td>
            <td>${dto.actor }</td>
            <td>${dto.releaseDate }</td>
            <td>${dto.score}</td>
         </tr>
      </c:forEach>
   </table>
</section>

<%@ include file="footer.jsp" %>