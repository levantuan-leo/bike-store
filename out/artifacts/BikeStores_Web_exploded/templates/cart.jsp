<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="shop-checkout">
    <div class="container">
        <!--Start Breadcrumbs-->
        <ul class="tz-breadcrumbs">
            <li>
                <a href="#">Home</a>
            </li>
            <li class="current">
                Shop Cart
            </li>
        </ul>
        <!--End Breadcrumbs-->
        <h1 class="page-title">Shop Cart</h1>

        <!--Start form table-->
        <form>
            <table class="shop_table cart">
                <!--Table header-->
                <thead>
                <tr>
                    <th class="productEntity-remove">&nbsp;</th>
                    <th class="productEntity-thumbnail">Product</th>
                    <th class="productEntity-name">&nbsp;</th>
                    <th class="productEntity-price">Price</th>
                    <th class="productEntity-quantity">Quantity</th>
                    <th class="productEntity-subtotal">Total</th>
                </tr>
                </thead>
                <!--End table header-->

                <!--Table body-->
                <tbody>

                <tr class="cart_item">
                    <td class="productEntity-remove">
                        <a href="#" class="remove" title="Remove this item"></a>
                    </td>
                    <td class="productEntity-thumbnail">
                        <a href="/productEntity-single"><img src="<c:url value="/templates/images/productEntity/widget1.jpg" />" alt="cart" /></a>
                    </td>

                    <td class="productEntity-name">
                        <a href="/productEntity-single">Liv Race Day Short </a>
                        <span class="color">
                                    Color: <i class="orange"></i>
                                </span>
                    </td>
                    <td class="productEntity-price">
                        <span class="amount">$20.00</span>
                    </td>

                    <td class="productEntity-quantity">
                        <div class="quantity"><input type="number" step="1" min="0" name="cart" value="1" title="Qty" class="input-text qty text" size="4"></div>
                    </td>

                    <td class="productEntity-subtotal">
                        <span class="amount">$229.00</span>
                    </td>
                </tr>
                <tr class="cart_item">
                    <td class="productEntity-remove">
                        <a href="#" class="remove fa-" title="Remove this item"></a>
                    </td>
                    <td class="productEntity-thumbnail">
                        <a href="/productEntity-single"><img src="<c:url value="/templates/images/productEntity/widget2.jpg" />" alt="cart" /></a>
                    </td>

                    <td class="productEntity-name">
                        <a href="/productEntity-single">City Pedals Sport </a>
                        <span class="color">
                                    Color: <i class="light-blue"></i>
                                </span>
                    </td>
                    <td class="productEntity-price">
                        <span class="amount">$20.00</span>
                    </td>

                    <td class="productEntity-quantity">
                        <div class="quantity"><input type="number" step="1" min="0" name="cart" value="1" title="Qty" class="input-text qty text" size="4"></div>
                    </td>

                    <td class="productEntity-subtotal">
                        <span class="amount">$229.00</span>
                    </td>
                </tr>
                <tr class="cart_item">
                    <td class="productEntity-remove">
                        <a href="#" class="remove fa-" title="Remove this item"></a>
                    </td>
                    <td class="productEntity-thumbnail">
                        <a href="/productEntity-single"><img src="<c:url value="/templates/images/productEntity/widget3.jpg" />" alt="cart" /></a>
                    </td>

                    <td class="productEntity-name">
                        <a href="/productEntity-single">Gloss </a>
                        <span class="color">
                                    Color: <i class="red-light"></i>
                                </span>
                    </td>
                    <td class="productEntity-price">
                        <span class="amount">$20.00</span>
                    </td>

                    <td class="productEntity-quantity">
                        <div class="quantity"><input type="number" step="1" min="0" name="cart" value="1" title="Qty" class="input-text qty text" size="4"></div>
                    </td>

                    <td class="productEntity-subtotal">
                        <span class="amount">$229.00</span>
                    </td>
                </tr>

                </tbody>
                <!--End table body-->
            </table>
        </form>
        <!--End form table-->

        <!--Cart attr-->
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <!--Coupon-->
                <div class="coupon">
                    <h3>Coupon</h3>
                    <form>
                        <p>Enter your coupon code if you have one.</p>
                        <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code">
                        <input type="submit" class="button" name="apply_coupon" value="Apply Coupon">
                    </form>
                </div>
                <!--End coupon-->
            </div>
            <div class="col-md-6 col-sm-6">

                <!--Cart totals-->
                <div class="cart_totals">
                    <div class="cart_totals_inner">
                        <table>
                            <tbody>
                            <tr class="cart-subtotal">
                                <th>Subtotal</th>
                                <td><span class="amount">$293.00</span></td>
                            </tr>
                            <tr class="shipping">
                                <th>Shipping and handling</th>
                                <td>
                                    <form class="shop-shipping-calculator"  method="post">
                                        <p class="form-r">
                                            <input type="checkbox" name="rate" value="1" />
                                            <span>
                                                       Flat Rate:
                                                       <span class="price">
                                                           $30.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <input type="checkbox" name="international" value="1" />
                                            <span>
                                                       International Delivery:
                                                       <span class="price">
                                                           $150.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <input type="checkbox" name="rate" value="1" />
                                            <span>
                                                       Local Delivery:
                                                       <span class="price">
                                                           $90.00
                                                       </span>
                                                   </span>
                                        </p>
                                        <p class="form-r">
                                            <input type="checkbox" name="pickup" value="1" />
                                            <span>Local Pickup (Free)</span>
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
                <!--End cart totals-->

            </div>
        </div>
        <!--End cart attr-->
    </div>
</section>