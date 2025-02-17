<%-- 
    Document   : Header.jsp
    Created on : 4 thg 10, 2024, 16:02:26
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>JobEntry - Job Portal Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/notification.css"/>
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Navbar Start -->
        <div class="row">
            <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0 ">
                <a href="home" class="navbar-brand d-flex align-items-center text-center py-0 px-4 px-lg-5 col-3">
                    <h1 class="m-0 text-primary">JobEntry</h1>
                </a>
                <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse col-5" id="navbarCollapse">
                    <div class="navbar-nav ms-auto p-4 p-lg-0 ">
                        <a href="home" class="nav-item nav-link active">Home</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Việc làm</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="JobListManage" class="dropdown-item">Tìm việc</a>
                                <a href="listApplicationForSeeker" class="dropdown-item">Việc đang ứng tuyển</a>
                                <a href="listSavejob" class="dropdown-item">Việc đã lưu</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">CV</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <!--                                <a href="CVcreate.jsp" class="dropdown-item">Tạo CV</a>-->
                                <a href="CVupload.jsp" class="dropdown-item">Tải CV</a>
                                <a href="cvManager" class="dropdown-item">Quản lí­ CV</a>
                            </div>
                        </div>
                        <!--                        <div class="nav-item ">
                                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Công ty</a>
                                                </div>-->


<!--                        <div class="dropdown dropdown-menu-start nav-item nav-link">
                            <a href="contact.html" class=" dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-bell bi-arrow-up"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark">
                                <li><a class="dropdown-item active" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Separated link</a></li>
                            </ul>
                        </div>-->
                        <div class="notification-button nav-item nav-link">
                            <span><i class="bi bi-bell bi-arrow-up"></i></span>
                            <div class="notification-dropdown">
                                <div class="notification-header">Thông Báo Mới Nhận</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2" style="margin-right:-50px">
                    <c:set value="${sessionScope.account}" var="account" />

                    <c:if test="${account == null}">
                        <div class="btn btn-primary rounded-0 py-3 px-lg-2 d-none d-sm-block" style="margin-right:20px">
                            <a href="login.jsp" class="text-white text-decoration-none">Đăng nhập</a>
                            <span class="mx-1">|</span>
                            <a href="SignUp.jsp" class="text-white text-decoration-none">Đăng kí</a>
                        </div>
                    </c:if>

                    <c:if test="${account != null}">
                        <c:choose >
                            <c:when test="${account.roleId==1}">
                                <div class="btn-group">
                                    <img src="images/Microsoft_Account_Logo.svg.png" width="20%" alt="alt"  data-bs-toggle="dropdown" aria-expanded="false"/>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="Profile.jsp">Hồ sơ</a></li>
                                        <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item btn-outline-danger" style="color: red" href="logout">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:when test="${account.roleId==2}">
                                <div class="btn-group">
                                    <img src="images/acc3.webp" width="20%" alt="alt"  data-bs-toggle="dropdown" aria-expanded="false"/>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="listJobRecruiter">Quản lí</a></li>
                                        <li><a class="dropdown-item" href="Profile.jsp">Hồ sơ</a></li>
                                        <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item btn-outline-danger" style="color: red" href="logout">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:if>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->
    </body>
</html>
