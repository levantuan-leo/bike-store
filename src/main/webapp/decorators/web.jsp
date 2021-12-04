<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home</title>

    <link href="<c:url value="/static/css/bootstrap.min.css" />" rel="stylesheet" type='text/css'>
    <link href='<c:url value="/static/fonts/font-awesome/css/font-awesome.min.css" />' rel='stylesheet'
          type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic'
          rel='stylesheet' type='text/css'>
    <link href='<c:url value="/static/fonts/lovelo/stylesheet.css" />' rel='stylesheet' type='text/css'>

    <link href='<c:url value="/static/css/owl.carousel.css" />' rel='stylesheet' type='text/css'>
    <link href='<c:url value="/static/css/owl.theme.css" />' rel='stylesheet' type='text/css'>
    <link href="<c:url value="/static/rs-plugin/css/settings.css" />" rel="stylesheet" type='text/css'>
    <link href="<c:url value="/static/css/custom.css" />" rel="stylesheet" type='text/css'>

    <!--[if lt IE 9]>
        <script src="<c:url value="/static/js/html5shiv.min.js" />"></script>
        <script src="<c:url value="/static/js/respond.min.js" />"></script>
    <![endif]-->
</head>
<body>
<!--Start class site-->
<div class="tz-site">
    <!--Start id tz header-->
    <%@ include file="/common/web/header.jsp" %>
    <!--End id tz header-->

    <!-- content -->
    <dec:body />
    <!-- end content -->

    <!--Start Footer-->
    <%@ include file="/common/web/footer.jsp" %>
    <!--End Footer-->
</div>
<!--End class site-->

<script type='text/javascript' src="<c:url value="/static/js/jquery.min.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/jquery-ui.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/bootstrap.min.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/off-canvas.js" />"></script>
<!--jQuery Countdow-->
<script type='text/javascript' src="<c:url value="/static/js/jquery.plugin.min.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/jquery.countdown.min.js" />"></script>
<!--End Countdow-->
<script type='text/javascript' src="<c:url value="/static/js/jquery.parallax-1.1.3.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/owl.carousel.js" />"></script>
<script type='text/javascript' src="<c:url value="/static/js/custom.js" />"></script>
<script type='text/javascript' src='<c:url value="/static/rs-plugin/js/jquery.themepunch.tools.min.js" />'></script>
<script type='text/javascript'
        src='<c:url value="/static/rs-plugin/js/jquery.themepunch.revolution.min.js" />'></script>
<script type='text/javascript' src='<c:url value="/static/rs-plugin/js/custom-rs.js" />'></script>
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
<script type="text/javascript">
    var liveSearch = jQuery('.live-search')
    function inSearch(){
        liveSearch.css("display","block")
    }
    function outSearch(){
        liveSearch.css("display","none")
    }
    function search(obj){
        var text = jQuery(obj).val()
        jQuery.ajax({
            type: "POST",
            url: "api/search",
            data: {keyword: text},
            success: function (data, textStatus, jqXHR) {
                liveSearch.children("ul").html(data)
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        })
    }
</script>
<script src="<c:url value="/static/js/app.js" />"></script>
</body>
</html>
