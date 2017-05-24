<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="my.learning.payment.system.dao.PaymentRepository" %>
<%@ page import="my.learning.payment.system.domain.Payment" %>
<%@ page import="my.learning.payment.system.dao.AccountRepository" %>
<%@ page import="my.learning.payment.system.domain.Account" %>
<%@ page import="my.learning.payment.system.dao.ServiceRepository" %>
<%@ page import="my.learning.payment.system.domain.Services" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Личный кабинет</title>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font-awesome.min.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/ng-table.min.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>">
  <script type="text/javascript" src="<c:url value="/resources/js/angular.min.js" /> "></script>
  <script type="text/javascript" src="<c:url value="/resources/js/angular-resource.js" />"></script>
  <script type="text/javascript" src="<c:url value="/resources/js/ng-table.min.js" /> "></script>
  <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" /> "></script>
  <script type="text/javascript" src="<c:url value="/resources/js/ui-bootstrap-tpls-0.12.0.min.js" /> "></script>
</head>


<body ng-app="main">

FUCK!
<%--<% WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application); %>
<% PaymentRepository paymentRepository = context.getBean(PaymentRepository.class); %>
<% for (Payment item : paymentRepository.findBySum(60)) { %>
<p> <%= item.getAccountNumber() %> </p>
<%}%>--%>

<div ng-controller="tableCtrl">

  <table ng-table="tableParams" class="table table-striped">
    <tr ng-repeat="itm in data">
      <td data-title="'Phone'">
        <div class="newsDate">{{itm.account.phone}}</div>
      </td>
      <td data-title="'Service'">
        <div class="head">{{itm.service.title}}</div>
      </td>
      <td data-title="'Date'">
        <div class="head">{{itm.paymentDate}}</div>
      </td>
      <td data-title="'Payment sum'">
        <div class="body">{{itm.sum}}</div>
      </td>
    </tr>
  </table>

</div>


<script>
var app = angular.module('main', ["ngTable"]);

  app.controller("tableCtrl", function ($scope, $http, $filter, ngTableParams) {
    $scope.tableParams = new ngTableParams(
            {
              page: 1,
              count: 10
            }, {
              total: 1,
              getData: function ($defer, params) {
                $http.get('http://localhost:8085/list').then(function (response) {
                  $scope.data = response.data.slice((params.page() - 1) * params.count(), params.page() * params.count());
                  $defer.resolve($scope.data)
                });
              }
            }
    );

  })
</script>

</body>
</html>