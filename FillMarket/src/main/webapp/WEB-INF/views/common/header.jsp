<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/final_logo.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
<style>
   *{
      font-family: 'Nanum Gothic', sans-serif;
   }
</style>
<header>
	<div class="container">
        <header class="d-flex flex-wrap justify-content-center py-1 mb-4">
            <a href="${pageContext.request.contextPath}" class="me-md-auto mt-4 ">
                <img src="${pageContext.request.contextPath}/resources/images/final_logo.png" width="340">
            </a>
            
            <ul class="nav">
                <c:if test="${empty member}">
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/qna/qnaList.do" class="nav-link text-dark">SERVICE</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLogin.do" class="nav-link text-dark">LOGIN / JOIN</a></li>
                </c:if>
            </ul>

            <ul class="nav">
                <c:if test="${!empty member}">
                	<c:if test="${member.levelType eq '2'}">
                		<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/admindashBoard.do" class="nav-link text-dark">MANAGER</a></li>
                	</c:if>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/member/myPage.do" class="nav-link text-dark">MY PAGE</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-dark">MY HEART</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/cart/cartList.do" class="nav-link text-dark">SHOPPING BAG</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLogout.do" class="nav-link text-dark">LOGOUT</a></li>
                </c:if>
            </ul>
        </header>
    </div>
</header>