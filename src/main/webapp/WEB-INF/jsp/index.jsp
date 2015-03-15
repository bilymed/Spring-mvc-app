<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div role="tabpanel">

	<ul class="nav nav-tabs" role="tablist">
		<c:forEach items="${categories}" var="category">
			<li data-toggle="tab">
				<a href="#category_${category.id}" data-toggle="tab">${category.name}</a>
			</li>
		</c:forEach>
	</ul>
	<div class="tab-content">
		<c:forEach items="${categories}" var="category">
			<div role="tabpanel" class="tab-pane active" id="category_${category.id}">
				<table class="table table-striped" style="margin-top: 5px">
					<c:forEach items="${category.questions}" var="question">
						<tr>
							<td width="100">
								<h4>${question.user.name}</h4>
							</td>
							<td>
								<h4>
									<a class="questionTitle" href="<spring:url value="/questions/${question.id}.html"/>"> <c:out value="${question.title}" /></a>
								</h4> <!-- <h1>${question.content}</h1> -->
							</td>
						</tr>

					</c:forEach>
				</table>
			</div>
		</c:forEach>
	</div>

</div>

<script>
	$(document).ready(function() {
		$('.nav-tabs a:first').tab('show'); // Select first tab
	});
</script>