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

function loadProducts(index = null) {
    var limit = jQuery('select[name="number_item"]').val()

    jQuery.ajax({
        type: "POST",
        url: "product",
        data: {
            index: index,
            limit: limit,
            categoryId: $CATEGORY_ID,
            keyword: $KEYWORD
        },
        success: function (data, textStatus, jqXHR) {
            jQuery('.tz-product.row.grid-eff').html(data)

            if ($CATEGORY_ID !== "") {
                var c = jQuery(`#category-${$CATEGORY_ID}`)
                if (!c.hasClass("active")) c.addClass("active")
            }

            if (index !== null) {
                var current = jQuery('span.current').text()
                jQuery(`nav.pagination ul li:nth-child(${current})`).html(`<a href=\"javascript:void(0);\" onclick=\"loadProducts(${current})\">${current}</a>`);
                jQuery(`nav.pagination ul li:nth-child(${index})`).html(`<span class="current">${index}</span>`)
            }
        },
        error: function (e) {
            alert('Error: ' + e);
        }
    });
}

function backLoadProducts(){
    var current = jQuery('span.current').text()
    if (jQuery(`nav.pagination ul li:nth-child(${current - 1})`).length > 0) {
        loadProducts(parseInt(current) - 1)
    }}
function nextLoadProducts() {
    var current = jQuery('span.current').text()
    if (jQuery(`nav.pagination ul li:nth-child(${parseInt(current) + 2})`).length > 0) {
        loadProducts(parseInt(current) + 1)
    }
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

function payment() {
    if (confirm("Are you sure?")) {
        jQuery.ajax({
            type: "POST",
            url: "api/payment",
            success: function (data) {
                location.reload()
                alert(data)
            },
            error: function () {
                alert("Something went wrong!.\n PLease, try again!")
            }
        })
    }
}