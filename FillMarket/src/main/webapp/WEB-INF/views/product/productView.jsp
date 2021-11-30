<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
	<!-- css -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
	<style>

	.btn{ background-color : rgb(255, 142, 117); color: white; }

	</style>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	
	<div class="container" style="width: 70%">
		<form name="insertFrm2" action="${pageContext.request.contextPath}/cart/cartDetailInsert.do" method="post">
		<div class="row">
			
			<h1 class="page-header" style="text-align: center; margin-bottom: 50px;"><br />${product.pname}</h1>
			<input type="hidden" value="${product.pno}" id="pno" name="pno">
			<input type="hidden" value="${product.pname}" name="pname"/>
		</div>
		<div class="row row-cols-1 row-cols-md-2 g-2" style="float: left; text-align: center; width:40%">
           	<c:forEach items="${pattachmentList}" var="a" varStatus="vs">
				<img src="${pageContext.request.contextPath}/resources/productUpload/${a.changename}" alt="첨부파일" width="150%;" "/>
			</c:forEach>
		</div>

		<div class="row productInfo" style="width: 30%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${product.pname}</span><br><br /></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${product.pprice}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${product.pprice}" id="pprice" name="pprice">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
			</div>
	
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : </label> 
				<input type="hidden" value="${product.pstock}" id="pstock">				
				<select class="form-control" id="select_amount"  name="amount">
				<c:forEach begin="1" end="${ product.pstock }" var="product" >
					<option>${ product }</option>
				</c:forEach>
				</select>
			</div>	
			</form>
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
					<button type="submit" style="z-index:100;" class="btn" onclick="goCart('${ product.pno }', '${ product.pname }', '${ product.pprice }');">장바구니 담기</button>
					<br />
				</div>
			</div>
			<hr>	
		</div>
	</div>
	<div class="container" style="width: 100%">
		
		<div class="row about_product" style="text-align: left; width: 90%; margin: 80px 0;">
			<h1 class="page-header"><br /><br />상품 안내</h1>
				<input type="hidden" value="${product.pinfo}" id="pinfo">
				<small> ${ product.pinfo }</small>
		</div>
		
		
		<div class="row about_product" style="text-align: left; width: 90%; margin: 80px 0;">
			<h1 class="page-header">주의사항</h1>
				<input type="hidden" value="${product.fprec}" id="fprec">
				<small> ${ product.fprec }</small>
		</div>
		
		<div class="row reviews" style="text-align: center; margin: 80px 0; width: 70%;">
			<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>
			<p>
			<button type="button" class="btn" onclick="goReview('${ product.pno }', '${ product.pname }');">리뷰 등록</button>
			<!-- <input type="button" value="리뷰등록" id="btn-add" class="btn" onclick="fn_goRivewForm();"/> -->
			</p>
			
			
			<div class="row-cols-1 row-cols-md-1 g-1" ">
				<c:forEach items="${List}" var="review" >
				<div id="${ review.reno }">
				<input type="hidden" value="${review.reno}" id="reno">
				<div class="rattachment" style="float: left; text-align: center; width:45px ; height :40px">
					<img src="${pageContext.request.contextPath}/resources/reviewUpload/${review.rattachment.changename}" alt="첨부파일" width="100px;" "/>
				</div> 
				
				<div class="retitle">
					<!-- <input type="hidden" value="${review.retitle}" id="retitle"> -->
					<h3 class="panel-title" >${ review.retitle }</h3>
					<h6 class="panel-writer" style="margin: 20px 0; text-overflow: ellipsis; overflow: hidden; display:-webkitit-box; -webkit-line-clamp:1; -webkit-box-orient:vertical;" >💊 ${ review.reuserid } 님의 후기입니다.
					&nbsp;&nbsp; 상세한 리뷰 내용을 보시려면 클릭하세요! 💊 <br />
 				    </h6>
				</div>
				
				</div>
				
				</c:forEach>
			</div>
			
		</div>
	</div>
<script>
		
		$("#select_amount").on('blur', function() {
			var product = $(this).val();
			var pprice = $("#pprice").val();
			
			
			if (product*pprice >= 30000) {
				var shipping = '무료배송';
				var finalPrice = product*pprice;
			} else {
				var shipping = 2500;
				var finalPrice = (product*pprice) + shipping;
			}
			
			var str = '';
			
			str += '<p><label>수량 : </label><span>&nbsp;' + product + '</span>&nbsp;&nbsp;&nbsp;';	
			
			str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
			str	+= '<label>가격 : </label><span>&nbsp;' + pprice + ' 원</span></p>';
			str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
			str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
			
			$(".selected_option").html(str);
		});
		
			var divs = document.querySelectorAll('div');
			divs.forEach(function(div){
				div.addEventListener('click',logEvent, { 
					capture : true
				})
			});
			
			function logEvent(event){
				console.log(event.currentTarget.className);
			}
			
			/*
			function goCart(pno, pname, pprice){
				location.href = "${pageContext.request.contextPath}/cart/cartDetailInsert.do?pno="+pno + "&pname="+pname + "&pprice="+pprice;
			}*/
			
			function goReview(pno, pname){
				location.href = "${pageContext.request.contextPath}/review/reviewForm.do?pno="+pno+"&pname="+pname;
			}
			
			$(function(){
				$("div[id]").on("click",function(){
					var reno = $(this).attr("id");
					console.log("reno="+reno);
					location.href = "${pageContext.request.contextPath}/review/reviewView.do?reno="+reno;
				});
			});
			
</script>

	<c:import url="../common/footer.jsp" />
		
</body>
</html>