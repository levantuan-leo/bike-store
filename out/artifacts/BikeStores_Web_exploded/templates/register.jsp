<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>document.title = "BikeStores - Register"</script>

<!--Start create an account-->
<section class="default-page" style="
    background-image: linear-gradient(rgba(244, 67, 54, 0.5), rgba(255, 255, 200, 0.5)), url(<c:url value="/static/images/bg_register.png"/> );
    background-size: cover;
    background-position: inherit;
">
    <div class="container">
        <div class="tz-register">
            <h2>Create an account</h2>

            <!--Start form-->
            <form id="register-form" method="post">
                <p class="form-row form-row-wide">
                    <%--@declare id="name"--%><label for="name">Your name</label>
                    <input type="text" class="input-text" name="name" value="" required>
                </p>
                <p class="form-row form-row-wide">
                    <%--@declare id="email"--%><label for="email">Email address</label>
                    <input type="email" class="input-text" name="email" value="" required>
                </p>
                <p class="form-row form-row-wide">
                    <%--@declare id="password"--%><label for="password">Password</label>
                    <input class="input-text" type="password" name="password" required>
                </p>
                <p class="form-row form-row-wide">
                    <%--@declare id="confirm-password"--%><label for="confirm-password">Confirm password</label>
                    <input type="password" class="input-text" name="confirm-password" value="" required>
                </p>
                <p class="form-row">
                    <input type="submit" class="button" name="register" value="Create">
                </p>
            </form>
            <!--End form-->

        </div>
    </div>
</section>
<script>
    document.querySelector('#login-form .form-text:last-child').style.display = "none";

    var $registerForm = jQuery('#register-form');
    $registerForm.submit(function () {
        jQuery.ajax({
            type: "POST",
            url: "register",
            data: $registerForm.serialize(),
            success: function (data) {
                alert(data);
                $registerForm.get(0).reset();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Something really bad happened " + textStatus);
                if (jqXHR.status && jqXHR.status === 400) {
                    alert(jqXHR.responseText);
                } else {
                    alert("Something went wrong");
                }
            }
        })

        return false;
    })
</script>
<!--End create an account-->
