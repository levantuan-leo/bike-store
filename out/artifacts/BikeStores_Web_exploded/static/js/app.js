var start = 0
var limit = 8

function loadMore() {
    jQuery.ajax({
        type: "POST",
        url: "home",
        data: {start: start, limit: limit},
        success: function (data, textStatus, jqXHR) {
            jQuery('#load_more').css('opacity', '0.3')

            if (data === '') {
                jQuery('#load_more').hide()
            } else {
                jQuery('#all_product .tab-pane.active').append(data)
            }

            jQuery('#load_more').css('opacity', '1')

            start = start + limit;
        },
        error: function (e) {
            alert('Error: ' + e);
        }
    });
}

if (window.location.pathname === "/BikeStores_Web_exploded/home") {
    loadMore();
}

function loadProducts(category_id = null, keyword = null) {
    var limit = jQuery('select[name="number_item"]').val()

    jQuery.ajax({
        type: "POST",
        url: "product",
        data: {
            limit: limit,
            categoryId: category_id,
            keyword: keyword
        },
        success: function (data, textStatus, jqXHR) {
            jQuery('.tz-product.row.grid-eff').html(data)

            if ($CATEGORY_ID !== "") {
                if (category_id !== $CATEGORY_ID) {
                    jQuery(`#category-${category_id}`).addClass("active")
                    jQuery(`#category-${$CATEGORY_ID}`).removeClass("active")
                } else {
                    jQuery(`#category-${category_id}`).addClass("active")
                }
            }

            $CATEGORY_ID = category_id
        },
        error: function (e) {
            alert('Error: ' + e);
        }
    });
}

function pagination(obj, category_id = null, keyword = null) {
    var current = jQuery(obj).text()
    var limit = jQuery('select[name="number_item"]').val()

    jQuery.ajax({
        type: "POST",
        url: "product",
        data: {
            index: current,
            limit: limit,
            categoryId: category_id,
            keyword: keyword
        },
        success: function (data, textStatus, jqXHR) {
            if (data !== '') {
                jQuery('.tz-product.row.grid-eff').html(data)
            }
        },
        error: function (e) {
            alert('Error: ' + e);
        }
    });
}

if (window.location.pathname === "/BikeStores_Web_exploded/product") {
    loadProducts(category_id = $CATEGORY_ID)
}

function addToCart(id, quantity = 1) {
    jQuery.ajax({
        type: "GET",
        url: "api/cart",
        data: {
            productId: id,
            quantity: quantity
        },
        success: function (data) {
            jQuery('.tz-mini-cart a strong').html(`${data["total_quantity"]}`)
            jQuery('.subtotal-content strong.pull-right').html(`$${data["total_amount"]}`)
        },
        error: function (e) {
            alert("ADD\nError:" + e);
        }
    })
}

function updateCartItem(obj, product_id) {
    jQuery.ajax({
        type: "POST",
        url: "api/cart",
        data: {
            productId: product_id,
            quantity: parseInt(obj.value)
        },
        success: function (data) {
            var price = parseFloat(jQuery(`#cart-item${product_id} .product-price .amount`).text().substring(1));
            var quantity = parseInt(obj.value);
            var product_subtotal = document.querySelector(`#cart-item${product_id} .product-subtotal .amount`);
            var order_total = document.querySelector('.order-total span.amount');

            product_subtotal.innerText = String(`$${price * quantity}`);
            order_total.innerText = String(`$${parseFloat(data["total_amount"]).toFixed(2)}`);
        },
        error: function (e) {
            alert("UPDATE\nError:" + e);
        }
    })
}

function deleteCartItem(product_id) {
    if (confirm("Are you sure?") === true) {
        jQuery.ajax({
            type: "DELETE",
            url: "api/cart?productId=" + product_id,
            success: function (data) {
                var order_total = document.querySelector('.order-total span.amount');
                order_total.innerText = `$${data["total_amount"]}`;

                // reload page
                // location.reload()
                // or
                // javascript
                const row = document.getElementById("cart-item" + product_id)
                row.style.display = "none"
            },
            error: function (e) {
                alert("DELETE\nError:" + e);
            }
        })
    }
}

var $loginForm = jQuery('#login-form')
$loginForm.submit(function () {
    jQuery.ajax({
        type: "POST",
        url: "api/login-logout",
        data: $loginForm.serialize(),
        success: function (data, textStatus, jqXHR) {
            location.reload();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    })

    return false;
})

var $registerForm = jQuery('#register-form');
$registerForm.submit(function () {
    jQuery.ajax({
        type: "POST",
        url: "register",
        data: $registerForm.serialize(),
        success: function (data) {
            alert(data);
            $registerForm.get(0).reset();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Something really bad happened " + textStatus);
            if (jqXHR.status && jqXHR.status === 400) {
                alert(jqXHR.responseText);
            } else {
                alert("Something went wrong");
            }
        }
    })

    return false;
})

var $addToCartForm = jQuery('.tz_variations_form')
$addToCartForm.submit(function (e) {
    addToCart($PRODUCT_ID, parseInt(jQuery('input[name="quantity"]', $addToCartForm).val()));
    e.preventDefault();
})

function payment() {
    if (confirm("Are you sure?")) {
        jQuery.ajax({
            type: "POST",
            url: "api/payment",
            success: function (data) {
                alert(data)
            },
            error: function (){
                alert("Something went wrong!.\n PLease, try again!")
            }
        })
    }
}