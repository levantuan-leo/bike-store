<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Category</b></h2>
                </div>

            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>

                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listsotre}" var="o">
                <tr>

                    <td>${o.id}</td>
                    <td>${o.name}</td>
                    <td>${o.email}</td>
                    <td>${o.address}</td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</div>