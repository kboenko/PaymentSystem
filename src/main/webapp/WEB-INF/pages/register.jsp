<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register page</title>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" /> "></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.validate.min.js" /> "></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#newacc").validate({
                rules: {
                    "phone": {
                        required: true,
                        digits: true
                    },
                    "email": {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    "phone": {
                        required: "This field is required!",
                        digits: "Enter correct phone number (i.e. 89123456789 or 266701)!"
                    },
                    "email": {
                        required: "This field is required!",
                        email: "Enter correct email! (i.e. login@server.ru)"
                    }
                }

            });
        });
    </script>
</head>
<body>

<h1><spring:message code="label.create.account" /></h1>
<form:form action = "/createNewAccount" method="post" modelAttribute="account" enctype="multipart/form-data" id="newacc">
    <div>
        <spring:message code="label.enter.phone" />
        <form:input path="phone" name="phone" />
    </div>
    <div>
        <spring:message code="label.enter.email" />
        <form:input path="email" name="email"  />
    </div>
    <div><button type="submit"><spring:message code="button.create.account" /></button></div>
</form:form>
</body>
</html>
