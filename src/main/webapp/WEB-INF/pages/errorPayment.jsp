<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ERROR</title>
</head>
<body>
<h1><spring:message code="error.payment.head" /></h1>
<div><spring:message code="error.payment.message" /></div>

<form action="back" method="get">
    <input type="submit" value = "Back to payment page">
</form>
</body>
</html>
