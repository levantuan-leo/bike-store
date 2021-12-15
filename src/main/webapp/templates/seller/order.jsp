<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-12">
        <!-- Recent Order Table -->
        <div class="card card-table-border-none" id="pending-orders">
            <div class="card-header justify-content-between">
                <h2>Pending Orders</h2>
                <div class="date-range-report ">
                    <span></span>
                </div>
            </div>
            <div class="card-body pt-0 pb-5">
                <table class="table card-table table-responsive table-responsive-large" style="width:100%">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th class="d-none d-md-table-cell">Order Date</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Order0}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>
                                <a class="text-dark" href="<c:url value="/seller/order/item?oid=${o.id}"/> ">${o.customer.name}</a>
                            </td>
                            <td class="d-none d-md-table-cell">${o.orderDate}</td>
                            <td>
                                <button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath}/seller/order/update?oid=${o.id}&status=1'" >Confirm</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.href='${pageContext.request.contextPath}/seller/order/update?oid=${o.id}&status=3'">Cancel</button>
                            </td>



                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <!-- Recent Order Table -->
        <div class="card card-table-border-none" id="processing-orders">
            <div class="card-header justify-content-between">
                <h2>Processing Orders</h2>
                <div class="date-range-report ">
                    <span></span>
                </div>
            </div>
            <div class="card-body pt-0 pb-5">
                <table class="table card-table table-responsive table-responsive-large" style="width:100%">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th class="d-none d-md-table-cell">Order Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Order1}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>
                                <a class="text-dark" href="<c:url value="/seller/order/item?oid=${o.id}"/> ">${o.customer.name}</a>
                            </td>
                            <td class="d-none d-md-table-cell">${o.orderDate}</td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <!-- Recent Order Table -->
        <div class="card card-table-border-none" id="completed-orders">
            <div class="card-header justify-content-between">
                <h2>Completed Orders</h2>
                <div class="date-range-report ">
                    <span></span>
                </div>
            </div>
            <div class="card-body pt-0 pb-5">
                <table class="table card-table table-responsive table-responsive-large" style="width:100%">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th class="d-none d-md-table-cell">Order Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Order2}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>
                                <a class="text-dark" href="">${o.customer.name}</a>
                            </td>
                            <td class="d-none d-md-table-cell">${o.orderDate}</td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <!-- Recent Order Table -->
        <div class="card card-table-border-none" id="Canceled-orders">
            <div class="card-header justify-content-between">
                <h2>Canceled Orders</h2>
                <div class="date-range-report ">
                    <span></span>
                </div>
            </div>
            <div class="card-body pt-0 pb-5">
                <table class="table card-table table-responsive table-responsive-large" style="width:100%">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th class="d-none d-md-table-cell">Order Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${Order3}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>
                                <a class="text-dark" href="">${o.customer.name}</a>
                            </td>
                            <td class="d-none d-md-table-cell">${o.orderDate}</td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
