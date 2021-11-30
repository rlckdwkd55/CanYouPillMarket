<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- iamport.payment.js 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderPage.css">
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
	<script>
    // 우편번호 검색
    function searchZipcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var fullAddr = ''; // 최종 주소 변수
              var extraAddr = ''; // 조합형 주소 변수

              // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  fullAddr = data.roadAddress;

              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  fullAddr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
              if(data.userSelectedType === 'R'){
                  //법정동명이 있을 경우 추가한다.
                  if(data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
                  }
               // 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
                  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                  fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
              } 

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('receiverZipcode').value = data.zonecode;
              document.getElementById('receiverAddress1').value = fullAddr;

              // 커서를 상세주소 필드로 이동한다.
              document.getElementById('receiverAddress2').focus();
          }
      }).open();
  }
    </script>
</head>

<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
    <br><br><br><br><br>

    <section>
        <div class="top">
            <span class="title">주문내역 및 배송지 정보</span>
        </div>
        <div class="top2">
            <span class="title2">주문내역</span>
        </div>
        <br>
        <div class="order_tb">
        <form action="${pageContext.request.contextPath}/order/orderInsert.do" id="orderFrm" method="post">
            <table id="orderList">
                <thead>
                    <tr>
                        <th width="1000px">상품 정보</th>
                        <th width="100px">수량</th>
                        <th width="200px">주문 가격</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${map.list}" var="cartList" varStatus="i">
                    <tr>
                        <td>
                            ${ cartList.pname }
                            <input type="hidden" name="pname" value="${cartList.pname }" />
                        </td>
                        <td>${ cartList.amount }</td>
                        <td><fmt:formatNumber pattern="###,###,###" value="${ cartList.orderprice }" /></td>
                    </tr>
                </tbody>
            </c:forEach>
            </table>
            <br>
            
            <table id="orderList2">
                <tr>
                    <td><b>Total</b></td>
                    <td style="text-align: right;">
                        <b><fmt:formatNumber pattern="###,###,###" value="${ map.sumPrice }"/> 원</b>
                        
                    </td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td style="text-align: right;">
                         <fmt:formatNumber pattern="###,###,###" value="${ map.fee }" /> 원 <br>
                         (3만원 이상 구입 시 무료배송)
                         <input type="hidden" name="fee" value="${ map.fee }" />
                    </td>
                </tr>
            </table>
            <hr><br>
            <table id="orderList3">
                <tr>
                    <td>총 결제금액</td>
                    <td style="text-align: right;">
                    	<fmt:formatNumber pattern="###,###,###" value="${ map.allSum }"/> 원
                    	<input type="hidden" id="totalprice" name="totalprice" value="${ map.allSum }"/>
                    	<!-- <input type="hidden" name="pno" value="${ cartList.pno }" /> -->
                    	<!-- <input type="hidden" name="amount" ${ cartList.amount } /> -->
                    </td>
                </tr>
            </table>
            
        </div>
        <br><br><br><br>
        <div class="customerInfo">
            <span class="title2">주문자 정보</span>
        </div>
        <br>

            <div class="customerInfo2">
                <div class="input-label-wrap">
                    <label for="customerName">이 &nbsp; 름</label><br>
                    <input type="text" id="customerName" placeholder="이름을 입력해주세요." name="customername" value="${ member.userName }">
                </div>
                <div class="input-label-wrap">
                    <label for="customerTel">연락처</label><br>
                    <input type="tel" id="customerTel" placeholder="연락처를 입력해주세요. ('-'제외)" value="${ member.phone }">
                </div>
                <!-- <div class="input-label-wrap">
                    <label for="customerEmail">이메일</label><br>
                    <input type="email" id="customerEmail" placeholder="이메일을 입력해 주세요.">
                </div> -->
            </div>
            <br><br>
            <div class="deliveryInfo">
                <span class="title2">배송지 정보</span>
                <span id="getInfo"><label for="getInfo">
                    <input type="checkbox" id="copyChecked" onclick="copyInfo();"> 주문자 정보 가져오기</label></span>
                                
                    <script>
                        // 주문자 정보 가져오기 체크박스
                        function copyInfo() {
                            if(document.getElementById('copyChecked').checked) {
                                document.getElementById('receiverName').value = document.getElementById('customerName').value;
                                document.getElementById('receiverTel').value = document.getElementById('customerTel').value;
                            }
                        }
                    </script>
            </div>
            <br>
            <div class="deliveryInfo2">
                <div class="input-label-wrap">
                    <label for="receiverName">수령인 이름</label><br>
                    <input type="text" id="receiverName" name="receivername" placeholder="수령인 이름을 입력해주세요.">
                </div>
                <div class="input-label-wrap">
                    <label for="receiverTel">연락처</label><br>
                    <input type="tel" id="receiverTel" name="phone" placeholder="수령인 연락처를 입력해주세요. ('-'제외)">
                </div>
                <div class="input-zipcode-wrap">
                    <label for="receiverZipcode">우편번호</label><br>
                    <input type="text" id="receiverZipcode" name="address1" placeholder="우편번호를 입력해 주세요." readonly>&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="searchZipcode();" id="searchZipcodeBtn" value="우편번호 찾기" />
                </div>
                <div class="input-label-wrap">
                    <label for="receiverAddress1">도로명 주소</label><br>
                    <input type="tel" id="receiverAddress1" name="address2" placeholder="도로명 주소를 입력해 주세요." readonly>
                </div>
                <div class="input-label-wrap">
                    <label for="receiverAddress2">나머지 주소</label><br>
                    <input type="tel" id="receiverAddress2" name="address2" placeholder="나머지 주소를 입력해 주세요.">
                </div>
            </div>
            <br><br>
            <!-- <div class="paymentInfo">
                <span class="title2">결제 방법</span>
            </div> -->
            <br><br>
            <div class="btnArea">
                <button type="button" onclick="requestPay();" id="orderBtn">결제하기</button>
            </div>
        </form>
    </section>

    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
	<!-- 
	<script>
		$('#orderBtn').click(function(){
			location.href = "${pageContext.request.contextPath}/order/orderFinish.do";
		})
	</script>
	 -->
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능
		var iamportKey = 'imp10320709';
		
		$(function() {
			IMP.init( iamportKey );
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		function requestPay() {
			// 문서 로딩될 때 바로 호출
			
				IMP.request_pay({
					pg : 'kakao',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
					name : '영양제',
					amount : '${ map.allSum }',
					buyer_tel : '${ member.phone }'
				}, function(rsp) {
					
					console.log(rsp);
					if (rsp.success) {
						//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						jQuery.ajax({
							url : "${pageContext.request.contextPath}/order/orderInsert.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
							type : "POST",
							dataType : 'json',
							data : /*{
								imp_uid : rsp.imp_uid,
								pay_method : rsp.pay_method,
								price : rsp.paid_amount,
								status : rsp.status,
								title : rsp.name,
								pg_tid : rsp.pg_tid,
								paid_at : rsp.paid_at
							//기타 필요한 데이터가 있으면 추가 전달
							}*/ $('#orderFrm').serialize()
							
						});
						
						// console.log(data);
						location.href = "${pageContext.request.contextPath}/order/orderFinish.do";
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		};
	</script>
</body>

</html>










