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
<title>Save Travels</title>
</head>
<body>
<h1 id="header">Save Travels</h1>
<div id="page-container">
	<div id="table-container">
		<table class="table table-info table-striped table-hover">
			<thead>
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>User Actions</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="travel" items="${travels}">
				<tr>
					<td><a href="/expenses/${travel.id}"><c:out value="${travel.expenseName}" /></a></td>
					<td><c:out value="${travel.vendor}" /></td>
					<td>$<c:out value="${travel.amount}" /></td>
					<td id="user-actions">
						<form action="/expenses/edit/${travel.id}" method="get"> <!-- I know this could've been a simple <a> tag but for the sake of lining things up, I turned it into a form -->
    						<button type="submit" class="btn btn-sm btn-info" id="edit-btn">Edit</button>
						</form> | 
						<form action="/expense/delete/${travel.id}" method="post">
							<input type="hidden" name="_method" value="delete">
							<input type="submit" value="Delete" class="btn btn-sm btn-danger" id="delete-btn">
						</form>
					</td> 
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="form-container">
		<h3>Add an Expense:</h3>
		<form:form action="/expense" method="post" modelAttribute="travel">
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
				<input type="submit" value="Add Expense" class="btn btn-primary"/>
			</div>
		</form:form>
	</div>
	
</div>
	
</body>
</html>