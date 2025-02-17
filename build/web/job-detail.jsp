<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/popup.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <%@include file="Header.jsp" %>

            <!-- Header End -->
            <div class="container-xxl py-5 bg-dark page-header mb-5">
                <div class="container my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Job Detail</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Job Detail</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- Header End -->

            <c:set value="${requestScope.jobgetById}" var="job" />
            <!-- Job Detail Start -->
            <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container row">

                    <div class="col-8">
                        <div class="d-flex align-items-center mb-5">
                            <img class="flex-shrink-0 img-fluid border rounded" src="${job.company.logoCompany}" alt="" style="width: 80px; height: 80px;">
                            <div class="text-start ps-4">
                                <h3 class="mb-3 text-center text-uppercase text-primary font-weight-bold border-bottom pb-2">${job.jobTitle}</h3>
                                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>${job.company.city}</span>
                                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${job.salary}</span>
                            </div>
                        </div>

                        <div class="mb-5 p-4 bg-white rounded shadow-lg">
                            <h3 class="mb-3  border-bottom pb-2">Job Description</h3>
                            <p class="text-justify text-muted">${job.jobDescription}</p>

                            <h3 class="mb-3  border-bottom pb-2">Requirement</h3>
                            <p class="text-justify text-muted">${job.requirements}</p>

                            <h3 class="mb-3  border-bottom pb-2">Skills</h3>
                            <p class="text-justify text-muted">${job.skills}</p>

                            <h3 class="mb-3 border-bottom pb-2">Experiences</h3>
                            <p class="text-justify text-muted">${job.experience}</p>
                        </div>

                    </div>
                    <div class="col col-4">
                        <div >
                            <div class="bg-light shadow-sm rounded p-lg-5 mb-4 wow slideInUp" data-wow-delay="0.1s">
                                <h4 class="mb-4 text-start text-success">Job Summery</h4>
                                <p><i class="fa fa-angle-right text-primary me-2"></i>Need: ${job.numberOfSeeker}</p>
                                <p><i class="fa fa-angle-right text-primary me-2"></i>Salary:${job.salary}</p>
                                <p><i class="fa fa-angle-right text-primary me-2"></i>Location: ${job.company.city}</p>
                            </div>
                        </div>
                        <div >
                            <div class="bg-light shadow-sm rounded p-lg-5 mb-4 wow slideInUp" data-wow-delay="0.1s">
                                <h4 class="mb-4 text-start text-success">Company Detail</h4>
                                <div class="row">
                                    <img class="col-5 border-dark" src="${job.company.logoCompany}" width="40%" alt="alt"/>
                                    <h4 class="col-5 text-center text-success" style="margin-top: 35px">${job.company.companyName}</h4>
                                </div><br>
                                <p><i class="fa fa-angle-right text-primary me-2"></i>Position: ${job.company.address},${job.company.district},${job.company.city}</p>
                                <a href="${job.company.website}" target="_blank">
                                    <i class="fa fa-angle-right text-primary me-2"></i>Website: ${job.company.website}
                                </a>

                            </div>
                        </div>
                    </div>

                    <h4 class="mb-4">Apply For The Job</h4>
                    <!--                    <form>
                                            <div class="row g-3">
                                                <div class="col-12 col-sm-6">
                                                    <input type="text" class="form-control" placeholder="Your Name">
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <input type="email" class="form-control" placeholder="Your Email">
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <input type="text" class="form-control" placeholder="Portfolio Website">
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <input type="file" class="form-control bg-white">
                                                </div>
                                                <div class="col-12">
                                                    <textarea class="form-control" rows="5" placeholder="Coverletter"></textarea>
                                                </div>
                                            </div>
                                        </form>-->
                    <c:set value="${sessionScope.account}" var="user" />
                    <c:if test="${user.roleId==2}">
                        <input class="btn btn-primary w-100" type="button" value="Apply now" disabled="disabled" />
                    </c:if>
                    <c:if test="${user.roleId==1}">
                        <c:if test="${empty requestScope.mess}">
                            <div class="col-12">
                                <a id="applyButton" class="btn btn-primary w-100">Apply now</a>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.mess =='exist'}">
                            <div class="col-12">
                                <a id="applyButton" class="btn btn-primary w-100">Apply Again</a>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.mess =='accept'}">
                            <div class="col-12">
                                <a  class="btn btn-primary w-100">Accepted</a>
                            </div>
                        </c:if>
                    </c:if>

                    <c:set value="${requestScope.listCV}" var="listCV"/>
                    <div id="popup" style="display:none;">
                        <div class="popup-content">
                            <h2>${job.jobTitle} in ${job.company.companyName}</h2>
                            <p>Lưu ý: Việc ứng tuyển nhiều lần sẽ giảm độ chuyên nghiệp của bạn trong mắt nhà tuyển dụng...</p>

                            <form action="Apply">
                                <label>Chọn CV để ứng tuyển:</label><br>
                                <input type="hidden" name ="jobID" value="${job.jobId}">

                                <c:forEach var="cv" items="${listCV}">
                                    <div class="col-md-6 mb-2">
                                        <div class="card h-10 shadow-sm" style="background-color: #a3f0d6" >
                                            <div class="card-body d-flex justify-content-between align-items-center">
                                                <!-- Radio button để chọn CV, hiển thị cùng trên một dòng -->
                                                <div class="form-check">
                                                    <input type="radio" id="cv${cv.cvId}" name="cvId" value="${cv.cvId}" class="form-check-input" required>
                                                </div>
                                                <h2 class="cv-link-title">${cv.cvLink}</h2>
                                                <!-- Xem CV dưới dạng PDF -->
                                                <a href="readfile?cvId=${cv.cvId}" target="_blank" class="btn btn-outline-info">
                                                    <i class="fas fa-eye"></i> Xem CV
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <!-- Nút nộp hồ sơ -->
                                <input type="submit" value="Nộp hồ sơ ứng tuyển" class="btn btn-outline-primary w-100">
                            </form>

                            <!-- Nút đóng popup -->

                            <input type="button" id="closePopup" class="btn btn-outline-danger" value="Đóng">
                        </div>
                    </div>

                    <script>
                        // Sự kiện hiển thị popup khi nhấn nút "Nộp hồ sơ"
                        document.getElementById('applyButton').addEventListener('click', function () {
                            document.getElementById('popup').style.display = 'block';
                        });

                        // Sự kiện đóng popup khi nhấn nút "Đóng"
                        document.getElementById('closePopup').addEventListener('click', function () {
                            document.getElementById('popup').style.display = 'none';
                            event.preventDefault();
                        });
                        //                                            document.querySelector('form').addEventListener('submit', function (event) {
                        //                                                // Ẩn popup sau khi form nộp xong
                        //                                                document.getElementById('popup').style.display = 'none';
                        //                                            });
                    </script>
                </div>
                <!--        Relate Job-->
                <c:set value="${requestScope.listRelate}" var="listJobRelate"/>
                <h2 class="text-primary ms-3 mt-5 mb-3">Related Jobs</h2>              
                <div class="row g-4">
                    <c:forEach items="${listJobRelate}" var="jobRelate">
                        <div class="col-md-3">
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img class="me-3 border rounded" src="${jobRelate.company.logoCompany}" style="width: 60px; height: 60px;" alt="Company Logo">
                                        <div>
                                            <a href="JobDetail?jobId=${jobRelate.jobId}" class="card-title h5 text-success text-decoration-none">${jobRelate.jobTitle}</a>
                                            <h6 class="card-subtitle text-muted">Company: ${jobRelate.company.companyName}</h6>
                                        </div>
                                    </div>
                                    <p class="mb-2"><i class="fa fa-clock text-primary me-2"></i>Time: ${jobRelate.position}</p>
                                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-2"></i>${jobRelate.company.city}</p>
                                    <p><i class="far fa-money-bill-alt text-primary me-2"></i>${jobRelate.salary}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Job Detail End -->

            <!-- Footer Start -->
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
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>