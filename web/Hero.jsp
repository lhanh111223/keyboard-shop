<%-- 
    Document   : Hero
    Created on : May 24, 2023, 3:04:07 PM
    Author     : Hoang Anh
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Category</span>
                        </div>
                        <ul style="padding: 0px 0px 0px 0px; margin-bottom: 10px">
                            <!--List Category-->
                            <c:forEach items="${listC}" var="o">
                                <!--<li><a href="#">${o.cname}</a></li>-->
                                <li class="list-group-item ${tag==o.cid ? " bg-success" :"" }"><a href="category?cid=${o.cid}">${o.cname}<span style="color: green; font-weight: bold ">   (${o.quantity})</span></a></li>
                                </c:forEach>
                                
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <!--Search-->
                            <form action="search" method="get">
                                <div class="hero__search__categories">
                                    All Categories
                                </div>
                                <input type="text" value="${param.textSearch}" name="textSearch" placeholder="What do you need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+84 862 810 356</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                    <div style="margin-right: 5px" class="hero__item set-bg" data-setbg="./img/hero/banner.png">
                        <div class="hero__text">
                            <span>FU KEYBOARD SHOP</span>
                            <h2>Authentic <br />Hi-Tech</h2>
                            <p>No1 Viet Nam Keyboard Store</p>
                            <a href="shopgrid" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
