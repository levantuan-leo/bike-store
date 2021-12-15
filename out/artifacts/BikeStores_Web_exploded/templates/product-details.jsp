<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>document.title = "BikeStores - Details"</script>

<!--Start shop single-->
<section class="tz-shop-single">
    <div class="container">

        <!--Start Breadcrumbs-->
        <ul class="tz-breadcrumbs">
            <li>
                <a href="<c:url value="/home"/>">Home</a>
            </li>
            <li>
                <a href="<c:url value="/product"/>">Category</a>
            </li>
            <li class="current">
                Product
            </li>
        </ul>
        <!--End Breadcrumbs-->
        <div class="row">
            <div class="col-md-6 col-sm-6">

                <!--Shop images-->
                <div class="shop-images">
                    <ul class="single-gallery">
                        <li>
                            <img src="${product.picture}" alt="${product.name}"
                                 style="height: 373px; width: 100%; object-fit: contain;">
                        </li>
                        <li>
                            <img src="<c:url value="/static/images/product/single-p.jpg" />" alt="Propel Advanced Pro">
                        </li>
                        <li>
                            <img src="<c:url value="/static/images/product/single-p1.jpg" />" alt="Propel Advanced Pro">
                        </li>
                    </ul>
                    <div class="product-social">
                        <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-twitter"></a>
                        <a href="#" class="fa fa-google-plus"></a>
                        <a href="#" class="fa fa-dribbble"></a>
                    </div>
                </div>
                <!--End shop image-->
            </div>

            <div class="col-md-6 col-sm-6">
                <!--Shop content-->
                <div class="entry-summary">
                    <h1 style="
                            margin: unset;
                            padding: 5px 0;
                            background: #f44336;
                            text-align: center;
                            color: #fff;
                        "><span style="font-weight: 300;font-size: 13px;">STORE: </span>${product.getStock().getStore().getName()}</h1>
                    <h1>${product.name}</h1>
                    <span class="p-vote">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </span>
                    <p class="product-price">
                        <span class="price">$${product.price}</span>
                        <span class="stock">Availability:  <span> ${product.getStock().getQuantity()}</span></span>
                    </p>
                    <div class="description">
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy
                            text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to
                            make a type specimen book.
                        </p>
                    </div>
                    <form class="tz_variations_form">
                        <p class="form-attr">
                                <span class="color">
                                    <label>Color:</label>
                                    <select name="color">
                                        <option value="blue">Blue</option>
                                        <option value="blue">Red</option>
                                        <option value="blue">Yellow</option>
                                    </select>
                                </span>
                            <span class="tzqty">
                                <label>Qty:</label>
                                <input type="number" step="1" min="1" name="quantity" value="1" title="Qty"
                                       class="input-text qty text" size="4">
                            </span>
                        </p>
                        <p>
                            <button type="submit" class="single_add_to_cart_button">Add to cart</button>
                            <button type="submit"
                                    class="single_add_to_wishlist"
                                    style="color: #f44336;border: 1px solid #f44336;padding: 12px 23px 12px 53px;background-position: 20px center;"
                            >
                                add to wishlist
                            </button>
                        </p>
                    </form>
                </div>
                <!--End shop content-->
            </div>

        </div>
    </div>

    <!--Shop tabs-->
    <div class="tz-shop-tabs">
        <div class="container">
            <div class="tab-head">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="#description" data-toggle="tab">Description</a></li>
                    <li role="presentation"><a href="#reviews" data-toggle="tab">Reviews</a></li>
                    <li role="presentation"><a href="#information" data-toggle="tab">Information</a></li>
                </ul>
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="description">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique
                        auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper.
                        Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla. Donec a neque libero.
                        Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum turpis
                        eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget
                        sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat
                        vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat
                        et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget.
                        Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                        Nam erat mi, rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec
                        aliquam consequat, purus felis vehicula felis, a dapibus enim lorem nec augue.</p>
                </div>
                <div class="tab-pane" id="reviews">
                    <p> Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. ornare lectus quis justo gravida
                        semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla. Donec a neque
                        libero. Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum
                        turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus
                        eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat
                        vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat
                        et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget.
                        Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                        Nam erat mi, rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec
                        aliquam consequat, purus felis vehicula felis, a dapibus enim lorem nec augue.</p>
                </div>
                <div class="tab-pane" id="information">
                    <p>Smooth, fast and fun. This versatile aluminum road bike has been revamped to give it a
                        well-rounded performance ride quality. It’s the perfect choice to help you push the pace, ride
                        more miles, and expand your road riding experience.</p>
                    <p>Designed for aspiring riders aiming to ride a little faster and go a little farther, Contend
                        offers a smooth, efficient ride quality and a quick, agile feel on the road. The innovative
                        D-Fuse seatpost helps reduce road shocks and vibrations, and there’s enough frame and fork
                        clearance to run wider tires (up to 32mm) to further smooth out the ride. Engineered and built
                        in Giant’s industry-leading aluminum forging facility, it’s a true all-rounder for ambitious
                        road riders.</p>
                    <p><strong>Product highlights:</strong></p>
                    <ul>
                        <li>ALUXX-Grade Aluminum</li>
                        <li>Advanced-Grade Composite, full-composite OverDrive steerer</li>
                        <li>Shimano Sora 2 x 9s</li>
                        <li>Tektro Caliper Brake TK-B117</li>
                        <li>Giant S-R3 wheelset</li>
                        <li>Giant S-R3 AC, 700x25c (28mm), folding</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!--End tab-->

    <!--Tabs product-->
    <div class="container">
        <div class="box-shadow">

            <!--Tabs header-->
            <div class="tz-tabs-header">
                <h2 class="tz-tabs-title pull-left"><span style="color: #f44336;">Related</span> Products</h2>
                <ul class="nav nav-tabs pull-right tz-nav-tabs">
                    <li role="presentation"><a href="<c:url value="/product?categoryId=${product.category.id}"/> "
                                               data-toggle="tab">View all >></a></li>
                </ul>
            </div>
            <!--End tab header-->

            <!--Tab content-->
            <div class="tab-content">

                <!--Tab item-->
                <div class="tab-pane active" id="one_read">
                    <div class="row row-item">
                        <c:forEach items="${listProductsRelated}" var="p">
                            <div class="col-md-3 col-sm-6">
                                <!--Start product item-->
                                <div class="product-item">
                                    <div class="product-thubnail">
                                        <img src="${p.picture}"
                                             alt="product 4"/>
                                        <div class="product-meta">
                                            <a class="add-to-cart"
                                               href="javascript:void(0);" onclick="addToCart(${p.id})">Add to cart</a>
                                            <span class="quick-view">
                                                <a href="#">Quick view</a>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="product-information">
                                        <h4><a href="<c:url value="/product-single?productId=${p.id}"/> ">${p.name}</a>
                                        </h4>
                                        <span class="product-price">$${p.price}</span>
                                        <span class="product-attr">
                                            <i class="fa fa-circle light-blue"></i>
                                            <i class="fa fa-circle orange"></i>
                                            <i class="fa fa-circle blueviolet"></i>
                                            <i class="fa fa-circle orange-dark"></i>
                                            <i class="fa fa-circle steelblue"></i>
                                        </span>
                                    </div>
                                </div>
                                <!--End product item-->
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!--End tab item-->
            </div>
            <!--End tab content-->

        </div>
    </div>
    <!--End tabs-->

    <!--Start partners-->
    <div class="container">
        <ul class="tz-partners">
            <c:forEach begin="1" end="12" var="i">
                <li>
                    <a href="#">
                        <img src="<c:url value="/static/images/clients/partner${i % 6 + 1}.jpg" />" alt="partner">
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <!--End partners-->
</section>
<!--End Shop single-->
<script>
    var $addToCartForm = jQuery('.tz_variations_form')
    $addToCartForm.submit(function (e) {
        addToCart(${product.id}, parseInt(jQuery('input[name="quantity"]', $addToCartForm).val()));
        e.preventDefault();
    })
</script>
