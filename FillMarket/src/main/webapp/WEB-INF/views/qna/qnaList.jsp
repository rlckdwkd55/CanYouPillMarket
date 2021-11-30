<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA리스트</title>
<link rel="stylesheet" href="../resources/css/qstyle.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
</style>
<c:import url="../common/header.jsp" />
</head>

<body>
	<br>
	<c:import url="../common/navbar.jsp" />
	<br>
	<div class="container">
		<div class="board_title">
			<div class="board_title_a">FAQ</div>
			<div class="board_title_b">자주묻는 질문들</div>
		</div>
		<div class="row">
			<div class="row-4 w-100 p-2">
				<div class="list-group d-flex flex-row bd-highlight mb text-center"
					role="button" id="list-tab" role="tablist">
					<div class="list-group-item list-group-item-action active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home">주문/결제</div>
					<div class="list-group-item list-group-item-action"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile">배송 문의</div>
					<div class="list-group-item list-group-item-action"
						id="list-messages-list" data-bs-toggle="list"
						href="#list-messages" role="tab" aria-controls="list-messages">교환/반품</div>
					<div class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list"
						href="#list-settings" role="tab" aria-controls="list-settings">기타
						문의</div>
				</div>
			</div>
			<div class="col-8 w-100 p-2">
				<div class="tab-content w-100 p-2" id="nav-tabContent">
					<div class="tab-pane fade show active w-100 p-2" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item w-100 p-2">
								<h2 class="accordion-header w-100 p-2"
									id="panelsStayOpen-headingOne">
									<button class="accordion-button w-100 p-2 fs-5" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">Q. 결제 후 주문
										내용 확인은 어디서 하나요?</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body fs-6">A. 주문내역은 주문 작성 시 입력하신
										아이디와 비밀번호 로그인을 통해서 확인이 가능하며, 보다 자세한 내용은 [마이페이지]를 통해서 확인 할 수
										있습니다.</div>
								</div>
							</div>
							<div class="accordion-item w-100 p-2">
								<h2 class="accordion-header w-100 p-2"
									id="panelsStayOpen-headingTwo">
									<button class="accordion-button collapsed w-100 p-2 fs-5"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseTwo"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseTwo">Q. 주문 취소는
										어디서 하나요?</button>
								</h2>
								<div id="panelsStayOpen-collapseTwo"
									class="accordion-collapse collapse"
									aria-labelledby="panelsStayOpen-headingTwo">
									<div class="accordion-body fs-6">
										A. 로그인 후 [마이페이지] 에서 주문 취소 하실 수 있습니다. 주문 결제 전인 경우에 고객님께서 직접 취소가
										가능합니다. 결제 완료 된 후 취소를 원하실 경우 제품 발송처리 전 진행이 가능합니다. (발송 및 배송 중인
										경우 취소가 불가능한 점 참고 부탁드립니다.) 성함, 주문번호, 연락처, 취소 사유 (환불 계좌, 은행명,
										예금주 성함)를 함께 남겨주셔야 빠른 환불이 가능합니다
										</p>
									</div>
								</div>
							</div>
							<div class="accordion-item w-100 p-2">
								<h2 class="accordion-header w-100 p-2"
									id="panelsStayOpen-headingThree">
									<button class="accordion-button collapsed w-100 p-2 fs-5"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseThree"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseThree">Q. 현금
										영수증/ 세금계산서 발행이 가능한가요?</button>
								</h2>
								<div id="panelsStayOpen-collapseThree"
									class="accordion-collapse collapse"
									aria-labelledby="panelsStayOpen-headingThree">
									<div class="accordion-body fs-6">
										<p>A. 현금 영수증의 경우 무통장 입금 주문시 휴대폰 번호를 입력하여 신청/미신청을 선택하실 수
											있습니다. 세금계산서의 경우도 현금 결제에 한해서 가능하며, 사업자 등록증 사본 및 이메일 주소가 필요합니다.

											신청이 필요하신 경우 고객센터(070-1234-1234) 로 문의 주세요!</p>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingOne">
								<button class="accordion-button w-100 p-2 fs-5" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseOne"
									aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
									Q. 어디 택배사로 배송되나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseOne"
								class="accordion-collapse collapse show"
								aria-labelledby="panelsStayOpen-headingOne">
								<div class="accordion-body fs-6">
									<p>A. CJ대한통운으로 빠르고 안전하게 배송됩니다.</p>
								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingTwo">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseTwo"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseTwo">Q. 배송 조회는
									어떻게 하나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseTwo"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingTwo">
								<div class="accordion-body fs-6">
									<p>A. 주문 완료 후, 전달드리는 송장번호를 통해 조회가능합니다. 송장번호를 전달받지 못한 경우는
										고객센터(070-1234-1234) 문의주세요.</p>

								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingThree">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseThree"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseThree">Q. 배송기간은
									얼마나 걸리나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseThree"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body fs-6">
									<p>지역마다 차이가 있지만 평균적으로 배송기간은 약 1~3일 정도 소요됩니다. (택배사의 사정에 따라
										약간의 배송이 지연 될 수 있습니다.) 평일 오후 4시 이후 주문 건은 다음날 출고 처리가 되며, 주문하신
										다음날이 주말,공휴일인 경우 다음날 출고 처리가 이루어집니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="list-messages" role="tabpanel"
						aria-labelledby="list-messages-list">
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingOne">
								<button class="accordion-button w-100 p-2 fs-5" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseOne"
									aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
									Q. 교환/반품은 어떻게 받나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseOne"
								class="accordion-collapse collapse show"
								aria-labelledby="panelsStayOpen-headingOne">
								<div class="accordion-body fs-6">
									<p>A. ①단순 변심 반품 - 상품 수령 후 7일 이내에 사용하지않은 제품에 한하여 가능하며, 상품이
										당사에 도착한 후 2~3일내 검품을 마친 뒤에 환불 처리가 가능합니다.<br>
										 - 왕복택배비 5,000원은 고객님 부담입니다. <br>
										 ② 상품 불량 반품 - 상품 불량을 증명할 수 있는 사진 첨부 필수 - 상품 수령일로부터 7일 이내
										교환/반품이 가능하며, 택배비는 어시크 가 부담합니다. <br>
										환불은 반품 완료 후 결제 방법에 따라 5~7일 정도 소요되는 점 참고 부탁드리며 고객센터(070-1234-1234)로 문의 부탁드립니다.</p>
								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingTwo">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseTwo"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseTwo">Q. 주문 취소는
									어디서 하나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseTwo"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingTwo">
								<div class="accordion-body fs-6">
									A. 로그인 후 [마이페이지] 에서 주문 취소 하실 수 있습니다. 주문 결제 전인 경우에 고객님께서 직접 취소가
									가능합니다. 결제 완료 된 후 취소를 원하실 경우 제품 발송처리 전 진행이 가능합니다. (발송 및 배송 중인 경우
									취소가 불가능한 점 참고 부탁드립니다.) 성함, 주문번호, 연락처, 취소 사유 (환불 계좌, 은행명, 예금주
									성함)를 함께 남겨주셔야 빠른 환불이 가능합니다
									</p>
								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingThree">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseThree"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseThree">Q. 반품 시
									환불 기간은 얼마나 소요되나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseThree"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body fs-6">
									<p>
										[카드결제 환불] 결제 당일 취소는 카드사에서 당일 취소확인이 가능합니다. 익일 이후 취소일 경우 카드사 사정에
										따라 3~5일 후 해당 카드사에서 취소 내역을 확인하실 수 있습니다. <br>


										[현금결제(무통장입금/가상계좌)] 취소/반품 신청 시, 환불계좌를 등록하시거나 1;1 게시판 or 고객센터에

										문의 남겨주시면 주문취소일 또는 반품제품입고 기준일로 부터 영업일 5일 이내 처리가 됩니다.
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="list-settings" role="tabpanel"
						aria-labelledby="list-settings-list">
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingOne">
								<button class="accordion-button w-100 p-2 fs-5" type="button"
									data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseOne"
									aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
									Q. 회원 ID와 비밀번호가 생각나지 않아요</button>
							</h2>
							<div id="panelsStayOpen-collapseOne"
								class="accordion-collapse collapse show"
								aria-labelledby="panelsStayOpen-headingOne">
								<div class="accordion-body fs-6">
									<p>A. 회원 아이디나 비밀번호를 잊어버리신 경우에는, 로그인 시 회원 아이디/비밀번호 찾기를 통해 찾을
										수 있습니다. 아이디/비밀번호 찾기를 통해 찾기 어려우신 분은 고객센터(070-1234-1234)로 문의
										바랍니다.</p>

								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingTwo">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseTwo"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseTwo">
									Q.회원정보(전화번호,주소 변경 등)은 어디서 하나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseTwo"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingTwo">
								<div class="accordion-body fs-6">
									<p>A. 고객님의 모든 회원정보는 로그인 후, [마이페이지] 에서 확인 및 수정변경 가능합니다.</p>
								</div>
							</div>
						</div>
						<div class="accordion-item w-100 p-2">
							<h2 class="accordion-header w-100 p-2"
								id="panelsStayOpen-headingThree">
								<button class="accordion-button collapsed w-100 p-2 fs-5"
									type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseThree"
									aria-expanded="false"
									aria-controls="panelsStayOpen-collapseThree">Q. 전화상담이
									안되는데 어떻게 하나요?</button>
							</h2>
							<div id="panelsStayOpen-collapseThree"
								class="accordion-collapse collapse"
								aria-labelledby="panelsStayOpen-headingThree">
								<div class="accordion-body fs-6">A. 고객님의 문의가 많아서 전화연결이
									어려우실 경우에는 게시판으로 문의 해주시면 실시간으로 답변 드리고 있습니다.</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="board_title">
				<div class="board_title_a">Q&A</div>
				<div class="board_title_b">고객센터</div>
			</div>
			<table class="table table-hover text-center">
				<table class="table table-hover">
					<thead class="text-center">
						<tr>
							<th id="no" scope="col">No</th>
							<th id="title" scope="col">제목</th>
							<th id="writer" scope="col">작성자</th>
							<th id="date" scope="col">작성일</th>
						</tr>
					</thead>
					<tbody role="button">
						<c:forEach items="${list}" var="b">
							<tr id="${b.qano}" class="sel">
								<th id="no" scope="row">${b.qano}</th>
								<td id="title">[${b.qasel}] ${b.qatitle}</td>
								<td id="writer">${b.qauserid}</td>
								<td id="date">${b.qauploaddate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:out value="${pageBar}" escapeXml="false" />
				<div class="d-grid gap-2 col-3 mx-auto mb-5">
					<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/qna/qnaWrite.do'" />
					문의하기
					</button>
				</div>
				</div>
				<c:import url="../common/footer.jsp" />

				<script>
         
                    		$(function(){
                    			$("tr[id]").on("click",function(){
                    				var qnano = $(this).attr("id");
                    				console.log("qnano="+qnano);
                    				location.href = "${pageContext.request.contextPath}/qna/qnaView.do?no="+qnano;
                    			});
                    		});
                        </script>
</body>
</html>