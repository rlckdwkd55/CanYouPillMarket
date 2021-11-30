<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<c:import url="../common/adminSide.jsp" />
<style>
	.table{
		text-align: center;
		border-bottom : 1px solid rgba(0, 0, 0, 0.35);
	}
</style>
</head>
<body>
            <div class="col-md-10" style="margin-left:250px;">
            	<br />
                <header>
                    <h1> 문의</h1>
                </header>
                <br />
                <br />
                <br />
                <br />
                
                <section id="container">
                    
                        <table class="table table-hover">
                            <thead>
                                <tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>답변</th></tr>
                            </thead>
                            
                            <c:forEach items="${list}" var = "q">
                                <tr onclick="adminQnAView(${q.qano});">
                                    <td>${q.qano }</td>
                                    <td>${q.qatitle }</td>
                                    <td>${q.qauserid }</td>
                                    <td>${q.qauploaddate }</td>
                                    <td>
                                    	<c:choose>
                        					<c:when test="${q.rcontent eq null }">N</c:when>
                        					<c:otherwise> Y </c:otherwise>                
                        	   			</c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        
                        </table>
                        
                        <div class="search row">
                            <div class="col-xs-2 col-sm-2">
                                <select name="searchType" class="form-control" style="visibility: hidden;">
                                    <option value=""/>>-----</option>
                                    <option value=""/>>제목</option>
                                    <option value=""/>>내용</option>
                                    <option value=""/>>작성자</option>
                                    <option value=""/>>제목+내용</option>
                                </select>
                            </div>
                             
                            <div class="col-xs-10 col-sm-10">
                                <div class="input-group">
                                    <input type="text" name="keyword" id="keywordInput" value="" class="form-control" style="visibility: hidden;"/>
                                    <span class="input-group-btn">
                                        <button id="searchBtn" type="button" class="btn btn-default" style="visibility: hidden;">검색</button> 	
                                    </span>
                                </div>
                            </div>
                             
                             
                             
                            <script>
                                 $(function(){
                                     $('#searchBtn').click(function() {
                                         self.location = "list" + '' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                                     });
                                 });
                                 
                                 function adminQnAView(qano){

                                	 location.href = "${pageContext.request.contextPath}/admin/QnAView.do?qano="+qano;
                                	 	
                                 }
                                 
                            </script>
                        </div>

                    
                </section>
            </div>
            <c:out value="${pageBar}" escapeXml="false"/>
        </body>
</html>