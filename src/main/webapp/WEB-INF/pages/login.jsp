<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true"%>

<html>
<head>
    <title>Login page</title>
</head>
<body>

<h1><spring:message code="label.login" /></h1>
    <form action = "<c:url value='/j_spring_security_check' />" method="post">
        <div>
            <input type="text" name="username" placeholder="Enter phone number" />
        </div>
        <div>
            <input type="password" name="password" placeholder="Enter your password" />
        </div>
        <div>
            <input type="submit" value="Log in" />
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <form>
        <div>
            If you haven't any account please <a href="/register">register here</a>.
        </div>
    </form>

</body>
</html>
