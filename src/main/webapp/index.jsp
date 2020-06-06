<%@page import="mycart.com.learn.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart home</title>

<%@include file="components/common_css_js.jsp"%>


</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	<h1>Hello</h1>
	<h1>Creating session factory</h1>
	
	<%
		out.println(FactoryProvider.getFactory());
	%>

</body>
</html>