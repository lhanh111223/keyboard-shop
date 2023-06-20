<%-- 
    Document   : EditProduct
    Created on : Jun 14, 2023, 2:09:40 PM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Product - Dashboard Admin Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome3.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap3.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo3-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <jsp:include page="NavbarManage.jsp"></jsp:include>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <!--Begin From Add-->
                        <form id="f" action="addproduct" method="post" class="tm-edit-product-form">
                        <input type="hidden" name="brandID" value="${sessionScope.acc.brandID}"/>
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Add Product</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">

                                    <div class="form-group mb-3">
                                        <label>Product Name</label>
                                        <input name="name" type="text" required class="form-control validate"/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Introduction</label>
                                        <textarea name="intro" rows="2" required class="form-control validate tm-small"></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Description</label>
                                        <textarea name="description" rows="5" required class="form-control validate tm-small"></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Category</label>
                                        <select id="op" onchange="show()" class="custom-select tm-select-accounts" name="category">
                                            <c:forEach items="${listC}" var="o">
                                                <option value="${o.cid}">${o.cname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label>Price ($)</label>
                                            <input name="price" type="number" required class="form-control validate" data-large-mode="true"/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label>Quantity</label>
                                            <input name="quantity" type="number" required class="form-control validate"/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label>Discount (%)</label>
                                            <input name="discount" type="number" required class="form-control validate"/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label>Sold</label>
                                            <input name="sold" value="0" readonly style="background: grey" class="form-control validate"/>
                                        </div>

                                    </div>

                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img src="${prod.image}" alt="Product image" class="img-fluid d-block mx-auto">
                                    </div>
                                    <div class="custom-file mt-3 mb-3">
                                        <label style="color: white">Image link address</label>
                                        <input class="form-control validate" 
                                               type="text" required name="image" placeholder="Image link address" style="width: 100%"/>
                                    </div>
                                    <div style="margin-top: 20px" class="form-group mb-3">
                                        <label>Color</label>
                                        <select name="color" class="custom-select tm-select-accounts">
                                            <c:forEach items="${listColor}" var="o">
                                                <option ${prod.productDetail.getCid().getColor_id() == o.color_id ?"selected":""} value="${o.color_id}">${o.color_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Material</label>
                                        <select name="material" class="custom-select tm-select-accounts">
                                            <c:forEach items="${listMaterial}" var="o">
                                                <option ${prod.productDetail.getMid().getMaterial_id() == o.material_id ?"selected":""} value="${o.material_id}">${o.material_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                        <div id="cate2" style="${(param.category==2 || param.category==3)?"display: block":"display: none"}" 
                                             class="form-group mb-3">
                                            <label>Keyboard Layout</label>
                                            <select name="layout" class="custom-select tm-select-accounts">
                                                <c:forEach items="${listLayout}" var="o">
                                                    <option ${prod.productDetail.getLid().getLayout_id() == o.layout_id ?"selected":""} value="${o.layout_id}">${o.layout_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div id="cate3" style="${(param.category==2 || param.category==3)?"display: block":"display: none"}" 
                                             class="form-group mb-3">
                                            <label>Keyboard Connect</label>
                                            <select name="connect" class="custom-select tm-select-accounts">
                                                <c:forEach items="${listFeature}" var="o">
                                                    <option ${prod.productDetail.getFid().getFeature_id() == o.feature_id ?"selected":""} value="${o.feature_id}">${o.feature_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add product</button>
                                    <c:if test="${mess != null}">
                                        <a href="loadmanageproduct?bid=${acc.brandID}" class="btn btn-primary btn-block text-uppercase">${mess}</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--End Form Update-->
                </div>
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
        <script type="text/javascript">
            let cate1 = document.getElementById("cate2");
            let cate2 = document.getElementById("cate3");
            let op = document.getElementById("op");
            let f = document.getElementById("f");
            function show() {
                if(op.value === "2" || op.value === "3"){
                    cate1.style.display = "block";
                    cate2.style.display = "block";
                }else if (op.value === "1" || op.value === "4"){
                    cate1.style.display = "none";
                    cate2.style.display = "none";
                }

            }
        </script>                            

        <script src="js/sortProduct.js"></script>
        <script src="js/jquery3-3.3.1.min.js"></script>
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <script src="js/bootstrap3.min.js"></script>

    </body>
</html>

