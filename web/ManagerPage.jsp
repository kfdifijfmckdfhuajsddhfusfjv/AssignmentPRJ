<%-- 
    Document   : ManagerPage
    Created on : 24 thg 10, 2024, 12:02:29
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
    </head>
    <body>
        <c:set value="${requestScope.listJobRecruiter}" var="list"/>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="listJobRecruiter">Daskboard</a>
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
                    <c:forEach items="${list}" var="job">
                        <div class="col-md-4 mb-4 "> <!-- Thay đổi cột cho responsive -->
                            <div class="card shadow-lg">
                                <div class="card-body text-center">
                                    <div class="row">
                                        <img class="col-3" src="${job.company.logoCompany}" width="100%" alt="alt"/>
                                        <a class="col-9" href="jobApplicationRecruiter?jobId=${job.jobId}" >
                                            <h5 class="card-title text-success text-start mt-3" style="text-decoration: none" >${job.jobTitle}</h5>
                                        </a>
                                    </div>
                                    <br>
                                    <h6 class="card-subtitle mb-2 text-muted">Company:${job.company.companyName}</h6>
                                    <p>Time: ${job.position}</p>
                                    <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>${job.company.companyName}</span>
                                    <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${job.salary}</span>
                                    <br>
                                    <div class="mb-3 mt-2"> <!-- Thêm khoảng cách cho biểu tượng -->
                                        <a class="btn btn-outline-success applyButton" >Edit</a>
                                        <a class="btn btn-outline-danger" href="deleteJobRecruiter?jobId=${job.jobId}"> Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div><br>

                        <div class="popup" style="display:none;">
                            <div class="popup-content">
                                <h2 class="text-capitalize text-xxl-center text-success">${job.jobTitle} in ${job.company.companyName}</h2>
                                <form action="updatejob" method="post">
                                    <input type="hidden" name ="jobId" value="${job.jobId}">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputName">Job Title</label>
                                                <input type="text" class="form-control" id="inputName" name="title" value="${job.jobTitle}" >
                                            </div>
                                        </div>                
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputEmail">Salary</label>
                                                <input type="number" class="form-control " name="salary" id="inputEmail" value="${job.salary}" >
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputPhone">Time</label>
                                                <input type="text" class="form-control" name="time" id="inputPhone" value="${job.position}" >
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputPhone">Experience</label>
                                                <input type="text" class="form-control" name="experience" id="inputPhone" value="${job.experience}" >
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputPhone">Number need</label>
                                                <input type="text" class="form-control" name="numberneed" id="inputPhone" value="${job.numberOfSeeker}" >
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="inputPhone">Skills</label>
                                                <input type="text" class="form-control" name="skill" id="inputPhone" value="${job.skills}" >
                                            </div>
                                        </div>
                                    </div>            
                                    <div class="form-group">
                                        <label for="inputSubject">Requirement</label>
                                        <input type="text"  class="form-control" name="requirement" id="inputSubject" value="${job.requirements}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMessage">Description</label>
                                        <textarea class="form-control" id="inputMessage" name="description" rows="5" >${job.jobDescription}</textarea>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" value="Edit" class="btn btn-outline-primary w-70">
                                        <!-- Nút đóng popup -->
                                        <input type="button" class="btn btn-outline-danger closePopup w-70" value="Đóng">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <script>
                            // Lấy tất cả các nút "applyButton" và "popup"
                            document.addEventListener('DOMContentLoaded', function () {
                                const applyButtons = document.querySelectorAll('.applyButton');
                                const popups = document.querySelectorAll('.popup');
                                const closeButtons = document.querySelectorAll('.closePopup');

                                // Duyệt qua từng nút "applyButton"
                                applyButtons.forEach((button, index) => {
                                    button.addEventListener('click', function () {
                                        // Ẩn tất cả các popup trước
                                        popups.forEach(popup => popup.style.display = 'none');

                                        // Hiển thị popup tương ứng với nút đã nhấn
                                        popups[index].style.display = 'block';
                                    });
                                });

                                // Duyệt qua từng nút "closePopup"
                                closeButtons.forEach((button, index) => {
                                    button.addEventListener('click', function () {
                                        // Đóng popup tương ứng khi nhấn nút đóng
                                        popups[index].style.display = 'none';
                                    });
                                });
                            });
                        </script>

                    </c:forEach>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
