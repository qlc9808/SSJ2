<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header4.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#comList{
		position: relative;
		align-self: center;
		left: 40%;
		right: 40%;
	}
</style>
</head>
<body>
<section class="py-11">
      <div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h4>관리자 메인페이지를 만들어도되고 안만들고 바로 회원관리로 이동 해도됨(태현)</h4>
				</div>
			</div>
	        <div class="row">
	        	<div class="col-3">
				<%@ include file="../jh/adminSidebar.jsp" %></div>
				<div class="col-9" style="width: 400px;">
					<div class="card card-xl" id="comList">
						<div class="card-body" style="width: 400px;">
							<form action="deleteChgComm" method="post">
								<ul style="list-style: none;">
								<c:forEach items="${chgCommList }" var="chgCommList">
									<li>
										<input type="checkbox" name="ctn" value="${chgCommList.ctn }">${chgCommList.ctn }
									</li>	
								</c:forEach>
									<li><input type="submit" value="선택항목 삭제"></li>
								</ul>
							</form>
							<form action="insertChgComm" method="post">
								챌린지 카테고 입력: <input type="text" name="ctn"> <input type="submit" value="확인">
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
	  </div>
</section>
	
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>