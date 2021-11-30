<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Start id tz header-->
<header id="tz-header" class="bk-white" style="border-bottom: 1px solid #f4433b;">
    <div class="container">

        <!--Start class header top-->
        <div class="header-top">
            <ul class="pull-left">
                <li>
                    <a href="#">
                        <b>Seller Channel</b>
                        <span class="tz-down"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        English
                        <span class="fa fa-angle-down tz-down"></span>
                    </a>
                </li>
                <li>
                    <a href="tel:01234567890">Call us: (012) 3456 7890</a>
                </li>
            </ul>
            <ul class="pull-right">
                <li>
                    <a href="#">
                        Notification
                        <span class="fa fa-bell-o tz-down"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        Contact
                        <span class="fa fa-question-circle tz-down"></span>
                    </a>
                </li>
                <li class="tz-header-login">
                    <a href="#">Login</a>
                    <div class="tz-login-form">
                        <form id="login-form">
                            <p class="form-content">
                                <label for="username">Username / Email</label>
                                <input type="text" name="username" id="username" value="">
                            </p>
                            <p class="form-content">
                                <label for="password">Password</label>
                                <input type="password" name="username" id="password" value="">
                            </p>
                            <p class="form-footer">
                                <a href="#">Lost Password?</a>
                                <button type="submit" class="pull-right button_class">LOGIN</button>
                            </p>
                            <p class="form-text">
                                Don't have an accountEntity? <a href="<c:url value = "/register"/>">Register Here</a>
                            </p>
                        </form>
                    </div>
                </li>
            </ul>
        </div>
        <!--End class header top-->

        <!--Start header content-->
        <div class="header-content">
            <h3 class="tz-logo pull-left"><a href="<c:url value = "/home"/>"><img src="<c:url value="/static/images/logo.png" />"
                                                               alt="home"/></a></h3>
            <div class="tz-search pull-right">

                <!--Start form search-->
                <form>
                    <label for="tz-query"></label>
                    <input type="text" class="tz-query" id="tz-query" value="" placeholder="Search for product">
                    <button type="submit"></button>
                </form>
                <!--End Form search-->

                <!--live search-->
                <div class="live-search">
                    <ul>
                        <li>
                            <div class="live-img"><img
                                    src="<c:url value="/static/images/product/product-search1.jpg" />"
                                    alt="product search one"></div>
                            <div class="live-search-content">
                                <h6><a href="<c:url value = "/product-single"/>">Defy Advanced</a></h6>
                                <span class="live-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="product-color">
                                                <i class="light-blue"></i>
                                                <i class="orange"></i>
                                                <i class="orange-dark"></i>
                                            </span>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="live-img"><img
                                    src="<c:url value="/static/images/product/product-search2.jpg" />"
                                    alt="product search two"></div>
                            <div class="live-search-content">
                                <h6><a href="<c:url value = "/product-single"/>">Defy Advanced</a></h6>
                                <span class="live-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="product-color">
                                                <i class="light-blue"></i>
                                                <i class="orange"></i>
                                                <i class="blueviolet"></i>
                                                <i class="orange-dark"></i>
                                            </span>
                                        </span>
                            </div>
                        </li>
                        <li>
                            <div class="live-img"><img
                                    src="<c:url value="/static/images/product/product-search3.jpg"/>"
                                    alt="product search one"></div>
                            <div class="live-search-content">
                                <h6><a href="<c:url value = "/product-single"/>">Defy Advanced</a></h6>
                                <span class="live-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="product-color">
                                                <i class="blueviolet"></i>
                                                <i class="light-blue"></i>
                                                <i class="orange-dark"></i>
                                                <i class="orange"></i>
                                            </span>
                                        </span>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--End live search-->
            </div>
        </div>
        <!--End class header content-->
    </div>

    <!--Start main menu -->
    <nav class="tz-menu-primary">
        <div class="container">

            <!--Main Menu-->
            <ul class="tz-main-menu pull-left nav-collapse">
                <li>
                    <a href="<c:url value = "/home"/>">
                        Home
                    </a>
                </li>
                <li>
                    <a href="<c:url value = "/product"/>" >Category</a>
                    <ul class="sub-menu">
                        <c:forEach items="${listCategories}" var="category">
                            <li>
                                <a href="<c:url value = "/product?category=${category.id}"/>">${category.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                <li>
                    <a href="<c:url value = "/product"/>">
                        Bikes
                        <span class="red-light">On sale!</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value = "/product"/>">
                        Gear
                    </a>
                </li>
            </ul>
            <!--End Main menu-->

            <c:set var="quantity" value="${0}" />
            <c:set var="amount" value="${0}" />
            <c:forEach items="${sessionScope.cart}" var="item">
                <c:set var="quantity" value="${quantity + item.value.quantity}" />
                <c:set var="amount" value="${amount + item.value.product.price}" />
            </c:forEach>

            <!--Shop meta-->
            <ul class="tz-ecommerce-meta pull-right">
                <li class="tz-mini-cart">
                    <a href="<c:url value = "/cart"/>"><strong>${quantity}</strong>Cart</a>

                    <!--Mini cart-->
                    <ul class="cart-inner">
                        <li class="mini-cart-content">
                            <div class="mini-cart-img"><img
                                    src="<c:url value="/static/images/product/product-cart1.png" />"
                                    alt="product search one"></div>
                            <div class="mini-cart-ds">
                                <h6><a href="<c:url value = "/product-single"/>">Liv Race Day Short</a></h6>
                                <span class="mini-cart-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="mini-meta">
                                               <span class="mini-color">Color: <i class="orange"></i></span>
                                               <span class="mini-qty">Qty: 5</span>
                                            </span>
                                        </span>
                            </div>
                            <span class="mini-cart-delete"><img src="<c:url value="/static/images/delete.png" />"
                                                                alt="delete"></span>
                        </li>
                        <li class="mini-cart-content">
                            <div class="mini-cart-img"><img
                                    src="<c:url value="/static/images/product/product-cart2.png" />"
                                    alt="product search one"></div>
                            <div class="mini-cart-ds">
                                <h6><a href="<c:url value = "/product-single"/>">City Pedals Sport</a></h6>
                                <span class="mini-cart-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="mini-meta">
                                               <span class="mini-color">Color: <i class="orange"></i></span>
                                               <span class="mini-qty">Qty: 5</span>
                                            </span>
                                        </span>
                            </div>
                            <span class="mini-cart-delete"><img src="<c:url value="/static/images/delete.png" />"
                                                                alt="delete"></span>
                        </li>
                        <li class="mini-cart-content">
                            <div class="mini-cart-img"><img
                                    src="<c:url value="/static/images/product/product-cart3.png" />"
                                    alt="product search one"></div>
                            <div class="mini-cart-ds">
                                <h6><a href="<c:url value = "/product-single"/>">Gloss</a></h6>
                                <span class="mini-cart-meta">
                                            <a href="<c:url value = "/product-single"/>">$2650.00</a>
                                            <span class="mini-meta">
                                               <span class="mini-color">Color: <i class="orange"></i></span>
                                               <span class="mini-qty">Qty: 5</span>
                                            </span>
                                        </span>
                            </div>
                            <span class="mini-cart-delete"><img src="<c:url value="/static/images/delete.png" />"
                                                                alt="delete"></span>
                        </li>
                        <li class="mini-subtotal">
                                    <span class="subtotal-content">
                                        Subtotal:
                                        <strong class="pull-right">$${amount == 0?0.00:amount}</strong>
                                    </span>
                        </li>
                        <li class="mini-footer">
                            <a href="<c:url value = "/cart"/>" class="view-cart">View Cart</a>
                            <a href="<c:url value = "/checkout"/>" class="check-out">Checkout</a>
                        </li>
                    </ul>
                    <!--End mini cart-->

                </li>
            </ul>
            <!--End Shop meta-->

            <!--navigation mobi-->
            <button data-target=".nav-collapse" class="btn-navbar tz_icon_menu" type="button">
                <i class="fa fa-bars"></i>
            </button>
            <!--End navigation mobi-->
        </div>
    </nav>
    <!--End stat main menu-->

</header>
<!--End id tz header-->