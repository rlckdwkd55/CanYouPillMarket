<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</head>

<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800')
	;

.text_box {
	font-family: 'Nanum Gothic';
	text-align: center;
	padding: 10px 0;
}

.display-4 {
	font-size: 2.5rem;
}

@media ( min-width : 768px) {
	.display-4 {
		font-size: 3rem;
	}
}

@media ( min-width : 768px) {
	.col-md-3 {
		width: 20%;
	}
}

.h-250 {
	height: 250px;
}

@media ( min-width : 768px) {
	.h-md-250 {
		height: 250px;
	}
}

#myPage_header {
	text-align: center;
	color: rgb(255, 142, 117);;
}

.position-relative {
	height: 150px;
}

:root { -
	-bs-body-line-height: 1rem;
}
</style>

<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />

	<h1 id="myPage_header" class="h3 mb-3 fw-normal mt-5 pt-5">
		<strong>MY PAGE</strong>
	</h1>

	<div style="text-align: center;" class="mb-5">
		<span><a>${member.userName}</a> 님 저희 쇼핑몰을 이용해 주셔서 감사합니다.</span>
	</div>

	<div id="top" class="row mb-2" style="justify-content: center;">
		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">💳 ORDER</h4>
					<div class="mb-1 text-muted">주문내역 조회</div>
					<p class="card-text mb-auto">
						고객님께서 주문하신 상품의 <br>주문내역을 확인하실 수 있습니다.
					</p>
					<a href="${pageContext.request.contextPath}/order/orderList.do"; class="stretched-link"></a>
				</div>
			</div>
		</div>

		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">❤️ HEART</h4>
					<div class="mb-1 text-muted">진단 결과</div>
					<p class="card-text mb-auto">
						관심상품으로 등록하신 상품의 <br>목록을 보여드립니다.
					</p>
					<a href="#" class="stretched-link"></a>
				</div>
			</div>
		</div>

		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">👤 PROFILE</h4>
					<div class="mb-1 text-muted">회원정보 수정</div>
					<p class="card-text mb-auto">
						회원이신 고객님의 개인정보를<br>관리하는 페이지입니다.
					</p>
					<a href="${pageContext.request.contextPath}/member/memberView.do" class="stretched-link"></a>
				</div>
			</div>
		</div>
	</div>

	<div id="top" class="row mb-5 pb-5" style="justify-content: center;">
		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">✍️ REVIEW</h4>
					<div class="mb-1 text-muted">내가 쓴 리뷰</div>
					<p class="card-text mb-auto">
						고객님께서 작성하신 리뷰를<br>한눈에 관리하실 수 있습니다.
					</p>
					<a href="${pageContext.request.contextPath}/review/reviewList.do" class="stretched-link"></a>
				</div>
			</div>
		</div>

		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">📋 Q & A</h4>
					<div class="mb-1 text-muted">나의 문의</div>
					<p class="card-text mb-auto">
						고객님께서 작성하신 문의글을<br>한눈에 관리하실 수 있습니다.
					</p>
					<a href="#" class="stretched-link"></a>
				</div>
			</div>
		</div>

		<div class="col-md-3" style="text-align: center;">
			<div id="one"
				class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-3 d-flex flex-column position-static">
					<h4 class="d-inline-block">📞CS</h4>
					<div class="mb-1 text-muted">고객센터</div>
					<p class="card-text mb-auto">
						불편을 겪은 일이 있으시다면<br>고객센터를 찾아주세요.
					</p>
					<a href="${pageContext.request.contextPath}/qna/qnaList.do" class="stretched-link"></a>
				</div>
			</div>
		</div>
	</div>
	
	<div
		style="position: fixed; bottom: 20px; right: 20px; font-size: 40px; text-decoration-line: none;">
		<a href="#Top">🔝</a>
	</div>
	<c:import url="../common/footer.jsp" />
</body>

</html>