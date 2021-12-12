<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>document.title = "BikeStores - Checkout"</script>

<section class="shop-cart">
    <div class="container">
        <!--Start Breadcrumbs-->
        <ul class="tz-breadcrumbs">
            <li>
                <a href="#">Home</a>
            </li>
            <li class="current">
                Checkout
            </li>
        </ul>
        <!--End Breadcrumbs-->

        <div class="row">
            <div class="col-md-6">
                <h1 class="page-title">Checkout</h1>

                <!--Shop info-->
                <div class="shop-info">
                    <c:set var="name" value=""/>
                    <c:set var="address" value=""/>
                    <c:set var="email" value=""/>
                    <c:set var="phone" value=""/>
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <p>Returning customer? <a href="#">Click here to login</a></p>
                        </c:when>
                        <c:otherwise>
                            <div><a onclick="payment()" style="display: block;
                                            text-align: center;
                                            background: #f4433b;
                                            color: #fff;
                                            padding: 15px;
                                            font-size: 25px;
                                            font-weight: bold;
                                            cursor: pointer;"
                            >Check out</a></div>
                            <c:set var="name" value="${sessionScope.account.customer.name}"/>
                            <c:set var="address" value="${sessionScope.account.customer.address}"/>
                            <c:set var="email" value="${sessionScope.account.customer.email}"/>
                            <c:set var="phone" value="${sessionScope.account.customer.phone}"/>
                        </c:otherwise>
                    </c:choose>
                    <p>Have a coupon? <a href="#">Click here to enter your code</a></p>
                </div>
                <!--End shop info-->

                <!--Start form checkout-->
                <form>
                    <div class="shop-billing-fields">
                        <h3>Billing Details</h3>
                        <p class="form-row form-row-first">
                            <label for="billing_name" class="">Your Name <span class="required">*</span></label>
                            <input type="text" class="input-text " name="billing_name" id="billing_name"
                                   placeholder="" value="${name}">
                        </p>
                        <div class="clear"></div>
                        <p class="form-row">
                            <label for="address">Address <span class="required">*</span></label>
                            <input type="text" class="input-text " name="address" id="address" placeholder="" value="${address}"
                                   disabled>
                        </p>
                        <div class="clear"></div>
                        <p class="form-row form-row-first">
                            <label for="email">Email Address<span class="required">*</span></label>
                            <input type="email" class="input-text " name="email" id="email" placeholder="" value="${email}">
                        </p>
                        <p class="form-row form-row-last">
                            <label for="phone">Phone <span class="required">*</span></label>
                            <input type="text" class="input-text " name="phone" id="phone" placeholder="" value="${phone}">
                        </p>
                        <div class="clear"></div>
                        <p class="form-row ship-to-different-address-checkbox">
                            <input class="input-checkbox" id="ship-to-different-address-checkbox" type="checkbox"
                                   name="ship-to-different-address-checkbox" value="1">
                            <label for="ship-to-different-address-checkbox" class="ship-to-different-address-checkbox">Ship
                                to a different address?</label>
                        </p>
                        <p class="form-row notes">
                            <label for="order_comments" class="">Order Notes</label>
                            <textarea name="order_comments" class="input-text " id="order_comments"
                                      placeholder="Notes about your order, e.g. special notes for delivery." rows="2"
                                      cols="5"></textarea>
                        </p>
                    </div>
                </form>
                <!--End form checkout-->

            </div>
            <div class="col-md-6">
                <!--Order review-->
                <div id="order_review">
                    <h3>Your Order</h3>
                    <c:set var="cart" value="${sessionScope.cart}"/>
                    <c:set var="totalAmount" value="${0}"/>
                    <c:choose>
                        <c:when test="${cart == null}">
                            <table class="shop_table">You need to buy something.
                                <a href="<c:url value="/product"/> ">Click Here</a>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <!--Shop table-->
                            <table class="shop_table">
                                <thead>
                                <tr>
                                    <th class="product-name">Product</th>
                                    <th class="product-total">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cart}" var="item">
                                    <tr class="cart_item">
                                        <td class="product-name">
                                                ${item.value.product.name}
                                            <strong class="product-quantity">× ${item.value.quantity}</strong>
                                        </td>
                                        <td class="product-total">
                                            <span class="amount">$${item.value.product.price}</span>
                                        </td>
                                    </tr>
                                    <c:set var="totalAmount"
                                           value="${totalAmount + item.value.product.price * item.value.quantity}"/>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Cart Subtotal</th>
                                    <td><span class="amount">$${totalAmount}</span></td>
                                </tr>

                                <tr class="shipping">
                                    <th>Shipping and Handling</th>
                                    <td>
                                        <form class="shop-shipping-calculator" method="post">
                                            <p class="form-r">
                                                <input type="checkbox" name="rate" value="on" checked disabled/>
                                                <span>
                                               Flat Rate:
                                               <span class="price">$30.00</span>
                                            </span>
                                            </p>
                                            <p class="form-r">
                                                <input type="checkbox" name="international" value="" onclick="shippingCalculator(this)"/>
                                                <span>
                                               International Delivery:
                                               <span class="price">$150.00</span>
                                            </span>
                                            </p>
                                            <p class="form-r">
                                                <input type="checkbox" name="rate" value="" onclick="shippingCalculator(this)"/>
                                                <span>
                                               Local Delivery:
                                               <span class="price">$90.00</span>
                                            </span>
                                            </p>
                                            <p class="form-r">
                                                <input type="checkbox" name="pickup" value="" onclick="shippingCalculator(this)"/>
                                                <span>Local Pickup (Free)</span>
                                            </p>
                                        </form>
                                    </td>
                                </tr>

                                <tr class="order-total">
                                    <th>Order Total</th>
                                    <td><strong><span class="amount">$${totalAmount - 30}</span></strong></td>
                                </tr>
                                </tfoot>
                            </table>
                            <!--End shop table-->

                            <!--Start payment-->
                            <div id="payment" class="checkout-payment">
                                <ul class="payment_methods methods">
                                    <li class="payment_method_bacs">
                                        <input id="payment_method_bacs" type="radio" class="input-radio"
                                               name="payment_method"
                                               value="bacs" checked="checked">

                                        <label for="payment_method_bacs">
                                            Direct Bank Transfer
                                        </label>
                                        <div class="payment_box payment_method_bacs">
                                            <p>Make your payment directly into our bank account. Please use your
                                                Order ID as the
                                                payment reference. Your order won’t be shipped until the funds have
                                                cleared in
                                                our account.</p>
                                        </div>
                                    </li>
                                    <li class="payment_method_paypal">
                                        <input id="payment_method_paypal" type="radio" class="input-radio"
                                               name="payment_method"
                                               value="paypal">
                                        <label for="payment_method_paypal">
                                            PayPal
                                        </label>
                                    </li>
                                </ul>

                                <div class="clear"></div>
                            </div>
                            <!--End payment-->
                        </c:otherwise>
                    </c:choose>
                </div>
                <!--End order review-->
            </div>
        </div>

    </div>
</section>
<script>
    document.getElementById('ship-to-different-address-checkbox').addEventListener("click", function () {
        if (this.checked) {
            document.getElementById('address').disabled = false
        } else {
            document.getElementById('address').disabled = true
        }
    })

    function shippingCalculator(obj){
        var shipping = parseFloat(jQuery(obj).next().children(".price").text().substr(1));
        var orderTotalElm = jQuery('.order-total .amount');
        var orderTotal = parseFloat(orderTotalElm.text().substr(1));

        if(jQuery(obj)[0].checked){
            orderTotalElm.text("$" + (orderTotal + shipping))
        } else {
            orderTotalElm.text("$" + (orderTotal - shipping))
        }
    }
</script>