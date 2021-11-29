var start = 0
var limit = 8

function loadMore() {
    jQuery.ajax({
        type: "GET",
        url: "api/load-more",
        data: {start: start, limit: limit},
        success: function (data) {
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

loadMore();

function addToCart(id, quantity = 1) {
    jQuery.ajax({
        type: "GET",
        url: "api/cart",
        data: {
            product_id: id,
            quantity: quantity
        },
        success: function (data) {
            jQuery('.tz-mini-cart a strong').html(`${data["total_quantity"]}`)
            jQuery('.subtotal-content strong.pull-right').html(`$${data["total_amount"]}`)
        },
        error: function (e) {
            alert('Error:' + e);
        }
    })
}

function updateCartItem(obj, product_id) {
    jQuery.ajax({
        type: "POST",
        url: "api/cart",
        data: {
            product_id: product_id,
            quantity: parseInt(obj.value)
        },
        success: function (data) {
            var price = parseFloat(jQuery(`#cart-item${product_id} .product-price .amount`).text().substring(1));
            var quantity = parseInt(obj.value);
            var product_subtotal = document.querySelector(`#cart-item${product_id} .product-subtotal .amount`);
            var order_total = document.querySelector('.order-total .amount');

            product_subtotal.innerText = String(price * quantity);
            order_total.innerText = data["total_amount"];
        },
        error: function (e) {
            alert('Error:' + e);
        }
    })
}

function deleteCartItem(product_id) {
    if (confirm("Are you sure?") === true) {
        jQuery.ajax({
            type: "DELETE",
            url: "api/cart?product_id=" + product_id,
            success: function (data) {
                var order_total = document.querySelector('.order-total .amount');
                order_total.innerText = data["total_amount"];

                // reload page
                // location.reload()
                // or
                // javascript
                const row = document.getElementById("cart-item" + product_id)
                row.style.display = "none"
            },
            error: function (e) {
                alert("can't delete!\n" + e);
            }
        })
    }
}

function login() {
    jQuery.ajax({
        type: "DELETE",
        url: "api/login",
        success: function (data) {
        },
        error: function () {

        }
    })
}