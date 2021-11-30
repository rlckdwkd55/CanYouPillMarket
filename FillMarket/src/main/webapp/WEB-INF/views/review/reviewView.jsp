<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
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
	div#review-container{ margin:0 auto; text-align:center;}
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
.form-control {
    display: block;
    width: 70%;
 	margin:0 auto;
    }
.input-group {
    position: relative;
    display: flex;
    width: 100%;
    justify-content: space-around;
    flex-direction: row;
    align-items: center;
    flex-wrap: nowrap;
    align-content: flex-start;
}

	
	#header{ color : rgba(0, 0, 0, 0.35) ;
			 text-align: center; }
	#reviewView_header {
	text-align: center;
	color: rgb(255, 142, 117);
}		
	.btn{ background-color : rgb(255, 142, 117); color: white; }
	</style>
	<script>

	</script>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<div id="review-container">
	  			<br />
                <h1 id="reviewView_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
	    <div class="row product" width="90%">
			<div id="reviw-container" width="60%">
			<input type="text" class="form-control" placeholder="제목" name="retitle" id="retitle" value="${review.retitle }" required>
			<input type="text" class="form-control" name="reuserid" value="${review.reuserid}" readonly required>
			<input type="hidden" class="form-control" name="reuserid" value="${review.pno}" readonly required>
			<input type="text" class="form-control" name="reuserid" value="${review.pname}" readonly required>
			<!--<c:forEach items="${rattachmentList}" var="ra" varStatus="vs">-->
				<img src="${pageContext.request.contextPath}/resources/reviewUpload/${ra.changename}" alt="첨부파일" width="30%;" "/>	
			<!--</c:forEach> -->
		    <textarea class="form-control" name="recontent" placeholder="내용" required>${review.recontent }</textarea>
		    <br>
		    <button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="location.href='${pageContext.request.contextPath}/review/reviewList.do'">리스트로</button>
		    <c:if test="${member.userId eq review.reuserid}">
		    &nbsp;
			<button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="location.href='${pageContext.request.contextPath}/review/reviewUpdateView.do?reno=${review.reno}'">수정 페이지</button>
			</c:if>
			<br />
			<br />
			<br />
			</div>
			
			
	    </div>
	</div>
	<c:import url="../common/footer.jsp" />
	
	<!-- JQuery CDN-->
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous></script>	
</body>
</html>