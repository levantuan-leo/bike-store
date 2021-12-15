<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>document.title = "BikeStores - Your Purchase"</script>

<div class="tz-site">
    <!--Start Blog-->
    <div class="blog">
        <div class="container">
            <ul class="tz-breadcrumbs">
                <li>
                    <a href="#">Home</a>
                </li>
                <li class="current">
                    Profile
                </li>
            </ul>
            <div class="blog-container">
                <div class="row">
                    <div class="col-md-4">

                        <!--Blog Sidebar-->
                        <div class="blog-sidebar" style="height: 519px;">
                            <aside class="contact-info widget no-border">
                                <div style="
                                display: flex;
                                justify-content: start;
                                align-items: center;
                                padding-bottom: 15px;
                                border-bottom: 1px solid #dbdbdb;">
                                    <img style="max-width: 60px;border-radius: 50%;"
                                         src="<c:url value="/static/images/avatar.gif"/>" alt="">
                                    <div style=" margin-left: 15px;">
                                        <p style="padding: unset;font-weight: 600;">${sessionScope.account.customer.name}</p>
                                        <span><span style="color: #f44336;"><i class="fa fa-eye"></i></span> Watch Orders</span>
                                    </div>
                                </div>
                                <ul>
                                    <li>
                                        <a href="<c:url value="/account/profile"/> ">
                                            <i class="fa fa-user"></i>
                                            My Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="/purchase"/> " class="active">
                                            <i class="fa fa-clipboard"></i>
                                            My Order
                                        </a>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                        <!--End Blog Sidebar-->
                    </div>
                    <div class="col-md-8 tz-blog-content">
                        <div class="tz-tabs-header" style="border-bottom: 2px solid #212121;">
                            <h1 class="large-ttle" style="display: inline-block;border: none;">Orders</h1>
                            <ul class="nav nav-tabs pull-right tz-nav-tabs">
                                <li role="presentation" class="active"><a href="#all" data-toggle="tab"
                                                                          aria-expanded="false">All <i
                                        class="fa fa-circle"></i></a></li>
                                <li role="presentation" class=""><a href="#pending" data-toggle="tab"
                                                                    aria-expanded="false">Pending <i
                                        class="fa fa-circle"></i></a></li>
                                <li role="presentation" class=""><a href="#processing" data-toggle="tab"
                                                                    aria-expanded="false">Processing <i
                                        class="fa fa-circle"></i></a></li>
                                <li role="presentation" class=""><a href="#completed" data-toggle="tab"
                                                                    aria-expanded="true">Completed <i
                                        class="fa fa-circle"></i></a></li>
                                <li role="presentation" class=""><a href="#canceled" data-toggle="tab"
                                                                    aria-expanded="false">Canceled</a></li>
                            </ul>
                        </div>
                        <div class="tab-content" style="padding: 0 0 29px;height: 497px;overflow: auto;">
                            <div class="tab-pane active" id="all">
                                <c:choose>
                                <c:when test="${orderItems != null}">
                                    <form>
                                        <table class="shop_table cart">
                                            <!--Table header-->
                                            <thead>
                                            <tr>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">&nbsp;</th>
                                                <th class="product-price">&nbsp;</th>
                                                <th class="product-price">&nbsp;</th>
                                            </tr>
                                            </thead>
                                            <!--End table header-->

                                            <!--Table body-->
                                            <tbody>
                                            <c:forEach var="item" items="${orderItems}">
                                                <tr class="cart_item">
                                                    <td class="product-thumbnail">
                                                        <a href="single-product.html">
                                                            <img src="${item.getProduct().getPicture()}" alt="cart"/>
                                                        </a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="single-product.html">${item.getProduct().getName()}</a>
                                                        <span class="color">x${item.getQuantity()}</span>
                                                    </td>
                                                    <td class="product-price">
                                                        <span class="amount">$${item.getProduct().getPrice()}</span>
                                                    </td>
                                                    <c:set var="status" value="${item.getOrder().getStatus()}"/>
                                                    <td class="product-remove">
                                                            ${status == 0 ? "Pending" : (status == 1 ? "Processing" :(status == 2?"Completed":"Canceled"))}
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <!--End table body-->
                                        </table>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                <div style="width: 100%;height: 468px;display: flex;align-items: center;justify-content: center;">
                                    <img src="<c:url value="/static/images/no-product.png"/> " alt="no-product"/>
                                    </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="tab-pane" id="pending">
                                    <div style="width: 100%;height: 468px;display: flex;align-items: center;justify-content: center;">
                                        <img src="<c:url value="/static/images/no-product.png"/> " alt="no-product"/>
                                    </div>
                                </div>
                                <div class="tab-pane" id="processing">2</div>
                                <div class="tab-pane" id="completed">3</div>
                                <div class="tab-pane" id="canceled">4</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Start Blog-->

    </div>
