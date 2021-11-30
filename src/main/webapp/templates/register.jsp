<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Start create an accountEntity-->
<section class="default-page" style="
    background-image: linear-gradient(rgba(244, 67, 54, 0.5), rgba(255, 255, 200, 0.5)), url(https://images6.alphacoders.com/549/549198.jpg);
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
    document.getElementById('register-form').addEventListener('submit', register);
</script>
<!--End create an accountEntity-->
