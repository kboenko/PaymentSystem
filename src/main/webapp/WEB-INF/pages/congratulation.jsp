<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Congrats!</title>
</head>
<body>

<c:if test="${not empty newAccount}">
    <h1><spring:message code="label.congratulation" /></h1>
    <div><spring:message code="label.new.login" /><c:out value="${newAccount.phone}"/></div><br>
    <div><spring:message code="label.new.password" /><c:out value="${newAccount.password}"/></div><br>
    <div><spring:message code="label.caution" /></div>
</c:if>

<form action="back" method="get">
    <input type="submit" value = "Back to login page">
</form>
</body>
</html>
