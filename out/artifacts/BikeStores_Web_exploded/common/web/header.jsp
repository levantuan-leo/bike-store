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
                    <a href="<c:url value="/contact"/> ">
                        Contact
                        <span class="fa fa-question-circle tz-down"></span>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.account == null}">
                        <li class="tz-header-login">
                            <a href="#">Login</a>
                            <div class="tz-login-form">
                                <form id="login-form">
                                    <p class="form-content">
                                        <label for="email">Username / Email</label>
                                        <input type="text" name="email" id="email" value="" required>
                                    </p>
                                    <p class="form-content">
                                        <label for="password">Password</label>
                                        <input type="password" name="password" id="password" value="" required>
                                    </p>
                                    <p class="form-footer">
                                        <a href="#">Lost Password?</a>
                                        <button type="submit" class="pull-right button_class">LOGIN</button>
                                    </p>
                                    <p class="form-text">
                                        Don't have an account? <a href="<c:url value = "/register"/>">Register
                                        Here</a>
                                    </p>
                                </form>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#">${sessionScope.account.customer.name}
                                <span class="fa fa-user tz-down"></span>
                                <ul class="sub-menu" style="width: 140px;">
                                    <c:if test="${sessionScope.account.role == 2}">
                                        <li><a href="<c:url value="/admin/home"/>" style="border: none">ADMIN</a></li>
                                    </c:if>
                                    <li><a href="<c:url value="/account/profile"/>" style="border: none">My profile</a></li>
                                    <li><a href="<c:url value="/purchase"/>" style="border: none">Purchase order</a></li>
                                    <li><a href="<c:url value="/api/login-logout"/>" style="border: none">Logout →</a></li>
                                </ul>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <!--End class header top-->

        <!--Start header content-->
        <div class="header-content">
            <h3 class="tz-logo pull-left"><a href="<c:url value = "/home"/>"><img
                    src="<c:url value="/static/images/logo.png" />"
                    alt="home"/></a></h3>
            <div class="tz-search pull-right">

                <!--Start form search-->
                <form id="search-form">
                    <label for="tz-query"></label>
                    <input type="text"
                           class="tz-query"
                           id="tz-query" value="${keyword}"
                           placeholder="Search for product"
                           onblur="outSearch()"
                           onfocus="inSearch()"
                           onkeyup="search(this)"
                    >
                    <button type="submit"></button>
                </form>
                <!--End Form search-->

                <!--live search-->
                <div class="live-search">
                    <ul></ul>
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
                    <a href="<c:url value = "/product"/>">Category</a>
                    <ul class="sub-menu">
                        <c:forEach items="${listCategories}" var="category">
                            <li>
                                <a href="<c:url value = "/product?categoryId=${category.id}"/>">${category.name}</a>
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

            <c:set var="quantity" value="${0}"/>
            <c:set var="amount" value="${0}"/>
            <c:forEach items="${sessionScope.cart}" var="item">
                <c:set var="quantity" value="${quantity + item.value.quantity}"/>
                <c:set var="amount" value="${amount + item.value.product.price}"/>
            </c:forEach>

            <!--Shop meta-->
            <ul class="tz-ecommerce-meta pull-right">
                <li class="tz-mini-cart">
                    <a href="${sessionScope.account != null ? '/cart': 'javascript:alert(\'you need to login\');'}">
                        <strong>${quantity}</strong>Cart
                    </a>

                    <!--Mini cart-->
                    <ul class="cart-inner">
                        <c:forEach items="${cart}" var="item">
                        <li class="mini-cart-content">
                            <div class="mini-cart-img"><img
                                    src="${item.value.product.picture}"
                                    alt="product search one"></div>
                            <div class="mini-cart-ds">
                                <h6><a href="<c:url value = "/product-single?productId=${item.key}"/>">${item.value.product.name}</a></h6>
                                <span class="mini-cart-meta">
                                    <a href="javascript:void(0);">$${item.value.product.price}</a>
                                </span>
                            </div>
                        </li>
                        </c:forEach>
                        <li class="mini-subtotal">
                                    <span class="subtotal-content">
                                        Subtotal:
                                        <strong class="pull-right">$${amount == 0?0.00:amount}</strong>
                                    </span>
                        </li>
                        <li class="mini-footer">
                            <a href="${sessionScope.account != null ? '/cart': 'javascript:alert(\'you need to login\');'}" class="view-cart">View Cart</a>
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
<script>
    var $searchForm = jQuery('#search-form')
    $searchForm.submit(function () {
        var kw = jQuery('#search-form input').val()
        if(kw !== "") {
            window.location.href = window.location.protocol + '//' + window.location.host + '/product?keyword=' + kw
        }

        return false
    })
</script>