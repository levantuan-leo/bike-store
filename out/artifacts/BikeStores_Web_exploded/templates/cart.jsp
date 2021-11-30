<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="shop-checkout">
    <div class="container">
        <!-- Start Breadcrumbs -->
        <ul class="tz-breadcrumbs">
            <li>
                <a href="#">Home</a>
            </li>
            <li class="current">
                Shop Cart
            </li>
        </ul>
        <!-- End Breadcrumbs -->
        <h1 class="page-title">Shop Cart</h1>

        <!-- Start form table -->
        <form>
            <table class="shop_table cart">
                <!--Table header-->
                <thead>
                <tr>
                    <th class="product-remove">&nbsp;</th>
                    <th class="product-thumbnail">Product</th>
                    <th class="product-name">&nbsp;</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-subtotal">Total</th>
                </tr>
                </thead>
                <!--End table header-->

                <!--Table body-->
                <tbody>

                <c:set var="cart" value="${sessionScope.cart}"/>
                <c:set var="totalAmount" value="${0}"/>
                <c:choose>
                    <c:when test="${cart == null}">
                        <tr>
                            <td colspan="4">- Cart is currently empty -</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${cart}" var="item">
                            <tr class="cart_item" id="cart-item${item.key}">
                                <td class="product-remove">
                                    <a href="javascript:void(0);"
                                       class="remove"
                                       title="Remove this item"
                                       onclick="deleteCartItem(${item.key})"
                                    ></a>
                                </td>
                                <td class="product-thumbnail">
                                    <a href="<c:url value="/product-single?id=${item.key}"/>"><img
                                            src="${item.value.product.picture}" alt="cart"/></a>
                                </td>

                                <td class="product-name">
                                    <a href="<c:url value="/product-single?id=${item.key}"/>">${item.value.product.name}</a>
                                    <span class="color">
                                    Color: <i class="orange-dark"></i>
                                </span>
                                </td>
                                <td class="product-price">
                                    <span class="amount">$${item.value.product.price}</span>
                                </td>

                                <td class="product-quantity">
                                    <div class="quantity">
                                        <input type="number"
                                               step="1"
                                               min="0"
                                               name="cart"
                                               value="${item.value.quantity}"
                                               title="Qty"
                                               class="input-text qty text"
                                               size="4"
                                               onblur="updateCartItem(this, ${item.key})"
                                        >
                                    </div>
                                </td>

                                <td class="product-subtotal">
                                    <span class="amount">$${item.value.product.price * item.value.quantity}</span>
                                    <c:set var="totalAmount" value="${totalAmount + item.value.product.price * item.value.quantity}" />
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
                <!-- End table body -->
            </table>
        </form>
        <!-- End form table -->

        <!-- Cart attr -->
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <!-- Coupon -->
                <div class="coupon">
                    <h3>Coupon</h3>
                    <form>
                        <p>Enter your coupon code if you have one.</p>
                        <input type="text" name="coupon_code" class="input-text"
                               id="coupon_code" value="" placeholder="Coupon code">
                        <input type="submit" class="button" name="apply_coupon" value="Apply Coupon">
                    </form>
                </div>
                <!-- End coupon -->
            </div>
            <div class="col-md-6 col-sm-6">

                <!-- Cart totals -->
                <div class="cart_totals">
                    <div class="cart_totals_inner">
                        <table>
                            <tbody>
                            <tr class="cart-subtotal">
                                <th>Subtotal</th>
                                <td><span class="amount">$${totalAmount}</span></td>
                            </tr>
                            <tr class="shipping">
                                <th>Shipping and handling</th>
                                <td>
                                    <form class="shop-shipping-calculator" method="post">
                                        <p class="form-r">
                                            <label>
                                                <input type="checkbox" name="rate" value="1"/>
                                            </label>
                                            <span>
                                                       Flat Rate:
                                                       <span class="price">
                                                           $30.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <label>
                                                <input type="checkbox" name="international" value="1"/>
                                            </label>
                                            <span>
                                                       International Delivery:
                                                       <span class="price">
                                                           $150.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <label>
                                                <input type="checkbox" name="rate" value="1"/>
                                            </label>
                                            <span>
                                                       Local Delivery:
                                                       <span class="price">
                                                           $90.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <label>
                                                <input type="checkbox" name="pickup" value="1"/>
                                            </label>
                                            <span> Local Pickup (Free) </span>
                                        </p>
                                    </form>
                                </td>
                            </tr>
                            <tr class="order-total">
                                <th>Order total</th>
                                <td><span class="amount">$293.00</span></td>
                            </tr>
                            </tbody>
                        </table>
                        <div style="background: #f44336;color: #fff;font-weight: 500;text-align: center;padding: 10px 0;cursor: pointer">
                            Buy Now
                        </div>
                    </div>
                </div>
                <!-- End cart totals -->

            </div>
        </div>
        <!-- End cart attr -->
    </div>
</section>
<script>
    document.querySelector('.tz-menu-primary').style.display = "none";
</script>