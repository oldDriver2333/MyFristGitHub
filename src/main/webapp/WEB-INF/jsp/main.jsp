<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	Main<br>
	
	<div>username : <sec:authentication property="name"/></div>

	<br>
	<a href="${pageContext.request.contextPath}/j_spring_security_logout">退出</a>
</body>
</html>