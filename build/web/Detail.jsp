<%-- 
    Document   : Detail
    Created on : May 31, 2023, 11:55:12 AM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shopping</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- Header Section End -->

            <!-- Hero Section Begin -->
        <jsp:include page="Hero.jsp"></jsp:include>
            <!-- Hero Section End -->

            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" data-setbg="img/breadcrum.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2>${detail.name}</h2>
                            <div class="breadcrumb__option">
                                <a href="index">HOME</a>
                                <a href="category?cid=${cate.cid}">${cate.cname}</a>
                                <span>${detail.name}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large"
                                     src="${detail.image}" alt="">
                            </div>
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                     src="${detail.image}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                     src="${detail.image}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                     src="${detail.image}" alt="">
                                <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                     src="${detail.image}" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <form action="" name="f" method="post">
                            <div class="product__details__text">
                                <h3>${detail.name}</h3>
                                <c:if test="${detail.discount > 0}">
                                    <div style="display: flex" class="product__details__price">${detail.price*(100-detail.discount)/100} $
                                        <div style="margin-left: 10%">
                                            <span style="text-decoration: line-through; color: gray; font-size: 25px">${detail.price} $ </span>
                                            <sup style="color: red; font-size: 15px">&nbsp${detail.discount}%</sup>  
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${detail.discount == 0}">
                                    <div style="display: flex" class="product__details__price">
                                        ${detail.price*(100-detail.discount)/100} $
                                    </div>
                                </c:if>

                                <p>${detail.intro}</p>
                                <c:if test="${detail.quantity - detail.sold != 0}">
                                <div onclick="changeNum()" class="product__details__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input readonly name="num" type="text" value="1">
                                            <input id="quantity" type="hidden" value="1">
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${detail.quantity - detail.sold != 0}">
                                <a id="add" onclick="addToCart('${detail.id}')" href="#" class="primary-btn">ADD TO CART</a>
                                </c:if>
                                <c:if test="${detail.quantity - detail.sold == 0}">
                                    <a class="bg-danger" 
                                       style="font-weight: bold; font-size: 20px; color: white" >&nbsp;&nbsp;OUT OF STOCK&nbsp;&nbsp;</a>
                                </c:if>
                                    
                                    <p style="display: none" class="text-danger" id="outOfStock">OUT OF STOCK</p>
                                
                                <c:forEach items="${listItems}" var="li">
                                        <span style="display: ${li.product.getId()==detail.id ?"inline":"none"}" class="">
                                            <a  class="bg-success" 
                                                style="text-decoration: none; color: white" href="showcart">&nbsp;ALREADY IN CART&nbsp;</a>
                                        </span>
                                </c:forEach>

                                <span style="display: ${pid==detail.id ?"block":"none"}" class="text-success">&nbsp;Added to cart sucessfully</span>

                                <ul>
                                    <input type="hidden" value="${detail.quantity - detail.sold}" id="instock">
                                    <li><b>Availability</b> <span>${detail.quantity - detail.sold} Product(s)</span></li>
                                    <li><b>Sold</b> <span>${detail.sold} product(s). <samp></samp></span></li>
                                    <li><b>Views</b> <span>${detail.view}</span></li>
                                </ul>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                       aria-selected="true">Description</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Products Infomation</h6>
                                        <p>${detail.description}</p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Details Section End -->

        <!-- Related Product Section Begin -->
        <section class="related-product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title related__product__title">
                            <h2>Related Products</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listR}" var="o">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${o.image}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                    <h5>${o.price} $</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Related Product Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <!--Code JS-->
        <script type="text/javascript">
                                    function addToCart(id) {
                                        var m = document.f.num.value;
                                        document.f.action = "addtocart?id=" + id + "&num=" + m;
                                        document.f.submit();
                                    }

                                    function changeNum() {
                                        var out = document.getElementById("outOfStock");
                                        var instock = document.getElementById("instock");
                                        var avai = parseInt(instock.value);
                                        var num = document.getElementById("quantity").value;
                                        console.log(num);
                                        
                                        if(num < 1){
                                            var add = document.getElementById("add");
                                            add.style.display = "none";
                                        }
                                        else if(num > avai){
                                            var add = document.getElementById("add");
                                            add.style.display = "none";
                                            out.style.display = "inline";
                                        }
                                        else if(num <= avai){
                                            var add = document.getElementById("add");
                                            add.style.display = "inline";
                                            out.style.display = "none";
                                        }
                                    }

        </script>

    </body>

</html>
