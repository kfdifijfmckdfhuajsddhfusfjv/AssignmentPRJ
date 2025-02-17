<%-- 
    Document   : AddNewJob
    Created on : 27 thg 10, 2024, 15:37:47
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
    </head>
    <body>

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Daskboard</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <a href="home" class="ms-auto">
                <i style="color: greenyellow" class="fa-solid fa-house "></i>Home
            </a>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" class="">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="listJobRecruiter">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Property
                            </a>
                            <div class="divider"></div>
                            <a class="nav-link" href="AddNewJob.jsp">
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
            <c:set value="${requestScope.jobId}" var="jobId"/>
            <div class="popup-content m-lg-4 mt-5" style="width: 90%">
                <form action="addNewJob" method="post">
                    <input type="hidden" name ="jobId">
                    <c:set value="${requestScope.listCategory}"  var="listC"/>
                    <div class="mb-3">
                        <select name="category" required>
                            <c:forEach items="${listC}" var="cate">
                                <option value="${cate.categoryId}">${cate.categoryName}</option>
                            </c:forEach>
                        </select><br>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputName">Job Title</label>
                                <input type="text" class="form-control" id="inputName" name="title" required>
                            </div>
                        </div>                
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputEmail">Salary</label>
                                <input type="number" class="form-control " name="salary" required>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputPhone">Time</label>
                                <input type="text" class="form-control" name="time"  required >
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputPhone">Experience</label>
                                <input type="text" class="form-control" name="experience" required>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputPhone">Number need</label>
                                <input type="number" class="form-control" name="numberneed"  required>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="inputPhone">Skills</label>
                                <input type="text" class="form-control" name="skill" id="inputPhone"  required>
                            </div>
                        </div>
                    </div>            
                    <div class="form-group">
                        <label for="inputSubject">Requirement</label>
                        <input type="text"  class="form-control" name="requirement" id="inputSubject"  required>
                    </div>
                    <div class="form-group">
                        <label for="inputMessage">Description</label>
                        <textarea class="form-control" name="description" rows="5" required></textarea>
                    </div>
                    <br>
                    <div class="text-center">
                        <input type="submit" value="Add" class="btn btn-outline-primary w-70">
                    </div>
                </form>
            </div>       
        </div>
    </body>
</html>
