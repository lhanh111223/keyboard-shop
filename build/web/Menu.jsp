<%-- 
    Document   : Menu
    Created on : May 24, 2023, 2:57:13 PM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Page Preloder -->
<!--<div id="preloder">
    <div class="loader"></div>
</div>-->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> vutiendat101@gmail.com</li>
                            <c:if test="${acc.brandID==0 && acc.isAdmin==0}"><li>Welcome user, ${acc.fullname} </li></c:if>
                            <c:if test="${acc.brandID!=0 && acc.isAdmin==0}"><li>Welcome brand, ${acc.fullname} </li></c:if>
                            <c:if test="${acc.brandID==0 && acc.isAdmin!=0}"><li>Welcome admin, ${acc.fullname} </li></c:if>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                            <c:if test="${acc != null}">
                                <div>Edit</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="editprofile">Profile</a></li>
                                    <li><a href="ChangePassword.jsp">Password</a></li>
                                </ul>
                            </c:if>
                            </div>
                        <c:if test="${sessionScope.acc != null}">
                            <div class="header__top__right__auth">
                                <a href="logout"><i class="fa fa-sign-out"></i> LogOut</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <div class="header__top__right__auth">
                                <a href="Login.jsp"><i class="fa fa-sign-in"></i> Login</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="index"><img src="img/logo1.png" alt=""/></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                    <c:set var="tag" value="${pageContext.request.requestURL}"></c:set>
                    
                        <li class="${(tag=="http://localhost:9999/fkbshop/index.jsp")?"active":""}"><a href="index">Home</a></li>
                        <li class="${(tag=="http://localhost:9999/fkbshop/ShopGrid.jsp")?"active":""}"><a href="shopgrid">Shop</a></li>
                        <li><a href="showcart">Shoping Cart</a></li>
                        <li><a href="checkout">Check Out</a></li>
                        <c:if test="${sessionScope.acc.isAdmin==0 && acc.brandID != 0}">
                            <li><a href="loadmanageproduct?bid=${acc.brandID}">Manage Product</a></li>
                        </c:if>
                        <c:if test="${sessionScope.acc.isAdmin==1 && acc.brandID == 0}">
                            <li><a href="loadmanageproduct">Admin manage</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="showcart"><i class="fa fa-shopping-bag"></i> 
                                <span>${size}</span>
                            </a>
                        </li>
                    </ul>
                    <!--<div class="header__cart__price">cart price: <span>$150.00</span></div>-->
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->
