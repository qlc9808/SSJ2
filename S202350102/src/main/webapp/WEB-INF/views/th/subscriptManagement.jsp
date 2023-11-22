<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독관리</title>
</head>
<body>

	<c:import url="/WEB-INF/views/header4.jsp"/>
	 <div class="container">
         <div class="row profile">
			<!-- 마이페이지 사이드바  -->         
            <div class="col-md-3">
                <%@ include file="../mypageMenu.jsp" %>
            </div>
            
            <!-- 마이페이지 본문 -->
<!--             <div class="row"> -->
             <div class="col-md-9 profile-form">
             	<div class="row">
					<div class="col-md-12 my-3">멤버쉽</div>
					
					<div class="col-md-10">
					<table class="table table-bordered table-sm">
					  <thead>
					    <tr>
					      <th scope="col" colspan="3"></th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
	
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
	
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry</td>
					      <td>the Bird</td>
	
					    </tr>
					  </tbody>
					</table>
					</div>
					
					<div class="col-md-2"></div>
				</div>
			</div>
		
		</div>
	</div>

<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>