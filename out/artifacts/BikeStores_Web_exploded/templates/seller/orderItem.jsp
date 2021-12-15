<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card card-default">
    <div class="card-header justify-content-between mb-4">
        <h2>Order Items</h2>
    </div>
    <c:forEach items="${listitem}" var="o">
        <div class="media d-flex mb-5">
            <div class="media-image align-self-center mr-3 rounded">
                <a href="#"><img src="${o.product.picture}" alt=" image" style="max-width: 180px "></a>
            </div>
            <div class="media-body align-self-center">
                <a href="#"><h6 class="mb-3 text-dark font-weight-medium">${o.product.name}</h6></a>
                <div class="float-md-right">
                </div>
                <p class="d-none d-md-block" style="margin-bottom: 16px ">Quantity: ${o.quantity}</p>
                <p class="mb-0">
                    <span class="d-none d-md-block text-dark" style="margin-left: 0px">$${o.unitPrice}</span>
                </p>
            </div>
        </div>
    </c:forEach>
    <button type="button" class="btn btn-success" style="margin: 3px 400px"
            onclick="window.location.href='${pageContext.request.contextPath}/seller/order/update?oid=${order.id}&status=1'">
        Confirm
    </button>
    <button type="button" class="btn btn-danger" style="margin: 3px 400px"
            onclick="window.location.href='${pageContext.request.contextPath}/seller/order/update?oid=${order.id}&status=3'">
        Cancel
    </button>
</div>

