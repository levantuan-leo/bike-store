<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>BikeStores - Admin Home</title>

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
          rel="stylesheet"/>
    <link href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css" rel="stylesheet"/>

    <!-- PLUGINS CSS STYLE -->
    <link href="<c:url value="/static/seller/plugins/toaster/toastr.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/nprogress/nprogress.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/flag-icons/css/flag-icon.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/jvectormap/jquery-jvectormap-2.0.3.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/ladda/ladda.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/select2/css/select2.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/static/seller/plugins/daterangepicker/daterangepicker.css"/>" rel="stylesheet"/>

    <!-- SLEEK CSS -->
    <link id="sleek-css" rel="stylesheet" href="<c:url value="/static/seller/css/sleek.css"/>"/>

    <!-- FAVICON -->
    <link href="<c:url value="/static/images/favicon.png"/> " rel="shortcut icon"/>

    <!--
    HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
  -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/static/seller/plugins/nprogress/nprogress.js"/>"></script>
</head>

<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
<script>
    NProgress.configure({showSpinner: false});
    NProgress.start();
</script>

<div class="mobile-sticky-body-overlay"></div>

<div class="wrapper">

    <%@ include file="/common/admin/sidebar.jsp" %>

    <div class="page-wrapper">
        <%@ include file="/common/admin/header.jsp" %>

        <dec:body/>

        <%@ include file="/common/admin/footer.jsp" %>
    </div>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCn8TFXGg17HAUcNpkwtxxyT9Io9B_NcM" defer></script>
<script src="<c:url value="/static/seller/plugins/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/toaster/toastr.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/slimscrollbar/jquery.slimscroll.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/charts/Chart.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/ladda/spin.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/ladda/ladda.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/jquery-mask-input/jquery.mask.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/select2/js/select2.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/jvectormap/jquery-jvectormap-world-mill.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/daterangepicker/daterangepicker.js"/>"></script>
<script src="<c:url value="/static/seller/plugins/jekyll-search.min.js"/>"></script>
<script src="<c:url value="/static/seller/js/sleek.js"/>"></script>
<script src="<c:url value="/static/seller/js/chart.js"/>"></script>
<script src="<c:url value="/static/seller/js/date-range.js"/>"></script>
<script src="<c:url value="/static/seller/js/map.js"/>"></script>
<script src="<c:url value="/static/seller/js/custom.js"/>"></script>
</body>
</html>
