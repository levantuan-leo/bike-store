<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>document.title = "BikeStores - Products"</script>

<!--Start shop-->
<div class="tz-shop">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <!--Start for shop sidebar-->
                <div class="tz-shop-sidebar">
                    <aside class="widget widget_product_categories">
                        <h3 class="widget-title">Bikes product</h3>
                        <ul class="product-categories">
                            <li class="cat-parent">
                                <a href="<c:url value="/product"/>" >Bikes</a>
                                <ul class="children">
                                    <c:forEach items="${listCategories}" var="category" varStatus="loop">
                                        <li id="category-${category.id}">
                                            <a href="javascript:void(0);"
                                               onclick="loadProducts(null, ${category.id})">${category.name}
                                                <span>(${listCategoriesSize[loop.index]})</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li>
                                <a href="shop.html">Gear</a>
                            </li>
                        </ul>
                    </aside>
                    <aside class="product-catlog widget">
                        <h3 class="widget-title">Catalog</h3>
                        <div class="widget_price_filter">
                            <h4 class="widget-title-children">
                                Price Filter
                            </h4>
                            <form>
                                <div id="slider-range"></div>
                                <div class="price_label">
                                    <button type="submit" class="button">Filter</button>
                                    <span class="value-price">
                                            <span class="from"></span>
                                             -
                                            <span class="to"></span>
                                        </span>
                                </div>
                            </form>
                        </div>
                        <div class="widget_color_filter">
                            <h4 class="widget-title-children">
                                Color filter
                            </h4>
                            <ul>
                                <li>
                                    <a href="shop.html" class="light-blue"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="orange"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="blueviolet"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="orange-dark"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="steelblue"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="red-light"></a>
                                </li>
                                <li>
                                    <a href="shop.html" class="cyan-dark"></a>
                                </li>
                            </ul>
                        </div>
                        <div class="widget-size-filter">
                            <h4 class="widget-title-children">
                                Size Filter
                            </h4>
                            <ul>
                                <li>
                                    <a href="shop.html">S - Small <span>(24)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">M - Medium <span>(18)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">L - Large <span>(9)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html"> XL - Extra Large <span>(39)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">xtra Extra Large <span>(24)</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="widget-size-filter">
                            <h4 class="widget-title-children">
                                Brand Filter
                            </h4>
                            <ul>
                                <li>
                                    <a href="shop.html">S - Small <span>(24)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">M - Medium <span>(18)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">L - Large <span>(9)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html"> XL - Extra Large <span>(39)</span></a>
                                </li>
                                <li>
                                    <a href="shop.html">xtra Extra Large <span>(24)</span></a>
                                </li>
                            </ul>
                        </div>
                    </aside>
                    <aside class="widget widget_product">
                        <h3 class="widget-title">Featured product</h3>
                        <ul>
                            <c:forEach items="${listFeaturedProducts}" var="product">
                                <li>
                                    <a href="<c:url value="/product-single?productId=${product.id}"/> ">
                                        <img src="${product.picture}" alt="${product.name}">
                                        <div class="item-info">
                                            <h5>${product.name}</h5>
                                            <span class="p-vote">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </span>
                                            <span class="price">$${product.price}</span>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </aside>
                </div>
                <!--End shop sidebar-->

            </div>

            <div class="col-md-9">

                <!--Start shop content-->
                <div class="tz-shop-content">
                    <ul class="tz-breadcrumbs">
                        <li>
                            <a href="<c:url value="/home"/> ">Home</a>
                        </li>
                        <li class="current">
                            Category
                        </li>
                    </ul>
                    <div class="shop-banner">
                        <img src="<c:url value="/static/images/product/banner.jpg" />" alt="banner"
                             style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <div class="catalog-meta">
                        <div class="catalog_top">
                                <span class="style-switch">
                                    <a class="nav-grid-view fa fa-th-large active"></a>
                                    <a class="nav-list-view fa fa-list"></a>
                                </span>
                            <form class="shop-order">
                                <label class="form-arrow">
                                    <select class="number-item" name="number_item">
                                        <option value="12">12 items/page</option>
                                        <option value="6">6 items/page</option>
                                        <option value="3">3 items/page</option>
                                    </select>
                                </label>
                                <label class="form-arrow">
                                    <select name="orderby" class="orderby">
                                        <option value="'">Sort By: Position</option>
                                        <option value="rating">Sort by price</option>
                                        <option value="date">Sort by newness</option>
                                    </select>
                                </label>
                            </form>
                        </div>
                    </div>

                    <div class="tz-product row grid-eff">
                    </div>

                    <nav class="pagination">
                        <ul class="pagination_list pull-right">
                            <li>
                                <a href="shop.html">Next</a>
                            </li>
                            <li>
                                <a href="shop.html">1</a>
                            </li>
                            <li>
                                <span class="current">2</span>
                            </li>x
                            <li>
                                <a href="shop.html">3</a>
                            </li>
                            <li>
                                <a href="shop.html">4</a>
                            </li>
                            <li>
                                <a href="shop.html">5</a>
                            </li>
                            <li>
                                <span>...</span>
                            </li>
                            <li>
                                <a href="shop.html">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--End shop content-->
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(function() {
        jQuery( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 75, 300 ],
            slide: function( event, ui ) {
                jQuery('.from').text('$' + ui.values[ 0 ]);
                jQuery('.to').text('$' + ui.values[ 1 ]);
            }
        });
        jQuery('.from').text('$' + jQuery( "#slider-range" ).slider( "values", 0 ));
        jQuery('.to').text('$' + jQuery( "#slider-range" ).slider( "values", 1 ));
    });
</script>
<script>
    document.querySelector('.tz-main-menu li:nth-child(2)').style.display = "none";
    $CATEGORY_ID = '${categoryId != null ? categoryId : ""}'
    loadProducts(null, $CATEGORY_ID, null)
</script>
<!--End Shop-->