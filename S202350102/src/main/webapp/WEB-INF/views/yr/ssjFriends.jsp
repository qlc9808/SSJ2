<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">

	<!-- Title -->
	<title>소세지들</title>
</head>
<body>
	<c:import url="/WEB-INF/views/header4.jsp"/>
	
	<div class="review">
		<!-- Body -->
			<c:forEach var="ssj" items="${listSsj}">
				<div class="review-body">
				<div class="row">
					<div class="col-12 col-md-auto">
			
					<!-- Avatar -->
					<!-- profile -->
					<div class="avatar avatar-xxl mb-6 mb-md-0">
						<span class="avatar-title rounded-circle">
							<img src="${ssj.img}" alt="profile" class="avatar-title rounded-circle">
						</span>
					</div>
			
					</div>
					<div class="col-12 col-md">
			
					<!-- Header -->
						<!-- nick -->
						<div class="row mb-6">
							<div class="col-12">
								
								<span>
									${ssj.nick}
								</span>
								
							</div>
						</div>
						
						<!-- Footer -->
						<!-- fork -->
						<div class="row align-items-center">
							
							
							<div class="col-auto">
								
								<!-- Button -->
								<a class="btn btn-xs btn-outline-border" href="#!">
									Comment
								</a>
								
							</div>
						</div>
						
					</div>
				</div>
				</div>
			</c:forEach>
	  
	  </div>
	
	<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>