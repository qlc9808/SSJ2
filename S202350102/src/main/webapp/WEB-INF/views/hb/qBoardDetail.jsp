<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문의게시판 디테일</h2>
	<div id="qboard_title">
		<p>${board.title }
			<a href="qBoardUpdateForm?brd_num=${board.brd_num }">수정</a>
			<a href="qBoardDelete?brd_num=${board.brd_num }">삭제</a>
			<a href="qBoardList?board=${board }">목록</a></p>
	</div>
	<hr width="100%">
	<div id="qboard_content">
		<p>${board.conts }</p>
	</div>
	<hr width="100%">
	<div id="qboard_comment">
		
	</div>

	
</body>
</html>