<%-- 
    Document   : Dashboard
    Created on : Jun 28, 2023, 11:24:37 PM
    Author     : HoangAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome3.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap3.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo3-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
        <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
</head>

<body id="reportsPage">
    <div class="" id="home">
        <jsp:include page="NavbarManage.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
            <c:if test="${sessionScope.acc.isAdmin == 0}">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">REVENUE</h2>
                        <form id="f" action="dashboard">
                            <input type="hidden" name="bid" value="${sessionScope.acc.brandID}"/    >
                            <select onchange="changeYear()" class="form-select form-select-lg mb-3" name="year">
                                <option ${tag == 2021 ?"selected":""} value="2021">2021</option>
                                <option ${tag == 2022 ?"selected":""} value="2022">2022</option>
                                <option ${tag == 2023 ?"selected":""} value="2023">2023</option>
                            </select>
                        </form>
                        <canvas id="lineChart1"></canvas>
                    </div>
                </div>
             </c:if>  
            <c:if test="${sessionScope.acc.isAdmin == 1}">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">REVENUE</h2>
                        <form id="f" action="dashboard">
                            <input type="hidden" name="bid" value="${sessionScope.acc.brandID}"/    >
                            <select onchange="changeYear()" class="form-select form-select-lg mb-3" name="year">
                                <option ${tag == 2021 ?"selected":""} value="2021">2021</option>
                                <option ${tag == 2022 ?"selected":""} value="2022">2022</option>
                                <option ${tag == 2023 ?"selected":""} value="2023">2023</option>
                            </select>
                        </form>
                        <canvas id="lineChart1"></canvas>
                    </div>
                </div>
            </c:if>
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">Performance</h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
                <!--begin pie chart-->
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">Category's Revenue ($)</h2>
                        <div id="pieChartContainer">
                            <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller">
                        <h2 class="tm-block-title">Category's Views (views)</h2>
                        <div id="pieChartContainer2">
                            <canvas id="pieChart2" class="chartjs-render-monitor" width="200" height="200"></canvas>
                        </div>
                    </div>
                </div>
                <!--end pie chart-->
                
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                        <h2 class="tm-block-title">TOP SELLING PRODUCT</h2>
                        <div class="tm-notification-items">
                        <c:forEach items="${listTopSell}" var="o">
                            <div class="media tm-notification-item">
                                <div class="tm-gray-circle"><img style="height: 80px" src="${o.image}" alt="Product Image"
                                                                 class="rounded-circle"></div>
                                <div class="media-body">
                                    <p class="mb-2"><b>${o.name}</b> sold <b>${o.sold} / ${o.quantity} items</b> in category <a href=""
                                                                                                       class="tm-notification-link">${o.category.cname}</a></p>
                                    <span class="tm-small tm-text-color-secondary">Revenue: ${o.price*(1-o.discount/100)*o.sold} $</span>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
                
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-overflow">
                            <h2 class="tm-block-title">TOP IN STOCK PRODUCT</h2>
                            <div class="tm-notification-items">
                            <c:forEach items="${listTopInStock}" var="o">
                                <div class="media tm-notification-item">
                                    <div class="tm-gray-circle"><img style="height: 80px" src="${o.image}" alt="Avatar Image"
                                                                     class="rounded-circle"></div>
                                    <div class="media-body">
                                        <p class="mb-2"><b>${o.name}</b> sold <b> ${o.sold}</b> items 
                                            <a href="updateproduct?id=${o.id}" class="tm-notification-link"> NEED UPDATE TO SELL</a></p>
                                        <span class="tm-small tm-text-color-secondary">In Stock: ${o.quantity-o.sold} / ${o.quantity}</span>
                                        <br/>
                                        <span class="tm-small tm-text-color-secondary">Revenue: ${o.price*(1-o.discount/100)*o.sold} $</span>
                                    </div>
                                </div>
                            </c:forEach> 
                            </div>
                        </div>
                    </div>
                    
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Orders List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ORDER NO.</th>
                                    <th scope="col">STATUS</th>
                                    <th scope="col">OPERATORS</th>
                                    <th scope="col">LOCATION</th>
                                    <th scope="col">DISTANCE</th>
                                    <th scope="col">START DATE</th>
                                    <th scope="col">EST DELIVERY DUE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"><b>#122340</b></th>
                                    <td>
                                        <div class="tm-status-circle cancelled">
                                        </div>Cancelled
                                    </td>
                                    <td><b>Wilson Cookies</b></td>
                                    <td><b>London, UK</b></td>
                                    <td><b>218 km</b></td>
                                    <td>17:30, 12 OCT 2018</td>
                                    <td>08:30, 22 OCT 2018</td>
                                </tr>
                                <tr>
                                    <th scope="row"><b>#122342</b></th>
                                    <td>
                                        <div class="tm-status-circle moving">
                                        </div>Moving
                                    </td>
                                    <td><b>Oscar Phyo</b></td>
                                    <td><b>London, UK</b></td>
                                    <td><b>420 km</b></td>
                                    <td>15:30, 06 OCT 2018</td>
                                    <td>09:30, 16 OCT 2018</td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved.

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template
                        Mo</a>
                </p>
            </div>
        </footer>
    </div>

        <script type="text/javascript">
            function changeYear(){
                var f = document.getElementById("f");
                f.submit();
            }
        </script>

    <script src="js/jquery3-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap3.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <!-- <script src="js/tooplate-scripts.js"></script> -->
    <script>
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart1;
            barChart, 
            pieChart,
            pieChart2;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart
            drawPieChart2();

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();
            });
        })




    </script>

    <!-- chart js -->
    <script>
        const width_threshold = 480;

        function drawLineChart() {
            if ($("#lineChart1").length) {
                ctxLine = document.getElementById("lineChart1").getContext("2d");
                optionsLine = {
                    scales: {
                        yAxes: [
                            {
                                scaleLabel: {
                                    display: true,
                                    labelString: ""
                                }
                            }
                        ]
                    }
                };

                // Set aspect ratio based on window width
                optionsLine.maintainAspectRatio =
                    $(window).width() < width_threshold ? false : true;

                configLine = {
                    type: "line",
                    data: {
                        labels: [
                            "January",
                            "February",
                            "March",
                            "April",
                            "May",
                            "June",
                            "July",
                            "August",
                            "September",
                            "October",
                            "November",
                            "December"
                            
                        ],
                        datasets: [
                            {
                                label: "REVENUE ($)",
                                data: [
                                <c:forEach items="${listBrand}" var="o">
                                        ${o.revenue},                        
                                </c:forEach>
                                        ],
                                fill: false,
                                borderColor: "rgb(75, 192, 192)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "SWITCH",
                                data: [
                                    <c:forEach items="${listCateRevenue1}" var="o">
                                        ${o.revenue},
                                    </c:forEach>
                                ],
                                fill: false,
                                borderColor: "rgba(255,99,132,1)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "CUSTOM KEYBOARD",
                                data: [
                                    <c:forEach items="${listCateRevenue2}" var="o">
                                        ${o.revenue},
                                    </c:forEach>
                                ],
                                fill: false,
                                borderColor: "rgba(153, 102, 255, 1)",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "MECHANICAL KEYBOARD",
                                data: [
                                    <c:forEach items="${listCateRevenue3}" var="o">
                                        ${o.revenue},
                                    </c:forEach>
                                ],
                                fill: false,
                                borderColor: "#FFFF00",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            },
                            {
                                label: "KEYCAPS",
                                data: [
                                    <c:forEach items="${listCateRevenue4}" var="o">
                                        ${o.revenue},
                                    </c:forEach>
                                ],
                                fill: false,
                                borderColor: "#FF9900",
                                cubicInterpolationMode: "monotone",
                                pointRadius: 0
                            }
                        ]
                    },
                    options: optionsLine
                };

                lineChart1 = new Chart(ctxLine, configLine);
            }
        }

        function drawBarChart() {
            if ($("#barChart").length) {
                ctxBar = document.getElementById("barChart").getContext("2d");

                optionsBar = {
                    responsive: true,
                    scales: {
                        yAxes: [
                            {
                                barPercentage: 0.2,
                                ticks: {
                                    beginAtZero: true
                                },
                                scaleLabel: {
                                    display: true,
                                    labelString: "Hits"
                                }
                            }
                        ]
                    }
                };

                optionsBar.maintainAspectRatio =
                    $(window).width() < width_threshold ? false : true;

                /**
                 * COLOR CODES
                 * Red: #F7604D
                 * Aqua: #4ED6B8
                 * Green: #A8D582
                 * Yellow: #D7D768
                 * Purple: #9D66CC
                 * Orange: #DB9C3F
                 * Blue: #3889FC
                 */

                configBar = {
                    type: "horizontalBar",
                    data: {
                        labels: ["Red", "Aqua", "Green", "Yellow", "Purple", "Orange", "Blue"],
                        datasets: [
                            {
                                label: "# of Hits",
                                data: [33, 40, 28, 49, 58, 38, 44],
                                backgroundColor: [
                                    "#F7604D",
                                    "#4ED6B8",
                                    "#A8D582",
                                    "#D7D768",
                                    "#9D66CC",
                                    "#DB9C3F",
                                    "#3889FC"
                                ],
                                borderWidth: 0
                            }
                        ]
                    },
                    options: optionsBar
                };

                barChart = new Chart(ctxBar, configBar);
            }
        }
//        pie chart
        function drawPieChart() {
            if ($("#pieChart").length) {
                var chartHeight = 300;

                $("#pieChartContainer").css("height", chartHeight + "px");

                ctxPie = document.getElementById("pieChart").getContext("2d");

                optionsPie = {
                    responsive: true,
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10
                        }
                    },
                    legend: {
                        position: "top"
                    }
                };

                configPie = {
                    type: "pie",
                    data: {
                        datasets: [
                            {
                                data: [
                                    <c:forEach items="${listCate}" var="o">
                                       ${o.revenue},                                               
                                    </c:forEach>
                                        ],
                                backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582", "#FFFF00"],
                                label: "Storage"
                            }
                        ],
                        labels: [
                            <c:forEach items="${listCate}" var="o">
                                       "${o.cname}",                                               
                            </c:forEach>
                        ]
                    },
                    options: optionsPie
                };

                pieChart = new Chart(ctxPie, configPie);
            }
        }

        function updateLineChart() {
            if (lineChart1) {
                lineChart1.options = optionsLine;
                lineChart1.update();
            }
        }

        function updateBarChart() {
            if (barChart) {
                barChart.options = optionsBar;
                barChart.update();
            }
        }

    </script>
    <!--pieChart2-->
    <script type="text/javascript">
        function drawPieChart2() {
            if ($("#pieChart2").length) {
                var chartHeight = 300;

                $("#pieChartContainer2").css("height", chartHeight + "px");

                ctxPie = document.getElementById("pieChart2").getContext("2d");

                optionsPie = {
                    responsive: true,
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 10,
                            top: 10,
                            bottom: 10
                        }
                    },
                    legend: {
                        position: "top"
                    }
                };

                configPie = {
                    type: "pie",
                    data: {
                        datasets: [
                            {
                                data: [
                                    <c:forEach items="${listCateView}" var="o">
                                       ${o.quantity},                                               
                                    </c:forEach>
                                        ],
                                backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582", "#FFFF00"],
                                label: "Storage"
                            }
                        ],
                        labels: [
                            <c:forEach items="${listCateView}" var="o">
                                       "${o.cname}",                                               
                            </c:forEach>
                        ]
                    },
                    options: optionsPie
                };

                pieChart2 = new Chart(ctxPie, configPie);
            }
        }
    </script>
</body>

</html>