<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFinish.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
    <br><br><br><br><br>

    <section>
        <div class="orderMSG">
            <p>결제가 완료되었습니다. 주문해 주셔서 감사합니다.</p>
        </div>
        <br><br><br>

        <br><br><br><br>
        <div class="btnArea">
            <button id="goProductList">쇼핑 계속하기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
            <button id="goOrderList">주문내역 확인</button>
        </div>
    </section>

    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
	
	<script>
		$('#goProductList').click(function(){
			location.href = "${pageContext.request.contextPath}/product/productList.do";
		});
		
		$('#goOrderList').click(function(){
			location.href = "${pageContext.request.contextPath}/order/orderList.do";
		});
	</script>
</body>
</html>





