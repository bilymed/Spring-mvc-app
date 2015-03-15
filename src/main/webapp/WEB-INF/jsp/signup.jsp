<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${param.success eq true }">
	<div class="alert alert-success">Sign Up successful!</div>
</c:if>

<div class="well">
	<form:form commandName="user" cssClass="form-horizontal registrationForm">

		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<h2 class="form-signin-heading">Please sign up</h2>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<form:input path="name" cssClass="form-control" placeholder="Enter your name" />
				<form:errors path="name" cssStyle="color:red" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<form:input path="email" cssClass="form-control" placeholder="Enter your Email" />
				<form:errors path="email" cssStyle="color:red" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<form:password path="password" cssClass="form-control" placeholder="Enter your password" />
				<form:errors path="password" cssStyle="color:red" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<input type="password" name="password_again" id="password_again" class="form-control" placeholder="Your password again" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-log-in"></span> Sing Up
				</button>
			</div>
		</div>
	</form:form>
</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(".registrationForm").validate(
						{
					rules : {
						name : {
							required : true,
							minlength : 3,
						},
						email : {
							required : true,
							email : true
						},
						password : {
							required : true,
							minlength : 5
						},
						password_again : {
							required : true,
							minlength : 5,
							equalTo : "#password"
						},
					},
					highlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-success').addClass('has-error');
					},
					unhighlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-error').addClass('has-success');
					},
					messages : {
						name : {
							remote : "Such username already exists!"
						},
					},
				});
			});
</script>
