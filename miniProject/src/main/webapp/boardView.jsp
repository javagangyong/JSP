<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.updateViewCount(param.idx) }"/>

<c:set var="dto" value="${boardDAO.selectOneBoard(param.idx) }"/>

<div id="boarderTop" class="frame">
	<div id="boarderTopIdx">${dto.idx }</div>
	<div id="boarderTopTitle">${dto.title }</div>
	<div class="flexSb">
		<div class="boarderTopWriter">🧑🏻 ${dto.writer } <fmt:formatDate value="${dto.writeDate }" 
					pattern="yyyy.MM.dd.HH:mm" /></div>
		<div class="boarderTopWriter">조회수 ${dto.viewCount }</div>
	</div>
</div>
<div class="frame" id="viewImg"><img src="${cpath }/reviewImage/${dto.img }"></div>
<div class="frame">${dto.content }</div>
			
<div class="sb">
	<div><a href="${cpath }/boardList.jsp"><button>목록</button></a></div>
	
	<c:if test="${dto.writer == login.userid }">
	<div>
		<a href="${cpath }/modifyBoard.jsp?idx=${dto.idx }"><button>수정</button></a>
		<a href="${cpath }/deleteBoard.jsp?idx=${dto.idx }"><button>삭제</button></a>
	</div>
	</c:if>
</div>

<section>
   <div id="reply">
      <div id="replyWrite">
         <form method="POST" id="replyWriteForm">
            <c:if test="${empty login }">
               <c:set var="replyComment">댓글을 작성하려면 로그인 해주세요.</c:set>
            </c:if>
            <c:if test="${not empty login }">
               <c:set var="replyComment">게시글이 더 훈훈해지는 댓글 부탁드립니다.</c:set>
            </c:if>
            <div>🧑🏻 ${login.userid }</div>
            <textarea name="content" rows="5" cols="80" placeholder="${replyComment }"
               ${empty login ? 'disabled' : '' } required></textarea>
            <input type="hidden" name="board_idx" value="${dto.idx}">
            <input type="hidden" name="writer" value="${login.userid }">
            <input type="submit" value="등록"
               ${empty login ? 'disabled' : '' }>
         </form>
         <c:if test="${pageContext.request.method == 'POST' }">
            <c:if test="${empty login }">
               
            </c:if>
            <jsp:useBean id="reply" class="reply.ReplyDTO" />
            <jsp:setProperty property="*" name="reply" />
            <c:set var="row" value="${replyDAO.insertReply(reply) }" />
            <c:redirect url="/boardView.jsp?idx=${dto.idx }"/>
         </c:if>
      </div>
      <div id="replyList">
         <c:forEach var="reply" items="${replyDAO.selectListReply(param.idx) }">
            <div class="replyItem" idx="${reply.idx }" >
               <p>🧑🏻${reply.writer }</p>
               <pre>${reply.content }</pre>
            </div>
         </c:forEach>
      </div>
   </div>
</section>

<%@ include file="footer.jsp" %>
