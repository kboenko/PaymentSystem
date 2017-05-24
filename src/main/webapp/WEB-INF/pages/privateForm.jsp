<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Payment page</title>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" /> "></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.validate.min.js" /> "></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#sendPayment").validate({
                rules: {
                    "sum": {
                        required: true,
                        digits: true
                    },
                    "serviceId": {
                        required: true
                    }
                },
                messages: {
                    "sum": {
                        required: "Enter payment sum!",
                        digits: "Enter correct sum (only digits!)"
                    },
                    "serviceId": {
                        required: "Choose service for payment!"
                    }
                }

            });
        });
    </script>

</head>
<body>
<c:if test="${not empty loggedUser}">
    <p>Your balance: <c:out value="${loggedUser.balance}"/></p>

    <form:form action="pay" method="post" modelAttribute="payment" enctype="multipart/form-data" name="signup" id="sendPayment">
        <form:hidden path="accountId" value="${loggedUser.id}" />
        <div>
            <c:if test="${not empty services}">
                <form:select path="serviceId" size="1" id="srvs" class="required">
                    <form:option value=""><spring:message code="label.service.choose" /></form:option>
                    <c:forEach items="${services}" var="si">
                        <form:option value="${si.id}">${si.title} (min payment: ${si.minPayment}, max payment: ${si.maxPayment})</form:option>
                    </c:forEach>
                </form:select>
            </c:if>
        </div>
        <div>
        <form:label path="sum">
            <spring:message code="label.enter.sum" />*
        </form:label>
        <form:input path="sum" />
                    </div>
        <div><button type="submit"><spring:message code="button.payment.submit" /></button></div>
    </form:form>

    <form:form action="listForUser/${loggedUser.id}" method="post">
        <button type="submit"><spring:message code="button.payment.history" /></button>
    </form:form>

</c:if>

</body>
</html>
