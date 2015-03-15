<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="float: right;">Remove</button>

<h3>${question.title}</h3>

<p>${question.content}</p>
<hr />

<table class="table table-bordered table-striped">
	<c:forEach items="${question.answers}" var="answer">
		<tr>
			<td><c:out value="${answer.user.name}" /></td>
			<td><c:out value="${answer.content}" /></td>
		</tr>
	</c:forEach>
</table>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Modal title</h4>
			</div>
			<div class="modal-body">
				<h4>Are you sure ?</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<a href="<spring:url value="/question/remove/${question.id}.html"/>" class="btn btn-danger" >Remove</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->