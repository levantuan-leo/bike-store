<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--Start create an accountEntity-->
<section class="default-page">
    <div class="container">
        <div class="tz-register">
            <h2>Create an accountEntity</h2>

            <!--Start form-->
            <form method="post">
                <p class="form-row form-row-wide">
                    <%--@declare id="username"--%><label for="username">Email address</label>
                    <input type="text" class="input-text" name="username" value="">
                </p>
                <p class="form-row form-row-wide">
                    <%--@declare id="password"--%><label for="password">Password</label>
                    <input class="input-text" type="password" name="password">
                </p>

                <p class="form-row">
                    <input type="submit" class="button" name="register" value="Create an accountEntity">
                </p>
            </form>
            <!--End form-->

        </div>
    </div>
</section>
<!--End create an accountEntity-->
