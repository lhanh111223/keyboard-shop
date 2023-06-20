<%-- 
    Document   : index
    Created on : May 19, 2023, 11:34:01 AM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>FU Custom Keyboard </title>

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

            <!-- Categories Section Begin -->
            <section class="categories">
                <div class="container">
                    <div class="row">
                        <div class="categories__slider owl-carousel">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="https://wallpaperaccess.com/full/8708300.png">
                                    <h5><a style="background: rgb(66, 124, 69); color: white;" href="category?cid=1">SWITCH</a></h5>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="https://flashquark.com/wp-content/uploads/2020/03/GK64s-Bluetooth-Mechanical-Keyboard-Kit-RGB-Underglow.jpg">
                                    <h5><a style="background: rgb(66, 124, 69); color: white;" href="category?cid=2">CUSTOM </a></h5>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="https://www.dexerto.com/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.com/wp-content/uploads/2022/10/14/Best-Gaming-Keyboard.jpg">
                                    <h5><a style="background: rgb(66, 124, 69); color: white;" href="category?cid=3">MECHANICAL </a></h5>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="https://my-live-02.slatic.net/p/9c0a39879484ec420c0bb8429c2eea4d.jpg">
                                    <h5><a style="background: rgb(66, 124, 69); color: white;" href="category?cid=4">KEYCAPS</a></h5>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- Categories Section End -->

            <!-- Featured Section Begin -->
            <section class="featured spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h2>Featured Product</h2>
                            </div>
                            <div class="featured__controls">
                                <ul>
                                    <li class="active" data-filter="*">All</li>
                                    <li data-filter=".oranges">Switch</li>
                                    <li data-filter=".fresh-meat">Custom</li>
                                    <li data-filter=".vegetables">Mechanical</li>
                                    <li data-filter=".fastfood">Keycaps</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row featured__filter">

                    <c:forEach items="${list1}" var="o">
                        <c:if test="${o.discount == 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price} $</h5>
                                    </div>
                                </div>
                            </div>
                        </c:if>    

                        <c:if test="${o.discount > 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price*(100-o.discount)/100} $</h5>
                                        <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup></span>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${list2}" var="o">     
                        <c:if test="${o.discount == 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price} $</h5>
                                    </div>
                                </div>
                            </div>
                        </c:if>    

                        <c:if test="${o.discount > 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price*(100-o.discount)/100} $</h5>
                                        <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup></span>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${list3}" var="o">   
                        <c:if test="${o.discount == 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price} $</h5>
                                    </div>
                                </div>
                            </div>
                        </c:if>    

                        <c:if test="${o.discount > 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price*(100-o.discount)/100} $</h5>
                                        <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup></span>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${list4}" var="o">    
                        <c:if test="${o.discount == 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price} $</h5>
                                    </div>
                                </div>
                            </div>
                        </c:if>    

                        <c:if test="${o.discount > 0}">
                            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood ">
                                <div class="featured__item">
                                    <div class="featured__item__pic set-bg" data-setbg="${o.image}">
                                        <ul class="featured__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="featured__item__text">
                                        <h6><a href="detail?pid=${o.id}">${o.name}</a></h6>
                                        <h5>${o.price*(100-o.discount)/100} $</h5>
                                        <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup></span>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Featured Section End -->

        <!-- Banner Begin -->
        <div class="banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img src="img/banner/banner-1.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="banner__pic">
                            <img src="img/banner/banner-2.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner End -->



        <!--Discount products-->
        <div style="margin-left: 12%" class="col-lg-9 col-md-7">
            <div class="product__discount">
                <div style="text-align: center; margin-top: 50px" class="section-title product__discount__title">
                    <h2>Flash Sale</h2>
                </div>
                <div class="row">
                    <div class="product__discount__slider owl-carousel">

                        <c:forEach items="${listDiscountProd}" var="o">
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="${o.image}">
                                        <div class="product__discount__percent">-${o.discount}%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="detail?pid=${o.id}"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <h5><a href="detail?pid=${o.id}">${o.name}</a></h5>
                                        <div class="product__item__price">${o.price*(100-o.discount)/100} $ <span>${o.price} $</span></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <!--End discount products-->


        <!-- Latest Product Section Begin -->
        <section class="latest-product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="latest-product__text">
                            <h4>Latest Products</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${listLP}" var="o" begin="0" end="2">    
                                        <c:if test="${o.discount == 0}">
                                            <a href="detail?pid=${o.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${o.image}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${o.name}</h6>
                                                    <span>${o.price} $</span>
                                                </div>
                                            </a>
                                        </c:if>
                                        <c:if test="${o.discount > 0}">
                                            <a href="detail?pid=${o.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${o.image}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${o.name}</h6>
                                                    <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup> </span>
                                                    <span>${o.price*(100-o.discount)/100} $</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>         
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${listLP}" var="o" begin="3" end="5">    
                                        <c:if test="${o.discount == 0}">
                                            <a href="detail?pid=${o.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${o.image}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${o.name}</h6>
                                                    <span>${o.price} $</span>
                                                </div>
                                            </a>
                                        </c:if>
                                        <c:if test="${o.discount > 0}">
                                            <a href="detail?pid=${o.id}" class="latest-product__item">
                                                <div class="latest-product__item__pic">
                                                    <img src="${o.image}" alt="">
                                                </div>
                                                <div class="latest-product__item__text">
                                                    <h6>${o.name}</h6>
                                                    <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup> </span>
                                                    <span>${o.price*(100-o.discount)/100} $</span>
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>         
                                </div>



                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="latest-product__text">
                            <h4>Top Sold Product</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${listTS}" var="o" begin="0" end="2">   
                                        <c:if test="${o.discount == 0}">
                                        <a href="detail?pid=${o.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${o.image}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${o.name}</h6>
                                                <span>${o.price} $</span>
                                            </div>
                                        </a>
                                        </c:if>
                                        <c:if test="${o.discount > 0}">
                                        <a href="detail?pid=${o.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${o.image}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${o.name}</h6>
                                                <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup> </span>
                                                <span>${o.price*(100-o.discount)/100} $</span>
                                            </div>
                                        </a>
                                        </c:if>
                                    </c:forEach>    
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach items="${listTS}" var="o" begin="3" end="5">
                                        <c:if test="${o.discount == 0}">
                                        <a href="detail?pid=${o.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${o.image}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${o.name}</h6>
                                                <span>${o.price} $</span>
                                            </div>
                                        </a>
                                        </c:if>
                                        <c:if test="${o.discount > 0}">
                                        <a href="detail?pid=${o.id}" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${o.image}" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>${o.name}</h6>
                                                <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup> </span>
                                                <span>${o.price*(100-o.discount)/100} $</span>
                                            </div>
                                        </a>
                                        </c:if>
                                    </c:forEach>    
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- Latest Product Section End -->


        <!-- Blog Section Begin -->
        <section class="from-blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title from-blog__title">
                            <h2>From The Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-1.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">Cooking tips make cooking simple</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-2.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog-3.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                    <li><i class="fa fa-comment-o"></i> 5</li>
                                </ul>
                                <h5><a href="#">Visit the clean farm in the US</a></h5>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->

        <jsp:include page="Footer.jsp"></jsp:include>

        <!--Code JavaScript-->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
