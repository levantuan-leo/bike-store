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
            alert("ADD\nError:" + e);
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
            var cart_subtotal = document.querySelector('.cart-subtotal .amount');

            product_subtotal.innerText = String(`$${price * quantity}`);
            cart_subtotal.innerText = String(`$${parseFloat(data["total_amount"]).toFixed(2)}`);
        },
        error: function (e) {
            alert("UPDATE\nError:" + e );
        }
    })
}

function deleteCartItem(product_id) {
    if (confirm("Are you sure?") === true) {
        jQuery.ajax({
            type: "DELETE",
            url: "api/cart?product_id=" + product_id,
            success: function (data) {
                var cart_subtotal = document.querySelector('.cart-subtotal .amount');
                cart_subtotal.innerText = `$${data["total_amount"]}`;

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

function login() {
    jQuery.ajax({
        type: "POST",
        url: "api/login",
        success: function (data, textStatus, jqXHR) {

        },
        error: function (jqXHR, textStatus, errorThrown) {

        }
    })
}

function register() {
    var register_form = jQuery('#register-form');
    jQuery.ajax({
        type: "POST",
        url: "api/register",
        data: register_form.serialize(),
        success: function (data) {
            alert(data.message);
            register_form.get(0).reset();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Something really bad happened " + textStatus);
            if(jqXHR.status&&jqXHR.status===400){
                alert(jqXHR.responseText);
            }else{
                alert("Something went wrong");
            }
        }
    })

    return false;
}