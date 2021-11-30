<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

	<style>
        .title {
            text-align: center;
        }

        #proReg {
            margin-left: 400px;
            width: 1200px;
        }
        .buttonRe{
            margin-left: 400px;
            
        }
        section #headerreg{
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
        
        #titleh{

        	
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
	
</script>
</head>
<body>
<section>
	<div id="product reg">
	<br /><br />
        <h1 id="titleh">상세보기</h1>
        
        <!-- <form action="${pageContext.request.contextPath}/admin/productRegEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data"">  -->
            <table id="proReg" class="table table-bordered table-sm">
                <tr>
                    <td class="title">분류</td>
                    <td>
                        <label><c:choose>
                        			<c:when test="${product.cno == 1 }">뼈/관절</c:when>
                        			<c:when test="${product.cno == 2 }">면역력</c:when>
                        			<c:when test="${product.cno == 3 }">소화/장</c:when>
                        			<c:when test="${product.cno == 4 }">눈</c:when>
                        			<c:when test="${product.cno == 5 }">모발</c:when>
                        	   </c:choose></label>
                    </td>
                </tr>
                <tr>
                    <td class="title">상품명</td>
                    <td>${product.pname}</td>
                </tr>
                <tr>
                    <td class="title">재고</td>
                    <td>${product.pstock}</td>
                </tr>
                <tr>
                    <td class="title">판매가</td>
                    <td><fmt:formatNumber pattern="###,###,###" value="${product.pprice}" /></td>
                </tr>
                <tr>
                    <td class="title">제품설명</td>
                    <td><textarea name="pinfo" id="" cols="100" rows="10" style="resize: none;" readonly>${product.pinfo }</textarea></td>
                </tr>
                <tr>
                    <td class="title">주의사항</td>
                    <td><textarea name="fprec" id="" cols="100" rows="10" style="resize: none;" readonly>${product.fprec }</textarea></td>
                </tr>
                <tr>
                    <td class="title">이미지</td>
                    <td>
                    	<c:forEach items="${attachList}" var="a" varStatus="vs">
							<img style="width:300px; height:300px;" src="${pageContext.request.contextPath}/resources/productUpload/${a.changename}" alt="" />
						</c:forEach>
					</td>
                </tr>

            </table>
            <div class="buttonRe">
                <button type="submit" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/adminUpdateView.do?pno=${product.pno}'">수정</button>
                <button class="btn btn-default" onclick="productList()">리스트</button>
            </div>

       <!-- </form>  -->

    </div>
    </section>
    <br /><br />
</body>
</html>