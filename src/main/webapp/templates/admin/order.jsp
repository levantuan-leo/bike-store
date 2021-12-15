<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Order</b></h2>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th style="width: 15%;">Store Name</th>
                <th style="width: 15%;">Customer Name</th>
                <th style="width: 5%;">Status</th>
                <th style="width: 20%;">Order date</th>
                <th style="width: 20%;">Shipped date</th>
                <th style="width: 40%;">Address</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listOrders}" var="o">
                <tr>
                    <td>${o.store.name}</td>
                    <td>${o.customer.name}</td>
                    <td>${o.status}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.shippedDate}</td>
                    <td>${o.customer.address}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a href="<c:url value="/admin/home"/> ">
        <button type="button" class="btn btn-primary">Back to home</button>

    </a>
</div>