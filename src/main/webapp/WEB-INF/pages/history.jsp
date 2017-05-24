<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment history</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.min.js" /> "></script>
    <script type="text/javascript" src="<c:url value="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" /> "></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#paymentHistory').DataTable();
        });
    </script>
</head>
<body>
<h1><spring:message code="label.payment.history" /></h1>
<c:if test="${not empty payments}">
    <table id="paymentHistory" class="tablesorter">
        <thead>
        <tr>
            <td><spring:message code="table.header.service.title" /></td>
            <td><spring:message code="table.header.payment.date" /></td>
            <td><spring:message code="table.header.sum" /></td>
        </tr>
        </thead>
        <c:forEach items="${payments}" var="item">
            <tr>
                <td>${item.service.title}</td>
                <td>${item.paymentDate}</td>
                <td>${item.sum}</td>
            </tr>
    </c:forEach>
    </table>
</c:if>

<form:form action="/back" method="get">
    <button type="submit"><spring:message code="button.back" /></button>
</form:form>

</body>
</html>
