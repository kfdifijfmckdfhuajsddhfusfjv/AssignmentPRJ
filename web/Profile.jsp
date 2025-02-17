<%-- 
    Document   : Profile
    Created on : 23 thg 10, 2024, 10:41:42
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <link href="css/login.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    </head>
    <body>

        <%@include file="Header.jsp" %><br>
        <div class="app-wrapper">
            <div class="app-content pt-3 p-md-3 p-lg-8">
                <div class="container-xl custom-container"> <!-- Thêm class custom-container -->
                    <div class="row gy-4">
                        <!-- Phần Thông tin người dùng -->
                        <div class="col-6 col-lg-6">
                            <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
                                <div class="app-card-header p-3 border-bottom-0">
                                    <div class="row align-items-center gx-3">
                                        <div class="col-auto">
                                            <div class="app-icon-holder">
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                                </svg>
                                            </div><!--//icon-holder-->
                                        </div><!--//col-->
                                        <div class="col-auto">
                                            <h4 class="app-card-title">Thông tin người dùng</h4>
                                        </div><!--//col-->
                                    </div><!--//row-->
                                </div><!--//app-card-header-->
                                <c:set value="${sessionScope.account}" var="user" />
                                <div class="app-card-body px-4 w-100">
                                    
                           
                                    <form action="updateprofileforseeker"  method="post">
                                        <input type="hidden" name="userId" class="form-control" value="${user.userId}">
                                        <div class="item border-bottom py-3">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-4">
                                                    <div class="item-label"><strong>Họ</strong></div>
                                                    <input type="text" name="firstname" class="form-control border-0" placeholder="Họ" value="${user.firstName}">
                                                </div><!--//col-->
                                                <div class="col-4">
                                                    <div class="item-label"><strong>Tên</strong></div>
                                                    <input type="text" name="lastname" class="form-control border-0" placeholder="Tên" value="${user.lastName}">
                                                </div>
                                                <div class="col-4">
                                                    <div class="item-label"><strong>Tên đăng nhập</strong></div>
                                                    <input type="text" name="username" class="form-control border-0" placeholder="Tên đăng nhập" value="${user.userName}">
                                                </div><!--//col-->
                                            </div><!--//row-->
                                        </div>
                                        <div class="item border-bottom py-3">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-6">
                                                    <div class="item-label"><strong>Ngày sinh</strong></div>
                                                    <input type="date" id="dateofbirth" name="dateofbirth" class="form-control border-0" placeholder="Nhập ngày sinh" value="${user.dateOfBirth}">
                                                </div><!--//col-->
                                                <div class="col-6">
                                                    <div class="item-label"><strong>Giới tính</strong></div>
                                                    <select name="gender" class="form-control border-0">
                                                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Nam</option>
                                                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                                    </select>
                                                </div><!--//col-->
                                            </div><!--//row-->
                                        </div>
                                        <div class="item border-bottom py-3">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-6">
                                                    <div class="item-label"><strong>Số điện thoại</strong></div>
                                                    <c:if test="${not empty requestScope.errorPhone}">
                                                        <div class="text-danger">${requestScope.errorPhone}</div>
                                                    </c:if>
                                                    <input type="text" name="phone" class="form-control border-0" placeholder="Nhập số điện thoại" value="${user.phone}">
                                                </div><!--//col-->
                                                <div class="col-6">
                                                    <div class="item-label"><strong>Email</strong></div>
                                                    <c:if test="${not empty requestScope.errorEmail}">
                                                        <div class="text-danger">${requestScope.errorEmail}</div>
                                                    </c:if>
                                                    <input type="email" id="email" name="email" class="form-control border-0" placeholder="Nhập email" value="${user.email}">
                                                </div>
                                            </div><!--//row-->
                                        </div>
                                        <div class="item border-bottom py-3">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-12">
                                                    <div class="item-label"><strong>Địa chỉ</strong></div>
                                                    <input type="text" name="address" class="form-control border-0" placeholder="Nhập địa chỉ" value="${user.address}">
                                                </div><!--//col-->
                                            </div><!--//row-->
                                        </div>
                                        <div class="app-card-footer p-4 mt-auto d-flex justify-content-center">
                                            <button type="submit" class="btn btn-outline-primary">Cập nhật</button>
                                            <a href="home" class="ms-2">
                                                <button type="button" class="btn btn-outline-dark">Trang chủ</button>
                                            </a>
                                        </div>

                                    </form>
                                </div><!--//app-card-body-->
                            </div><!--//app-card-->
                        </div><!--//col-->

                        <script src="${pageContext.request.contextPath}/assets/plugins/popper.min.js"></script>
                        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <h1 class="text-center mb-5">Our Clients Say!!!</h1>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item bg-light rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-1.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">Client Name</h5>
                                <small>Profession</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-2.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">Client Name</h5>
                                <small>Profession</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-3.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">Client Name</h5>
                                <small>Profession</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>Dolor et eos labore, stet justo sed est sed. Diam sed sed dolor stet amet eirmod eos labore diam</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-4.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">Client Name</h5>
                                <small>Profession</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Company</h5>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Contact</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 

                            <!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
