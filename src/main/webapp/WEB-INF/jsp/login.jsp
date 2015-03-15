<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="<spring:url value='/resources/signin.css'/>">

<form class="form-signin" role="form" action="<spring:url value="/j_spring_security_check" />" method="POST">
	<h2 class="form-signin-heading">Please sign in</h2>
	<label for="inputEmail" class="sr-only">Email address</label>
	<input type="text" name="j_username" class="form-control" placeholder="Enter your name">
	<label for="inputPassword" class="sr-only">Password </label>
	<input type="password" name="j_password" class="form-control" placeholder="Enter you password">
	<button class="btn btn-lg btn-primary btn-block" type="submit"><span class="glyphicon glyphicon-log-in"></span> Sign in</button>
</form>