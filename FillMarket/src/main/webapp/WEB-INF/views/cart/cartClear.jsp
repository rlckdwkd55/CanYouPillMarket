<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.getAttribute("cartList");
session.removeAttribute("cartList");
response.sendRedirect("productList.jsp");
%>