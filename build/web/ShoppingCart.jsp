<%-- 
    Document   : ShoppingCart
    Created on : Jun 22, 2023, 2:04:42 PM
    Author     : HoangAnh
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
        <title>Shopping Cart</title>

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


        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrum.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shopping Cart</h2>
                            <div class="breadcrumb__option">
                                <a href="index">Home</a>
                                <a href="shopgrid">Shop</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shoping Cart Section Begin -->
        <section class="shoping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table style="border-collapse: collapse">
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="cart" value="${cart}"/>
                                    <c:forEach items="${cart.items}" var="o">
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <a href="detail?pid=${o.product.id}">
                                                    <img style="width: 100px; height: 100px" src="${o.product.image}" alt="">
                                                    <h5>${o.product.name}</h5>
                                                </a>
                                            </td>
                                            <td class="shoping__cart__price">
                                                ${o.product.price * (1-o.product.discount/100)} $
                                                <input type="hidden" name="price" value="${o.product.price * (1-o.product.discount/100)}"/>
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div style="display: flex; margin-left: 24%">
                                                    <a style="text-decoration: none; color: white; font-weight: bold"
                                                       href="process?num=-1&id=${o.product.id}">
                                                        <button style="font-weight: bold" class="quantity-right-plus btn btn-success btn-number">
                                                            -
                                                        </button></a>

                                                    <input style="width: 30%; text-align: center" 
                                                           class="form-control input-number" 
                                                           name="num" type="text" value="${o.quantity}">
                                                    <a style="text-decoration: none; color: white; font-weight: bold"
                                                       href="process?num=1&id=${o.product.id}">
                                                        <button style="font-weight: bold" class="quantity-right-plus btn btn-success btn-number">
                                                            +
                                                        </button>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="shoping__cart__total">
                                                ${o.quantity * o.price} $
                                                <input type="hidden" name="total" value="${o.quantity * o.price}"/>
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <a href="process?num=3&id=${o.product.id}"><span class="icon_close"></span></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="shopgrid" class="primary-btn">CONTINUE SHOPPING</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__continue">
                            <div class="shoping__discount">
                                <h5>Discount Codes</h5>
                                <form action="#">
                                    <input type="text" placeholder="Enter your coupon code">
                                    <button type="submit" class="site-btn">APPLY COUPON</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Cart Total</h5>
                            <ul>
                                <li>Subtotal <span>${cart.getTotalMoney()} $</span></li>
                                <li>Total <span>${cart.getTotalMoney()} $</span></li>
                            </ul>
                            <a href="checkout" class="primary-btn">PROCEED TO CHECKOUT</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

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
            function updateQuantity() {

            }
        </script>

    </body>

</html>