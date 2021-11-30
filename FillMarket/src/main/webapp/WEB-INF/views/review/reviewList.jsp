<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 목록</title>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- css -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- 타이틀 로고 -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">	
	<style>
	.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    justify-content: center;
	}
	.table{
		text-align: center;
		border-bottom : 1px solid rgba(0, 0, 0, 0.35);
	}
	.search{ text-align: center; }
	
	.btn{ background-color : rgb(255, 142, 117); color: white; 
		  height: 30px; font-size: small;
	}
	
	#header{ color : rgba(0, 0, 0, 0.35) ;
			 text-align: center; }
			 
	#review_header {
	text-align: center;
	color: rgb(255, 142, 117);
}	
	</style>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<div id="container">
	  			<br />
                <h1 id="review_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
	    <div class="row product" wieth="70%" style="text-align: center;">
			<table class="table table-borderless table-hover" style="width: 80%;">
                 <thead>
                     <tr>
	                     <th>번호</th>
	                     <th>제목</th>
	                     <th>작성일</th>
	                     <th>수정/삭제</th>
                     </tr>
                 </thead>
                 <c:forEach items="${list}" var = "review">
                 <c:if test="${member.userId eq review.reuserid}">
                 	<tr id="${ review.reno }">
                         <td>${review.reno }</td>
                         <td>${review.retitle }</td>
                         <td>${review.reuploaddate }</td>
                         <td class="updateFrm">
                         <c:if test="${member.userId eq review.reuserid}">
                         	<input type="hidden" name="reno" value="${review.reno}" />
							<button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="fn_goReviewUpdateForm('${ review.reno }');">수정</button>
          	                &nbsp;&nbsp;
          	                <button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="fn_goReviewDelete('${ review.reno }');">삭제</button>
						</c:if>
                         </td>
                     </tr>
                 </c:if>
                 </c:forEach>
             </table>
			
			<div>
				<br />
			</div>
	        <!-- 페이지 번호 -->
	        <div class="ListNum">
	           <br />
	           
	           <c:out value=" ${pageBar}" escapeXml="false"/>
	           
	           <br />
	           <br />
	        </div>
	    </div>
	</div>
	<c:import url="../common/footer.jsp" />
	
	<script>
	function fn_goReviewUpdateForm(reno){
		location.href = "${pageContext.request.contextPath}/review/reviewUpdateView.do?reno="+reno;
	}
	
	function fn_goReviewDelete(reno){
		location.href = "${pageContext.request.contextPath}/review/reviewDelete.do?reno="+reno;
	}
	
	$(function(){
		$("td:not(.updateFrm)").on("click",function(){
			var reno = $(this).parent().attr("id");
			console.log("reno="+reno);
			location.href = "${pageContext.request.contextPath}/review/reviewView.do?reno="+reno;
		});
	});

	</script>
	<!-- JQuery CDN-->
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous></script>	
</body>
</html>