<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="left-sidebar bg-sidebar" style="background-color: #353535 ">
    <div id="sidebar" class="sidebar sidebar-with-footer">
        <!-- Aplication Brand -->
        <div class="app-brand">
            <a href="<c:url value="/home"/>">
                <img src="<c:url value="/static/images/logo.png"/>" alt="logo"/>
            </a>
        </div>
        <!-- begin sidebar scrollbar -->
        <div class="sidebar-scrollbar">

            <!-- sidebar menu -->
            <ul class="nav sidebar-inner" id="sidebar-menu">


                <li class="has-sub active expand">
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse"
                       data-target="#dashboard"
                       aria-expanded="false" aria-controls="dashboard">
                        <i class="mdi mdi-view-dashboard-outline" ></i>
                        <span class="nav-text">Dashboard</span> <b class="caret"></b>
                    </a>
                    <ul class="collapse show" id="dashboard"
                        data-parent="#sidebar-menu">
                        <div class="sub-menu">


                            <li class="active">
                                <a class="sidenav-item-link" href="<c:url value="/seller/home"/>">
                                    <span class="nav-text">Store Overview</span>

                                </a>
                            </li>


                            <li>
                                <a class="sidenav-item-link" href="<c:url value="/seller/product"/>">
                                    <span class="nav-text">Product</span>


                                </a>
                            </li>

                            <li class="active">
                                <a class="sidenav-item-link" href="<c:url value="/seller/order"/>">
                                    <span class="nav-text">Order</span>

                                </a>
                            </li>


                        </div>
                    </ul>
                </li>


            </ul>

        </div>

        <hr class="separator"/>


    </div>
</aside>