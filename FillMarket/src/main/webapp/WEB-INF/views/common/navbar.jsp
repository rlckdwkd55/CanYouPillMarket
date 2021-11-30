<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-light border-bottom p-3" aria-label="Sixth navbar example"
        style="background-color: #ffffff;">
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample06"
                aria-controls="navbarsExample06" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample06" style="
    font-weight: 700;
">
                
                <ul class="navbar-nav me-auto mb-2 mb-xl-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle ms-4" href="#" id="dropdown06" data-bs-toggle="dropdown"
                            aria-expanded="false">전체</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown06">
                            
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do?cno=1" >뼈/관절</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do?cno=2" >면역력</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do?cno=3" >소화/장</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do?cno=4" >눈</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/productList.do?cno=5" >모발</a></li>
                        	
                        </ul>
                    </li>
                    <li class="nav-item">
                    	                       
                        <a class="nav-link ms-4 ps-5"  href="${pageContext.request.contextPath}/product/productList.do?cno=1" >뼈/관절</a>
                    	
                    </li>
                    <li class="nav-item">
                        
                        <a class="nav-link ms-4 ps-5" href="${pageContext.request.contextPath}/product/productList.do?cno=2">면역력</a>
                    
                    </li>
                    <li class="nav-item">
                        
                        <a class="nav-link ms-4 ps-5" href="${pageContext.request.contextPath}/product/productList.do?cno=3">소화/장</a>
                    
                    </li>
                    <li class="nav-item">
                        
                        <a class="nav-link ms-4 ps-5" href="${pageContext.request.contextPath}/product/productList.do?cno=4">눈</a>
                    
                    </li>
                    <li class="nav-item">
                        
                        <a class="nav-link ms-4 ps-5" href="${pageContext.request.contextPath}/product/productList.do?cno=5">모발</a>
                    
                    </li>
                </ul>
            </div>
        </div>
    </nav>