<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 목록</title>
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderList.css">
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
        <div class="top">
            <span id="title" class="h3 mb-3 fw-normal mt-5 pt-5"><strong>MY ORDER</strong></span>
        </div>
        <br>
        <hr>
        <br><br>
        <c:forEach items="${list}" var="orderList">
        <div class="myOrder">
            <table id="myOrder_tb">
			
                <tr>
                    <td width="300px">주문번호</td>
                    <td width="600px"><a style="text-decoration: none;" href="${pageContext.request.contextPath}/order/orderDetail.do?n=${ orderList.orderid }">${ orderList.orderid }</a></td>
                </tr>
                <tr>
                    <td width="300px">주문일자</td>
                    <td width="600px">${ orderList.orderenroll }</td>
                </tr>
                <tr>
                    <td width="300px">주문상품</td>
                    <td width="600px">${ orderList.pname } <b>외 ${ orderList.cnt }개</b></td>
                </tr>
                <tr>
                    <td width="300px">수령인</td>
                    <td width="300px">${ orderList.receivername }</td>
                </tr>
                <tr>
                    <td width="300px">주문금액</td>
                    <td width="300px"><fmt:formatNumber pattern="###,###,###" value="${ orderList.totalprice }" />원</td>
                </tr>

            </table>
        </div>
            <br>
            </c:forEach>
    </section>


    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />

</body>
</html>