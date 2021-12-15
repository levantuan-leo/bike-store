<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>document.title = "BikeStores - Your Profile"</script>

<div class="tz-site">
    <!--Start Blog-->
    <div class="blog">
        <div class="container">
            <ul class="tz-breadcrumbs">
                <li>
                    <a href="#">Home</a>
                </li>
                <li class="current">
                    Profile
                </li>
            </ul>
            <div class="blog-container">
                <div class="row">
                    <div class="col-md-4">

                        <!--Blog Sidebar-->
                        <div class="blog-sidebar">
                            <aside class="contact-info widget no-border">
                                <div style="
                                display: flex;
                                justify-content: start;
                                align-items: center;
                                padding-bottom: 15px;
                                border-bottom: 1px solid #dbdbdb;">
                                    <img style="max-width: 60px;border-radius: 50%;" src="<c:url value="/static/images/avatar.gif"/>" alt="">
                                    <div style=" margin-left: 15px;">
                                        <p style="padding: unset;font-weight: 600;">${sessionScope.account.customer.name}</p>
                                        <span><span style="color: #f44336;"><i class="fa fa-pencil"></i></span> Change info</span>
                                    </div>
                                </div>
                                <ul>
                                    <li>
                                        <a href="<c:url value="/account/profile"/>" class="active">
                                            <i class="fa fa-user"></i>
                                            My Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="/purchase"/> ">
                                            <i class="fa fa-clipboard"></i>
                                            My Order
                                        </a>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                        <!--End Blog Sidebar-->
                    </div>
                    <div class="col-md-8 tz-blog-content">
                        <h1 class="large-ttle">Profile</h1>
                        <div id="contact-form" class="contact-respond">
                            <h3 class="tz-title" style="text-transform: none; font-weight: unset;">Manage profile information for account security</h3>
                            <form id="commentform" class="contact-form-7">
                                <p class="comment-for-author" style="width: 100%;">
                                    <input type="text" class="author" placeholder="Name" value="${sessionScope.account.customer.name}" style="border-width: 1px 1px 0 1px;">
                                    <i class="fa fa-user"></i>
                                </p>
                                <p class="comment-for-email" style="width: 100%;">
                                    <input type="text" class="email" placeholder="Email" value="${sessionScope.account.customer.email}">
                                    <i class="fa fa-envelope"></i>
                                </p>
                                <p class="comment-for-url">
                                    <input type="url" class="url" placeholder="Phone" value="${sessionScope.account.customer.phone}">
                                    <i class="fa fa-link"></i>
                                </p>
                                <p class="comment-for-content">
                                    <textarea class="comment" name="comment" placeholder="Address">${sessionScope.account.customer.address}</textarea>
                                    <i class="fa fa-comment"></i>
                                </p>
                                <p class="comment-for-submit">
                                    <input name="submit" type="submit" id="submit" class="submit" value="Save">
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Start Blog-->
</div>
