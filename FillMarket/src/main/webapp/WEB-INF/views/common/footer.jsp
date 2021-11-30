<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<div class="container footer-0affix affix-item" style="
    font-family: Helvetica;
">
	<footer>
		<div class="row">
			<div class="col-3">
				<h5 style="color: rgb(216, 83, 55);">회사정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2 p-0 text-dark">CanYouPillMarket.</li>
					<li class="nav-item mb-1 p-0 text-secondary">상 &nbsp;&nbsp; 호
						&nbsp;&nbsp;: 약사조</li>
					<li class="nav-item mb-1 p-0 text-secondary">대 &nbsp;&nbsp; 표
						&nbsp;&nbsp;: 약사조</li>
					<li class="nav-item mb-2 p-0 text-secondary">서울특벽시 강남구 테헤란로 130 <br>
					(역삼동 823-23)5층 352반
					</li>
				</ul>
			</div>

			<div class="col-3">
				<h5 style="color: rgb(216, 83, 55);">고객센터</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2 p-0 text-dark">1234-1234</li>
					<li class="nav-item mb-1 p-0 text-secondary">WEEK
						&nbsp;&nbsp;&nbsp;: 09:00 ~ 18:00</li>
					<li class="nav-item mb-1 p-0 text-secondary">LUNCH &nbsp;:
						13:00 ~ 14:00</li>
					<li class="nav-item mb-2 p-0 text-secondary">주말, 공휴일은 휴무입니다.</li>
				</ul>
			</div>

			<div class="col-3">
				<h5 style="color: rgb(216, 83, 55);">계좌정보</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2 p-0 text-dark">예금주 &nbsp;&nbsp; :
						캔유필마켓</li>
					<li class="nav-item mb-1 p-0 text-secondary">농 &nbsp;&nbsp; 협
						&nbsp;&nbsp;: 123-1234-1234-11</li>
					<li class="nav-item mb-1 p-0 text-secondary">국 &nbsp;&nbsp; 민
						&nbsp;&nbsp;: 123465-01-1234567</li>
					<li class="nav-item mb-1 p-0 text-secondary">우체국 &nbsp;&nbsp;
						: 123456-02-123456</li>
				</ul>
			</div>

			<div class="col-3">
				<h5 style="color: rgb(216, 83, 55);">반품</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/qna/qnaList.do"
						class="nav-link p-0 text-dark">교환/반품 정책 확인 ▶︎</a></li>

					<li class="nav-item mb-1 p-0 text-secondary">서울특별시 강남구 테헤란로
						130</li>
					<li class="nav-item mb-1 p-0 text-secondary">(역삼동 823-23)5층
						352반</li>
					<li class="nav-item mb-1 p-0 text-secondary">캔유필마켓 앞</li>
				</ul>
			</div>

			<div class="d-flex justify-content-between py-1 my-1 border-top">
				<p>COPYRIGHT Ⓒ 2021 CANYOUPILLMARKET, ALL RIGHTS RESERVED.
					FINALPROJECT KH Academy reserved by Gichang, Jieun, Changhwan,
					Yeji, SeungByung.</p>
			</div>
	</footer>
</div>