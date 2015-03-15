<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<spring:url value='/resources/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<spring:url value='/resources/style.css'/>">
<script src="<spring:url value='/resources/scripts/jquery-1.11.0.min.js'/>"></script>
<script src="<spring:url value='/resources/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<spring:url value='/resources/scripts/jquery.validate.min.js'/>"></script>
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<spring:url value="/"/>">MicroCMS</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li>
						<a href="<spring:url value="/"/>">Home</a>
					</li>
					<li>
						<security:authorize access="hasRole('ROLE_USER')">
							<a href="<spring:url value="/userquestions.html"/>">My questions</a>
						</security:authorize>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<security:authorize access="! isAuthenticated()">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> Not connected <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="<spring:url value="/login.html"/>">Log in</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="<spring:url value="/signup.html"/>">Sign Up</a>
								</li>
							</ul>
						</li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li>
								<a href="<spring:url value="/users.html"/>">Users</a>
							</li>
						</security:authorize>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> Welcome!<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="<spring:url value="/user.html"/>"> MyAccount</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="<spring:url value="/logout"/>"> Log out</a>
								</li>
							</ul>
						</li>
					</security:authorize>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<tiles:insertAttribute name="body" />
		<div class="center">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>