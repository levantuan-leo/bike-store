<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container">
  <div class="table-wrapper">
    <div class="table-title">
      <div class="row">
        <div class="col-sm-6">
          <h2>Manage <b>Product</b></h2>
        </div>

      </div>
    </div>
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>Name</th>
        <th>Category</th>
        <th>Image</th>
        <th>Price</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listP}" var="o">
        <tr>

          <td>${o.name}</td>
          <td>${o.category.name}</td>
          <td>
            <img style="max-width: 50px" src="${o.picture}">
          </td>
          <td>${o.price} $</td>
          <td>
            <a href="" onclick="window.location.href='${pageContext.request.contextPath}/admin/product/delete?pid=${o.id}'" class="delete" data-toggle="modal"><i
                    class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="clearfix">
      <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
      <ul class="pagination">
        <li class="page-item disabled"><a href="#">Previous</a></li>
        <li class="page-item"><a href="#" class="page-link">1</a></li>
        <li class="page-item"><a href="#" class="page-link">2</a></li>
        <li class="page-item active"><a href="#" class="page-link">3</a></li>
        <li class="page-item"><a href="#" class="page-link">4</a></li>
        <li class="page-item"><a href="#" class="page-link">5</a></li>
        <li class="page-item"><a href="#" class="page-link">Next</a></li>
      </ul>
    </div>
  </div>
  <a href="#">
    <button type="button" class="btn btn-primary">Back to home</button>

  </a>
</div>


