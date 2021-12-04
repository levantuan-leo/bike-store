<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="<c:url value="/home"/>">BikeStores</a>
  <ul class="navbar-nav">

    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/home"/> ">Admin</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/product/list"/>">Products</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/customer/list"/>">Customers</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/order/list"/>">Orders</a>
    </li>
  </ul>
</nav>
