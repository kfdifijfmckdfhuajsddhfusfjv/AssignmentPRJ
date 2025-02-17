<%-- 
    Document   : Chart
    Created on : 28 thg 10, 2024, 09:15:43
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/daskboard.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <link rel="stylesheet" href="css/layoutSide.css"/>
        <link rel="stylesheet" href="css/popupEdit.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <script src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Daskboard</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <a href="home" class="ms-auto">
                <i class="fa-solid fa-house"></i>Home
            </a>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="listJobRecruiter">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Property
                            </a>
                            <div class="divider"></div>
                            <a class="nav-link" href="prepareForAddNew">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Add new 
                            </a>
                            <div class="divider"></div>
                            <a class="nav-link" href="chart">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Chart
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="container mt-4 ">
                <div class="row">  
                    <div style="font-size: xx-large; font-weight: bolder; margin-left: 450px" class="col-12 form-control-lg text-success">
                        Statistical
                    </div>                    
                    <div class="col-5 shadow-sm m-4 p-4 bg-light rounded-4">
                        <div id="myChart" style="width:100%; max-width:600px; height:500px;">
                            <script>
                                google.charts.load('current', {'packages': ['corechart']});
                                google.charts.setOnLoadCallback(drawChart);
                                function drawChart() {

                                    // Set Data
                                    const data = google.visualization.arrayToDataTable([
                                    ['Category', 'Amount'],
                                <c:forEach var="row" items="${list}" varStatus="rowStatus">
                                    ['${row[0]}', ${row[1]}]<c:if test="${!rowStatus.last}">,</c:if>
                                </c:forEach>
                                    ]);

                                    // Set Options
                                    const options = {
                                        title: 'BIểu đồ về phần bố công việc theo thẻ loại',
                                        is3D: true,
                                        titleTextStyle: {
                                            color: '#2E4053',
                                            fontSize: 18,
                                            bold: true
                                        },
                                        backgroundColor: '#f8f9fa',
                                        legend: {
                                            position: 'bottom',
                                            textStyle: {color: '#4a4a4a', fontSize: 14}
                                        },
                                    };

                                    // Draw
                                    const chart = new google.visualization.PieChart(document.getElementById('myChart'));
                                    chart.draw(data, options);
                                }
                            </script>
                        </div>
                    </div>

                    <div class="col-5 shadow-sm m-4 p-4 bg-light rounded-4">
                        <div id="myChart1" style="width:100%; max-width:600px; height:500px;">
                            <script>
                                google.charts.load('current', {'packages': ['corechart']});
                                google.charts.setOnLoadCallback(drawChart);
                                function drawChart() {

                                    // Set Data
                                    const data = google.visualization.arrayToDataTable([
                                    ['Status', 'Amount'],
                                <c:forEach var="row" items="${listS}" varStatus="rowStatus">
                                    ['${row[0]}', ${row[1]}]<c:if test="${!rowStatus.last}">,</c:if>
                                </c:forEach>
                                    ]);

                                    // Set Options
                                    const options = {
                                        title: 'Biểu đồ tổng hợp CV applied',
                                        is3D: true,
                                        titleTextStyle: {
                                            color: '#2E4053',
                                            fontSize: 18,
                                            bold: true
                                        },
                                        backgroundColor: '#f8f9fa',
                                        legend: {
                                            position: 'bottom',
                                            textStyle: {color: '#4a4a4a', fontSize: 14}
                                        },

                                    };

                                    // Draw
                                    const chart = new google.visualization.PieChart(document.getElementById('myChart1'));
                                    chart.draw(data, options);
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
