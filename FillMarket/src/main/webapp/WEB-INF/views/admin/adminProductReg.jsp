<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
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
    <script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
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
<body >
	<section>
	<div id="product reg">
	<br /><br />
        <h1 id="titleh">상품등록</h1>
        
        <form action="${pageContext.request.contextPath}/admin/productRegEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data"">
            <table id="proReg" class="table table-bordered table-sm">
                <tr>
                    <td class="title">분류</td>
                    <td>
                        <select name="cno" id="">
                            <option value="1">뼈/관절</option>
                            <option value="2">면역력</option>
                            <option value="3">소화/장</option>
                            <option value="4">눈</option>
                            <option value="5">모발</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="title">상품명</td>
                    <td><input type="text" name="pname"></td>
                </tr>
                <tr>
                    <td class="title">재고</td>
                    <td><input type="number" name="pstock"></td>
                </tr>
                <tr>
                    <td class="title">판매가</td>
                    <td><input type="number" name="pprice"></td>
                </tr>
                <tr>
                    <td class="title">제품설명</td>
                    <td><textarea name="pinfo" id="" cols="100" rows="10" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <td class="title">주의사항</td>
                    <td><textarea name="fprec" id="" cols="100" rows="10" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <td class="title">이미지</td>
                    <td><input class="images" name="upFile" type="file"><input class="images" name="upFile" type="file"><input class="images" name="upFile" type="file"></td>
                </tr>

            </table>
            <div class="buttonRe">
                <button type="submit" class="btn btn-success">등록</button>
                <button type="reset" class="btn btn-default">취소</button>
                <button class="btn btn-default">리스트</button>
            </div>

        </form>

    </div>
    </section>
</body>
</html>