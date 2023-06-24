<%-- 
    Document   : ShopGrid
    Created on : May 24, 2023, 2:53:47 PM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Shop Detail</title>

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
        <!--Java Bean-->
        <jsp:useBean id="a" class="daoo.DAO" scope="request"></jsp:useBean>

        </head>

        <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <jsp:include page="Hero.jsp"></jsp:include>

            <!-- Product Section Begin -->
            <section class="product spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-5">
                            <div class="sidebar">
                                <!--Begin form filter-->
                                <form id="formfilter" action="filter">
                                    <input type="hidden" name="cid" value="${tag}"/>
                                <input type="hidden" name="textSearch" value="${param.textSearch}"/>
                                
                                <div class="sidebar__item">
                                    <h4>Local Brands</h4>
                                    <ul>
                                        <c:forEach items="${requestScope.listBrand}" var="o">
                                            <li style="margin-bottom: 5px">
                                                <input name="brandF" type="checkbox" value="${o.bid}">&nbsp;${o.bname}&nbsp;&nbsp;(${o.quantity})
                                            </li>
                                        </c:forEach>    
                                    </ul>
                                </div>
                                <div class="sidebar__item">
                                    <h4>Price</h4>
                                    <div class="price-range-wrap">
                                        <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                             data-min="1" data-max="540">
                                            <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                            <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                        </div>
                                        <div class="range-slider">
                                            <div class="price-input">
                                                <input name="minPrice" type="text" id="minamount">
                                                <input name="maxPrice" type="text" id="maxamount">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="sidebar__item sidebar__item__color--option">
                                    <h4>Colors</h4>
                                    <c:forEach items="${requestScope.listColor}"  begin="1" var="o">
                                        <label for="white">
                                            <input name="colorF" type="checkbox" value="${o.color_id}"/>&nbsp; ${o.color_name}
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach>    
                                </div>

                                <div class="sidebar__item">
                                    <h4>Keyboard Layout</h4>

                                    <c:forEach items="${requestScope.listLayout}"  begin="1" var="o">
                                        <label for="white">
                                            <input name="layoutF" type="checkbox" value="${o.layout_id}"/>&nbsp; ${o.layout_name}
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach> 

                                </div>

                                <div class="sidebar__item">
                                    <h4>Keyboard Connect</h4>

                                    <c:forEach items="${requestScope.listFeature}"  begin="1" var="o">
                                        <label for="white">
                                            <input name="connectF" type="checkbox" value="${o.feature_id}"/>&nbsp; ${o.feature_name}
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach> 

                                </div>

                                <div class="sidebar__item">
                                    <h4>Materials</h4>

                                    <c:forEach items="${requestScope.listMaterial}"  begin="1" var="o">
                                        <label for="white">
                                            <input name="materialF" type="checkbox" value="${o.material_id}"/>&nbsp; ${o.material_name}
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach> 
                                    <br><br><input class="btn btn-success" type="submit" value="FILTER"/>
                                </div>

                            </form>
                            <!--End form filter-->

                            <!--Last Product-->
                            <div class="sidebar__item">
                                <div class="latest-product__text">
                                    <h4>Latest Products</h4>
                                    <div class="latest-product__slider owl-carousel">

                                        <div class="latest-prdouct__slider__item">
                                            <c:forEach items="${listLP}" var="o" begin="0" end="2">

                                                <c:if test="${o.discount > 0}">
                                                    <a href="detail?pid=${o.id}" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="${o.image}" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>${o.name}</h6>
                                                            <span>
                                                                <span style="text-decoration: line-through">${o.price} $ <sup style="color: red">&nbsp(-20%)</sup> </span> 
                                                                <span>${o.price*(100-o.discount)/100} $</span>
                                                        </div>
                                                    </a>
                                                </c:if>
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
                                            </c:forEach>   
                                        </div>
                                        <div class="latest-prdouct__slider__item">
                                            <c:forEach items="${listLP}" var="o" begin="3" end="5">
                                                <!--Discount-->
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
                                                <!--End discount-->
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
                                            </c:forEach>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End last products-->
                        </div>
                    </div>

                    <div class="col-lg-9 col-md-7">
                        <div>
                            <h2 class="text-success" style="text-align: center; font-family: sans-serif">AUTHENTIC PRODUCTS</h2>
                        </div>

                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                        <!--Option Sort-->
                                        <form id="fsortprod" action="sortproduct">

                                            <div style="display: none" class="sidebar__item">
                                                <h4>Price</h4>
                                                <div class="price-range-wrap">
                                                    <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                                         data-min="1" data-max="540">
                                                        <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                                        <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                                    </div>
                                                    <div class="range-slider">
                                                        <div class="price-input">
                                                            <input name="minPrice" value="${minPrice}" type="text" id="minamount">
                                                            <input name="maxPrice" value="${maxPrice}" type="text" id="maxamount">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <c:forEach items="${brandA}" var="o">
                                                <input type="hidden" name="brandA" value="${o}"/>
                                            </c:forEach>
                                            <c:forEach items="${colorA}" var="o">
                                                <input type="hidden" name="colorA" value="${o}"/>
                                            </c:forEach>
                                            <c:forEach items="${layoutA}" var="o">
                                                <input type="hidden" name="layoutA" value="${o}"/>
                                            </c:forEach>
                                            <c:forEach items="${connectA}" var="o">
                                                <input type="hidden" name="connectA" value="${o}"/>
                                            </c:forEach>
                                            <c:forEach items="${materialA}" var="o">
                                                <input type="hidden" name="materialA" value="${o}"/>
                                            </c:forEach>


                                            <input type="hidden" name="cid" value="${tag}"/>
                                            <input type="hidden" name="textSearch" value="${param.textSearch}"/>
                                            <span>Sort By</span>
                                            <select name="optionSort" id="sortProduct" onchange="sortBy()">
                                                <option value="0">- ${option} -</option>
                                                <option value="1">Price Ascending</option>
                                                <option value="2">Price Descending</option>
                                                <option value="3">Latest</option>
                                                <option value="4">Sold</option>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="filter__found">
                                        <h6><span id="prodfound"></span>Products found</h6>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-3">
                                    <div class="filter__option">
                                        <span class="icon_grid-2x2"></span>
                                        <span class="icon_ul"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Product founds-->
                        <div class="row list">
                            <c:forEach items="${listP}" var="o">
                                <c:if test="${o.discount == 0}">
                                    <div class="col-lg-4 col-md-6 col-sm-6 eachitem">
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
                                </c:if>

                                <!--Begin has discount-->
                                <c:if test="${o.discount > 0}">
                                    <div class="col-lg-4 col-md-6 col-sm-6 eachitem">
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
                                                <h5>${o.price*(100-o.discount)/100} $</h5>
                                                <span style="text-decoration: line-through">${o.price} $</span> <sup style="color: red">&nbsp(-20%)</sup>

                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                            </c:forEach>

                        </div>
                        <div class="product__pagination listPage">
                            <!--Page number-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <script type="text/javascript">
            function sortBy() {
                let f = document.getElementById("fsortprod");
                f.submit();
            }
        </script>

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/paging.js"></script>
        <script src="js/sortProduct.js"></script>

    </body>

</html>
