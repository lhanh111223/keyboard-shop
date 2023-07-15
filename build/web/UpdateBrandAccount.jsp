<%-- 
    Document   : ManageAccount
    Created on : Jun 18, 2023, 11:11:06 AM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Manage Account</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome3.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap3.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo3-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <jsp:include page="NavbarManage.jsp"></jsp:include>
                <form action="updatebrandacc?aid=${brandAcc.id}" method="post">
                    <div class="container mt-5">
                        <div class="row tm-content-row">
                            <div class="col-12 tm-block-col">
                                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                                    <h2 class="tm-block-title">List of Brands</h2>
                                    <p class="text-white">Brand</p>
                                    <select name="brandOption" class="custom-select">
                                    <c:forEach items="${listBrand}" var="o">
                                        <option ${brandAcc.brandID == o.bid ?"selected":""} value="${o.bid}">${o.bname}</option>
                                    </c:forEach> 
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- row -->
                    
                    <div class="row tm-content-row">
                        <div class="tm-block-col tm-col-account-settings">
                            <div class="tm-bg-primary-dark tm-block tm-block-settings">
                                <h2 class="tm-block-title">Account Information</h2>
                                <div class="form-group col-lg-12">
                                    <label for="name">Fullname</label>
                                    <input
                                        style="background-color: gray"
                                        readonly
                                        value="${brandAcc.fullname}"
                                        name="fullname"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="email">Email</label>
                                    <input
                                        style="background-color: gray"
                                        readonly
                                        value="${brandAcc.email}"
                                        name="email"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="email">Username</label>
                                    <input
                                        style="background-color: gray"
                                        value="${brandAcc.username}"
                                        name="username"
                                        type="text"
                                        class="form-control validate"
                                        readonly
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="password">Password</label>
                                    <input
                                        style="background-color: gray"
                                        readonly
                                        value="${brandAcc.password}"
                                        name="password"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="password2">Phone</label>
                                    <input
                                        style="background-color: gray"
                                        readonly
                                        value="${brandAcc.phone}"
                                        name="phone"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label for="phone">Avatar link address</label>
                                    <input
                                        style="background-color: gray"
                                        readonly
                                        value="${brandAcc.avatar}"
                                        name="avatar"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-12">
                                    <label class="tm-hide-sm">&nbsp;</label>
                                    <button
                                        type="submit"
                                        class="btn btn-primary btn-block text-uppercase"
                                        >
                                        Update Account
                                    </button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script src="js/jquery3-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap3.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>

