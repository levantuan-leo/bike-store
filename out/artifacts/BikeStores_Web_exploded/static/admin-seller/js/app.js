function addProduct(name, category_id, price, picture, quantity) {
    $.ajax({
        type: "POST",
        url: "/seller/product",
        data: {
            name: name,
            categoryId: category_id,
            price: price,
            picture: picture,
            quantity: quantity
        },
        success: function (data) {
            alert(data)
        },
        error: function (e) {
            alert("ADD PRODUCT\nError:" + e)
        }
    })

}

var $addProductForm = $('#addProductForm');
if ($addProductForm.length > 0) {
    $addProductForm.submit(function () {
        addProduct($('input[name="name"]', $addProductForm).val(),
            $('select[name="categoryId"]', $addProductForm).val(),
            $('input[name="price"]', $addProductForm).val(),
            $('input[name="picture"]', $addProductForm).val(),
            $('input[name="quantity"]', $addProductForm).val())
        return false;
    })
}

function deleteProduct(product_id) {
    $.ajax({
        type: "POST",
        url: "/seller/product?productId=" + product_id,
        success: function (data) {
            alert(data)
        },
        error: function (e) {
            alert("DELETE PRODUCT\nError:" + e)
        }
    })
}