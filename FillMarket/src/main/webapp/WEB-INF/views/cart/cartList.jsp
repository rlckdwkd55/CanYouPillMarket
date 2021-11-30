<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- fontawesome 아이콘cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cartList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
	<br>
	<br>

	
	<section class="section">
		<div class="top">
			<span class="cart">장바구니</span>
			<span><button id="deleteAll" onclick="deleteAll();">전체 삭제</button></span>
		</div>
		<br> <br>
		<div class="cart_tb">
		<form name="orderFrm" action="${pageContext.request.contextPath}/cart/orderInsert.do" method="post">
			<table id="cartList">
				<thead>
                        <tr>
                            <th width="30px"><input type="checkbox" name="allCheck" /></th>
                            <th width="160px">이미지</th>
                            <th width="570px">상 품</th>
                            <th width="180px">가 격</th>
                            <th width="120px">수 량</th>
                            <th width="180px">합 계</th>
                            <th width="20px"></th>
                        </tr>
				</thead>
				<tbody>
					<c:choose> 
						<c:when test="${ map.list != null }">
					<c:forEach items="${map.list}" var="cartList" varStatus="i">
					<tr>
						<td id="checked"><input type="checkbox"></td>
						<td id="productImg">
							<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/productUpload/${ cartList.changename }">
						</td>
						<td style="text-align: left;">${ cartList.pname }</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${ cartList.pprice }" /> 원
						</td>
						<td>
							<input style="width: 36px; height:23px" type="number" name="amount" value="${ cartList.amount }">
							<button type="button" id="updateBtn">수정</button> 
							<input type="hidden" name="cartno" value="${ cartList.cartno }"> 
							<input type="hidden" name="pno" value="${ cartList.pno }">
							<input type="hidden" name="cartuserid" value="${ member.userId }" />
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${ cartList.orderprice }" /> 원
						</td>
						<td id="deleteBtn">
							<a href="${pageContext.request.contextPath}/cart/cartDelete.do?cartno=${ cartList.cartno }"> 
							<i id="deleteIcon" class="fas fa-times"></i></a>
						</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<br>
			<table id="cartList2">
				<tr>
					<td><b>Total</b></td>
					<td style="text-align: right;"><b><fmt:formatNumber pattern="###,###,###" value="${ map.sumPrice }" /> 원</b>
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td style="text-align: right;"><fmt:formatNumber pattern="###,###,###" value="${ map.fee }" /> 원<br>
                         (3만원 이상 구입 시 무료배송)</td>
				</tr>
			</table>
			<br> <br>
			<table id="cartList3">
				<tr>
					<td><b>총 주문 금액</b></td>
					<td id="totalPrice">
						<fmt:formatNumber pattern="###,###,###" value="${ map.allSum }" /> 원
					</td>
				</tr>
				
				</c:when>
				
				<c:otherwise>

				<tr>
					<td id="emptyMsg" colspan="7"><h3>장바구니가 비어있습니다.</h3></td>
				</tr>
				</c:otherwise>
			</c:choose>

			</table>
			
			
			
			</form>
		</div>
        <br><br>
        <div class="btnArea">
            <button id="backShop" onclick="backShop();">쇼핑 계속하기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="orderBtn" type="submit">주문하기</button>
        </div>
    </section>
    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
	
	<script>
		$('#backShop').click(function(){
			location.href = "${pageContext.request.contextPath}/product/productList.do";
		});
		
		$('#orderBtn').click(function(){
			location.href = "${pageContext.request.contextPath}/order/orderPage.do";
		});
		
		function deleteAll(){
			if(confirm("정말 삭제하시겠습니까?") == true) {
				location.href = "${pageContext.request.contextPath}/cart/cartDeleteAll.do";
			} else {
				return;
			}
		}
		
		/* 수정 버튼 안 됨
		$('#updateBtn').click(function(){
			location.href = "${pageContext.request.contextPath}/cart/cartUpdate.do";
		})*/
	</script>
</body>
</html>



