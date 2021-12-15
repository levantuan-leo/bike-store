<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-xl-712">
  <!-- Top Products -->
  <div class="card card-default" >
    <div class="card-header justify-content-between mb-4">
      <h2>Top Products</h2>
      <div>
        <button class="text-black-50 mr-2 font-size-20"> <a href="#addEmployeeModal" data-toggle="modal"><button type="button" class="btn btn-success" >Add</button></a></button>
        <div class="dropdown show d-inline-block widget-dropdown">
          <a class="dropdown-toggle icon-burger-mini" href="#" role="button" id="dropdown-product" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
          </a>
          <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdown-product">
            <li class="dropdown-item"><a  href="#">Update Data</a></li>
            <li class="dropdown-item"><a  href="#">Detailed Log</a></li>
            <li class="dropdown-item"><a  href="#">Statistics</a></li>
            <li class="dropdown-item"><a  href="#">Clear Data</a></li>
          </ul>
        </div>
      </div>

    </div>

      <c:forEach items="${listPS}" var="o">
      <div class="media d-flex mb-5">
        <div class="media-image align-self-center mr-3 rounded">
          <a href="#"><img src="${o.product.picture}" alt=" image" style="max-width: 180px "></a>
        </div>
        <div class="media-body align-self-center">
          <a href="#"><h6 class="mb-3 text-dark font-weight-medium"> ${o.product.name}</h6></a>
          <div class="float-md-right">
            <button type="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/seller/product/load?pid=${o.product.id}'" >Edit</button>
            <button type="button" class="btn btn-danger" onclick="deleteProduct(${o.product.id})">Delete</button>
          </div>
          <p class="d-none d-md-block">${o.product.category.name}</p>
          <p class="mb-0">

            <span class="text-dark ml-3">$${o.product.price}</span>
          </p>
        </div>
      </div>
      </c:forEach>
  </div>
  <div class="center" >
    <div class="pagination">
      <a href="#">&laquo;</a>
      <c:forEach begin="1" end="${endP}" var="i">
        <a id="active" href="${pageContext.request.contextPath}/seller/product?index=${i}">${i}</a>
      </c:forEach>
      <a href="#">&raquo;</a>
    </div>
  </div>
</div>
<div id="addEmployeeModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="addProductForm" method="post">
        <div class="modal-header">
          <h4 class="modal-title">Add Product</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Name</label>
            <input name="name" type="text" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Image</label>
            <input name="picture" type="text" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Price</label>
            <input name="price" type="text" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Category</label>
            <select name="categoryId" class="form-select" aria-label="Default select example">
              <c:forEach items="${listCC}" var="o">
                <option value="${o.id}">${o.name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label>Quantity</label>
            <input name="quantity" type="text" class="form-control" required>
          </div>

        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          <input type="submit" class="btn btn-success" value="Add">
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  function clickActive (){
    document.getElementById("active").className="active"
  }
</script>


