<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
	<div class="col-md-10" style="margin-left:250px;">
		<table class="table table-hover" style="margin-bottom: 0px;">
			<tr>
				<td style="width :100px">작성일자 : </td>
				<td>${reply.rdate }</td>
			</tr>
			<tr>
				<td>댓글내용 : </td>
				<td>${reply.rcontent }</td>
			</tr>
		</table>
	</div>
