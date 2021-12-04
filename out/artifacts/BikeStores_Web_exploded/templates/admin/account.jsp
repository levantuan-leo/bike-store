<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Customer</b></h2>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                </th>
                <th style="width:20%">Name</th>
                <th style="width:15%">phone</th>
                <th style="width:25%">Email</th>
                <th style="width:40%">Address</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listA}" var="o">
                <tr>
                    <td>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                            <label for="checkbox1"></label>
                            </span>
                    </td>
                    <td>${o.name}</td>
                    <td>${o.phone}</td>
                    <td>${o.email}</td>
                    <td>${o.address}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a href="#">
        <button type="button" class="btn btn-primary">Back to home</button>
    </a>
</div>
