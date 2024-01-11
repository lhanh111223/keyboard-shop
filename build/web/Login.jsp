<%-- 
    Document   : Login
    Created on : May 28, 2023, 11:23:03 PM
    Author     : Le Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style2.css">
    </head>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="./img/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="SignUp.jsp" class="signup-image-link">Create an account</a>
                        </div>
                        
                        <div class="signin-form">
                            <h2 class="form-title">Sign up</h2>
                            <form action="login" method="post" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input required type="text" name="user" value="${cookie.cuser.value}" placeholder="Your Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input required type="password" name="pass" value="${cookie.cpass.value}" placeholder="Password"/>
                                </div>
                                    <input style="display: inline-block" type="checkbox" name="remember" value="on" ${cookie.crem != null ?'checked':''} />Remember me

                                <div class="text-center p-t-12">
                                    <span class="txt1">
                                        <p style="color: red" class="text-danger">${mess}</p>
                                    </span>
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?scope=email profile&redirect_uri=http%3A%2F%2Flocalhost%3A9999%2Fholalearn%2Flogin&response_type=code&client_id=858666386841-i773lqh7jdqoo9pdgoj5984l0uc1ndbn.apps.googleusercontent.com&approval_prompt=force&service=lso&o2v=1&flowName=GeneralOAuthFlow"
                                           ><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main2.js"></script>
    </body>
</html>
