<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>

<style>
.title {
	text-align: center;
}

#proReg {
	margin-left: 400px;
	width: 1200px;
}

.buttonRe {
	margin-left: 400px;
}

section #headerreg {
	margin-bottom: 60px;
	margin-left: 400px;
	border: black 1px solid;
	width: 200px;
	text-align: center;
	background: rgb(231, 133, 110);
	color: white;
	border-radius: 10px;
	font-size: 1.5em;
}

#titleh {
	margin-bottom: 60px;
	margin-left: 400px;
	
	width: 200px;
	text-align: center;
	

}
</style>

<c:import url="../common/adminSide.jsp" />
<script>

	function updateProduct() {
		//location.href = "${pageContext.request.contextPath}/admin/productFrom.do";
	}
	function productList() {
		location.href = "${pageContext.request.contextPath}/admin/adminProductList.do";
	}
	
	function fileDelete(obj, attNo, rName){

		$.ajax({
			url : '${pageContext.request.contextPath}/admin/fileDelete.do',
			data : { attNo : attNo, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	function validate(){
		var content = $("[name=pinfo]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
</script>
</head>
<body>
	<section>
		<div id="product reg">
			<br />
			<br />
			<h1 id="titleh">수정</h1>
			
			<form
				action="${pageContext.request.contextPath}/admin/productUpdateEnd.do"
				method="post" onsubmit="return validate();"
				enctype="multipart/form-data"">
				<table id="proReg" class="table table-bordered table-sm">
				<input type="hidden" name="pno" value="${ product.pno }" />
					<tr>
						<td class="title">분류</td>
						<td>
						<select name="cno" id="cnoSel">
								<option value="1" <c:if test="${product.cno == 1}">selected</c:if>>뼈/관절</option>
								<option value="2" <c:if test="${product.cno == 2}">selected</c:if>>면역력</option>
								<option value="3" <c:if test="${product.cno == 3}">selected</c:if>>소화/장</option>
								<option value="4" <c:if test="${product.cno == 4}">selected</c:if>>눈</option>
								<option value="5" <c:if test="${product.cno == 5}">selected</c:if>>모발</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="title">상품명</td>
						<td><input type="text" name="pname" value="${product.pname}"></td>
					</tr>
					<tr>
						<td class="title">재고</td>
						<td><input type="number" name="pstock"
							value="${product.pstock}"></td>
					</tr>
					<tr>
						<td class="title">판매가</td>
						<td><input type="number" name="pprice"
							value="${product.pprice}"></td>
					</tr>
					<tr>
						<td class="title">제품설명</td>
						<td><textarea name="pinfo" id="" cols="100" rows="10"
								style="resize: none;">${product.pinfo }</textarea></td>
					</tr>
					<tr>
						<td class="title">주의사항</td>
						<td><textarea name="fprec" id="" cols="100" rows="10"
								style="resize: none;">${product.fprec }</textarea></td>
					</tr>
					<tr>
						<td class="title">이미지</td>
						<td>
						<!-- <c:forEach items="${attachList}" var="a" varStatus="vs">
								<button type="button" class="btn btn-link col-8">
									${a.originalname }</button>
								<button type="button" class="btn btn-outline-danger col-3"
									onclick="fileDelete(this, '${a.pano}', '${a.changename }');">파일
									삭제</button>
								</div>
						</c:forEach> -->
							
						<c:forEach items="${attachList}" var="a">
						<div>
							<button type="button" class="btn btn-primary col-6" onclick=""> ${a.originalname}</button>
							<button type="button" class="btn btn-danger col-4" 
							onclick="fileDelete(this, '${a.pano}', '${a.changename }');">삭제</button> 
							<br /><br />
						</div>
						</c:forEach>
							<input class="images" name="upFile" type="file"><input class="images" name="upFile" type="file"><input class="images" name="upFile" type="file">
						</td>
					</tr>

				</table>
				<div class="buttonRe">
					<button type="submit" class="btn btn-success" >수정</button>
					<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/admin/productDelete.do?pno=${product.pno}'"/>
					<input type="button" class="btn btn-primary" value="리스트" onclick="location.href='${pageContext.request.contextPath}/admin/adminProductList.do"/>
				</div>

			</form>

		</div>
	</section>
	<br />
	<br />
</body>
</html>