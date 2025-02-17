<%-- 
    Document   : CVupload
    Created on : 4 thg 10, 2024, 17:07:00
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Upload CV</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .upload-container {
                background-color: #333;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                color: #fff;
            }

            .upload-box {
                border: 2px dashed #666;
                padding: 20px;
                margin-bottom: 15px;
            }

            .upload-box:hover {
                border-color: #fff;
            }

            .btn-upload {
                background-color: #198754;
                border: none;
            }

            .btn-upload:hover {
                background-color: #157347;
            }

            .btn-choose-file {
                background-color: #212529;
                color: white;
                border: none;
            }

            .btn-choose-file:hover {
                background-color: #343a40;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %><br>
        <div class="container mt-5">
            <div class="upload-container" style="background-color:#339999">
                <h5 style="color:#003300"> Tiết kiệm thời gian, tìm việc thông minh, nắm bắt cơ hội và làm chủ đường đua nghề nghiệp của chính mình.</h5>

                <form action="CVupload" enctype="multipart/form-data" method="post">
                    <div class="upload-box">
                        <i class="bi bi-cloud-upload" style="font-size: 2rem;"></i>
                        <p>Tải lên CV từ máy tính, chọn hoặc kéo thả</p>
                        <small>Hỗ trợ định dạng .doc, .docx, .pdf có kích thước dưới 5MB</small>

                        <div class="mt-3">
                            <input type="file" id="cvFile" name="CvFile" class="form-control-file d-none" onchange="displayFileName()">
                            <label class="btn btn-choose-file btn-primary" for="cvFile">Chọn CV</label>
                            <span id="fileName" class="ms-3">Chưa có file nào được chọn</span>
                        </div>

                        <script>
                            function displayFileName() {
                                const fileInput = document.getElementById('cvFile');
                                const fileName = fileInput.files[0] ? fileInput.files[0].name : 'Chưa có file nào được chọn';
                                document.getElementById('fileName').textContent = fileName;
                            }
                        </script>
                    </div>

                    <input class="btn btn-upload btn-primary rounded-0 py-2 px-4" type="submit" value="Tải CV " />
                </form>
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
        <!-- Footer End -->

        <!-- Bootstrap JS (optional) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
