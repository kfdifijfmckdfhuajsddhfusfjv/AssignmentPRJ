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
        <style>
            /* Button style */
            .btn-info {
                padding: 10px 20px;
                background-color: #17a2b8;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                text-decoration: none;
            }

            /* Popup background overlay */
            .popup-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 999;
                justify-content: center;
                align-items: center;
            }

            /* Popup box styling */
            .popup-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 400px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Profile card styling */
            .profile-card {
                font-family: Arial, sans-serif;
            }

            .profile-card h3 {
                font-size: 20px;
                margin-bottom: 20px;
                text-align: left;
            }

            .profile-card .info-group {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                font-size: 14px;
            }

            .profile-card .info-group .label {
                font-weight: bold;
                color: #555;
            }

            /* Close button styling */
            .close-btn {
                border: none;
                font-size: 50px;
                cursor: pointer;
                position: absolute;
                top: 10px;
                right: 10px;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    </head>
    <body>
        <c:set value="${requestScope.listApplication}" var="list"/>
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
            <div class="container mt-4 ">
                <form action="jobApplicationRecruiter" class="col-3 ms-auto" id="statusForm" >
                    <input type="hidden" name="jobId" value="${jobId}">
                    <select class="form-select" aria-label="Status" name="status" onchange="document.getElementById('statusForm').submit();">
                        <option selected>--Select--</option>
                        <option value="All" >All</option>
                        <option value="Pending" >Pending</option>
                        <option value="Accept">Accepted</option>
                        <option value="Reject">Rejected</option>
                    </select>
                </form>
                <c:if test="${empty list}">
                    <h2 class="text-center text-bg-secondary mt-5">No application for the job</h2>
                </c:if>
                <div class="row">
                    <c:forEach items="${list}" var="app">
                        <div class="col-md-4 mb-2 " style="height:30%"> <!-- Thay đổi cột cho responsive -->
                            <div class="card shadow-lg">
                                <div class="card-body text-center">
                                    <a>
                                        <h4 class="card-title text-success text-center" style="text-decoration: none" >${app.job.jobTitle}</h4>
                                    </a>
                                    <h6 class="card-subtitle mb-2 text-muted">Seeker name:${app.cv.jobseeker.user.firstName} ${app.cv.jobseeker.user.lastName}</h6>
                                    <p>Date Submit: ${app.submitDate}</p>
                                    <iframe src="${app.cv.cvLink}" height="50%" width="90%"></iframe>
                                    <a class="btn btn-outline-primary" href="readfile?cvId=${app.cv.cvId}" target="_blank">View CV</a>

                                    <c:if test="${app.status=='Pending'}">
                                        <div class="mb-3 mt-2"> <!-- Thêm khoảng cách cho biểu tượng -->
                                            <a class="btn btn-outline-success " href="jobDecide?decide=Accept&&appId=${app.applicationId}" >Accept</a>
                                            <a class="btn btn-outline-danger" href="jobDecide?decide=Reject&&appId=${app.applicationId}">Reject</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${app.status=='Accept'}">
                                        <div class="mb-3 mt-2">
                                            <a class="btn btn-success">Accepted</a>
                                            <a class="btn btn-info" onclick="openPopup()">View Seeker Detail</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${app.status=='Reject'}">
                                        <div class="mb-3 mt-2">
                                            <a class="btn btn-danger">Rejected</a>
                                        </div>
                                    </c:if>
                                    <div class="popup-overlay" id="popupOverlay">
                                        <div class="popup-content">
                                            <!-- Close Button -->
                                            <button class="close-btn btn-outline-dark" onclick="closePopup()">×</button>

                                            <!-- Profile Card Inside Popup -->
                                            <div class="profile-card">
                                                <h3>Profile Information</h3>
                                                <div class="info-group">
                                                    <div class="label">Full Name</div>
                                                    <div>${app.cv.jobseeker.user.firstName} ${app.cv.jobseeker.user.lastName}</div>
                                                </div>
                                                <div class="info-group">
                                                    <div class="label">Email</div>
                                                    <div>${app.cv.jobseeker.user.email}</div>
                                                </div>
                                                <div class="info-group">
                                                    <div class="label">Phone</div>
                                                    <div>${app.cv.jobseeker.user.phone}</div>
                                                </div>
                                                <div class="info-group">
                                                    <div class="label">Gender</div>
                                                    <div>${app.cv.jobseeker.user.gender}</div>
                                                </div>
                                                <div class="info-group">
                                                    <div class="label">Address</div>
                                                    <div>${app.cv.jobseeker.user.address}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        function openPopup() {
                                            document.getElementById("popupOverlay").style.display = "flex";
                                        }

                                        function closePopup() {
                                            document.getElementById("popupOverlay").style.display = "none";
                                        }
                                    </script>
                                </div>
                            </div>
                        </div><br>
                    </c:forEach>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
