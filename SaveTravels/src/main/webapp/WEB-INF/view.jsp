<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/viewOneStyle.css">
<title>Expense | View</title>
</head>
<body>
<div id="page-container">
	<div id="header">
		<h2>Expense Details</h2>
		<a href="/expenses">Back to Home</a>
	</div>
	<div id="expense-info">
		<p>Expense Name: <c:out value="${travel.expenseName}"/></p>
		<p>Expense Description: <c:out value="${travel.description}"/></p>
		<p>Vendor: <c:out value="${travel.vendor}"/></p>
		<p>Amount Spent: $<c:out value="${travel.amount}"/></p>
	</div>
</div>
</body>
</html>