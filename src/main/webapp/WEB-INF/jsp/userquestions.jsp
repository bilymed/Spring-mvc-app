<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<table class="table table-hover table-striped">
	<tbody>
		<c:forEach items="${user.questions}" var="question">
			<tr>
				<td><h4>
						<a href="<spring:url value="/userquestiondetail/${question.id}.html"/>"> <c:out value="${question.title}" />
						</a>
					</h4>
					<c:out value="${question.content}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Ask Question</button>

<form:form commandName="question" cssClass="form-horizontal questionForm">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">New Question</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">Title:</label>
						<div class="col-sm-10">
							<form:input path="title" cssClass="form-control" placeholder="Title :" />
							<form:errors path="title" />
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">Content:</label>
						<div class="col-sm-10">
							<form:textarea rows="3" path="content" cssClass="form-control" placeholder="Content :" />
							<form:errors path="content" />
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">Category:</label>
						<div class="col-sm-10">
							<!--<form:select path="category" multiple="false" items="${categories}" itemLabel="name" itemValue="id" />-->
							<select name="catId" class="form-control" style="width: 120px">
								<c:forEach items="${categories}" var="category">
									<option value="${category.id}">${category.name}
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="Post your question" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</form:form>

<script>
	$(document).ready(
			function() {
				$('.nav-tabs a:first').tab('show'); // Select first tab
				$(".questionForm").validate(
						{
							rules : {
								title : {
									required : true,
									minlength : 1
								},
								content : {
									required : true,
									minlength : 10
								}
							},
							highlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-success').addClass('has-error');
							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error').addClass('has-success');
							}
						});
			});
</script>