<%-- 
    Document   : ListProducts
    Created on : Jun 14, 2023, 1:40:26 PM
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
        <title>Product Page - Admin HTML Template</title>
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
        <jsp:include page="NavbarManage.jsp"></jsp:include>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <h3 style="color: white;">List Product</h3>
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">PRODUCT NAME</th>
                                            <th scope="col">UNIT SOLD</th>
                                            <th scope="col">IN STOCK</th>
                                            <th scope="col">PRICE</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.list}" var="o">
                                        <c:if test="${o.id != 0}">
                                            <tr>
                                                <td><a href="updateproduct?id=${o.id}" class="tm-product-delete-link">
                                                        <i class="far fa-edit fa-lg" style="color: white"></i>
                                                    </a></td>
                                                <td class="tm-product-name">${o.name}</td>
                                                <td>${o.sold}</td>
                                                <td>${o.quantity - o.sold}</td>
                                                <td>${o.price}</td>
                                                <td>
                                                    <a onclick="return confirm('Do you want to delete this PRODUCT. This action can not undone')" 
                                                       href="deleteproduct?id=${o.id}&brandID=${o.getBrand().getBid()}" class="tm-product-delete-link">
                                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                    </a>

                                                </td>

                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="addproduct"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                        <c:if test="${mess != null}">
                            <a href="index">
                                <button class="btn btn-primary btn-block text-uppercase">
                                    ${mess}
                                </button>
                            </a>
                        </c:if>
                    </div>
                </div>
                <c:if test="${sessionScope.acc.isAdmin==1 && acc.brandID == 0}">    
                    <!--list category-->
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <h3 style="color: white">List Category</h3>
                                    <thead>
                                        <tr>
                                            <th scope="col">Category</th>
                                            <th scope="col">Number of Products</th>
                                            <th scope="col">Category ID</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listCate}" var="o">
                                            <tr>
                                                <td class="tm-product-name">${o.cname}</td>
                                                <td>${o.getQuantity()}</td>
                                                <td>${o.cid}</td>
                                                <td>
                                                    <a onclick="return confirm('Do you want to delete this CATEGORY. This action can not undone')" 
                                                       href="deletecategory?cid=${o.cid}" class="tm-product-delete-link">
                                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                    </a>

                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->
                            <a
                                href="addcategory"
                                class="btn btn-primary btn-block text-uppercase mb-3">Add new category</a>
                            <c:if test="${messCate != null}">
                                <a href="index">
                                    <button class="btn btn-primary btn-block text-uppercase">
                                        ${messCate}
                                    </button>
                                </a>
                            </c:if>
                        </div>
                    </div>

                    <!--List Brand-->
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <h3 style="color: white">List Brand</h3>
                                    <thead>
                                        <tr>
                                            <th scope="col">Brand Name</th>
                                            <th scope="col">Number of products</th>
                                            <th scope="col">Brand ID</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listBrand}" var="o">
                                            <tr>
                                                <td class="tm-product-name">${o.bname}</td>
                                                <td>${o.getQuantity()}</td>
                                                <td>${o.bid}</td>
                                                <td>
                                                    <a onclick="return confirm('Do you want to delete this brand. This action can not undone')" 
                                                       href="deletebrand?bid=${o.bid}" class="tm-product-delete-link">
                                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                    </a>

                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->
                            <a
                                href="addbrand"
                                class="btn btn-primary btn-block text-uppercase mb-3">Add new Brand</a>
                            <c:if test="${messBrand != null}">
                                <a href="index">
                                    <button class="btn btn-primary btn-block text-uppercase">
                                        ${messBrand}
                                    </button>
                                </a>
                            </c:if>
                        </div>
                    </div>

                    <!--List Account-->
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-products">
                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <h3 style="color: white">List Account</h3>
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">Fullname</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listA}" var="o">
                                            <c:if test="${o.isAdmin == 0 }">
                                                <tr>
                                                    <c:if test="${o.brandID != 0}">
                                                    <td><a href="updatebrandacc?aid=${o.id}" class="tm-product-delete-link">
                                                            <i class="far fa-edit fa-lg" style="color: white"></i>
                                                        </a></td>
                                                    </c:if> 
                                                    <c:if test="${o.brandID == 0}">
                                                    <td>&nbsp;</td>
                                                    </c:if>
                                                    <td class="tm-product-name">${o.fullname}</td>
                                                    <td>${o.username}</td>
                                                    <td>${o.brandID == 0 ?"User":"Seller"}</td>
                                                    <td>
                                                        <a onclick="return confirm('Do you want to delete this ACCOUNT. This action can not undone')" 
                                                           href="deleteaccount?aid=${o.id}" class="tm-product-delete-link">
                                                            <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                        </a>

                                                    </td>
                                                </c:if>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->
                            <a
                                href="addbrandacc"
                                class="btn btn-primary btn-block text-uppercase mb-3">Add new brand account</a>
                            <c:if test="${messAcc != null}">
                                <a href="index">
                                    <button class="btn btn-primary btn-block text-uppercase">
                                        ${messAcc}
                                    </button>
                                </a>
                            </c:if>
                        </div>
                    </div>


                </c:if>    
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer>

        <script src="js/jquery3-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap3.min.js"></script>
        <!-- https://getbootstrap.com/ -->

    </body>
</html>
