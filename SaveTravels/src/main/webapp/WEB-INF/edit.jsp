<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/indexStyle.css">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Save Travels | Edit Expense</title>
</head>
<body>
<div id="page-container">
	<div id="form-container">
		<div id="edit-header">
			<h3>Edit an Expense:</h3>
			<a href="/expenses">Back to Home</a>
		</div>

		<form:form action="/expense/${travel.id}" method="post" modelAttribute="travel">
			<input type="hidden" name="_method" value="put"/>
			<div>
				<form:label path="expenseName">Expense Name:</form:label><br>
				<form:errors path="expenseName" class="error-message"/>
				<form:input type="text" path="expenseName" class="string-input"/>
			</div>
			<div>
				<form:label path="vendor">Vendor:</form:label><br>
				<form:errors path="vendor" class="error-message"/>
				<form:input type="text" path="vendor" class="string-input"/>
			</div>
			<div>
				<form:label path="amount">Amount:</form:label><br>
				<form:errors path="amount" class="error-message"/>
				<form:input type="number" step=".01" path="amount" class="number-input" min="0"/>
			</div>
			<div>
				<form:label path="description">Description:</form:label><br>
				<form:errors path="description" class="error-message"/>
				<form:textarea path="description" class="string-input"/>
			</div>
			<div id="submit-button">
				<input type="submit" value="Update Expense" class="btn btn-primary"/>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>