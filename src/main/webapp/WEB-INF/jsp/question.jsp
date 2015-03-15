<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
<hr />
<security:authorize access=" ! isAuthenticated()">
Please <a href="<spring:url value="/login.html"/>"> Log in</a> to add your Answer!
</security:authorize>

<security:authorize access="isAuthenticated()">
<form:form commandName="answer" cssClass="registrationForm">
	<div>
		<form:textarea rows="3" path="content" cssClass="form-control" placeholder="Content :" cssStyle="width:60%;margin-bottom:3px" />
		<form:errors path="content" />
	</div>
	<input type="submit" value="Post your answer" class="btn btn-primary">
</form:form>
</security:authorize>