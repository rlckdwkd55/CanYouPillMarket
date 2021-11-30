<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>ㅎㅎ</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/adminsidestyle.css">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
<style>
   *{
      font-family: 'Nanum Gothic', sans-serif;
   }
</style>
</head>
<body>
	<header>
		<div class="sidebar">
			<header>
				<img id="logo"
					src="${pageContext.request.contextPath }/resources/images/final_logo.png"
					alt="">
			</header>
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/admindashBoard.do"><ion-icon name="grid-outline"></ion-icon></i>대시보드</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminInfo.do"><ion-icon name="people-outline"></ion-icon>사용자관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminSalesManagement.do"><ion-icon name="cash-outline"></ion-icon></ion-icon></i>매출관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminProductList.do"><ion-icon name="bag-outline"></ion-icon>상품관리</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminQNAList.do"><ion-icon name="bag-outline"></ion-icon>문의</a></li>
				<li><a href="${pageContext.request.contextPath}"><ion-icon name="home-outline"></ion-icon>홈</a></li>
			</ul>
		</div>
	</header>
</body>
</html>