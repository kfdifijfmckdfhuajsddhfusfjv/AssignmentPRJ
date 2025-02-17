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
        <link rel="stylesheet" href="css/notification.css"/>
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/category.css"/>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/ToastAlert.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!--        <style>
                    /* Đổi màu trái tim khi được bấm */
                    .active i {
                        color: #00ff00 !important; /* Màu xanh lá khi trái tim sáng lên */
                    }
        
                    /* Màu trái tim ban đầu */
                    .btn-light i {
                        color: green !important; /* Màu xám ban đầu cho trái tim */
                    }
                </style>-->
        <style>
            .heart-icon i {
                color: gray;
                cursor: pointer;
            }

            .heart-icon i.saved {
                color: red; /* Màu sáng khi đã lưu */
            }
            .cat-item {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
            }
        </style>
        <style>
            /* CSS cho modal */
            .modal {
                display: none; /* Ẩn modal mặc định */
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Nền mờ */
                justify-content: center;
                align-items: center;
            }
            /* CSS cho modal-content */
            .modal-content {
                background-color: #2d2d2d;
                padding: 20px;
                border-radius: 10px;
                color: white;
            }
            .close {
                color: #aaa;
                font-size: 28px;
                cursor: pointer;
            }
            .close:hover {
                color: white;
            }
        </style>
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <!--            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>-->
            <!-- Spinner End -->
            <!--Header-->     
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
                            <c:set value="${requestScope.listNotification}" var="listNotification"/>
                            <c:if test="${not empty sessionScope.account}">
                                <div class="notification-button nav-item nav-link">
                                    <span><i class="bi bi-bell bi-arrow-up"></i></span>
                                    <div class="notification-dropdown">
                                        <div class="notification-header">Thông Báo</div>
                                        <c:forEach items="${listNotification}" var="noti">
                                            <div class="notification-item">
                                                <div class="notification-item-content">
                                                    <p>${noti.message}</p>
                                                    <span style="font-size: x-small">Date: ${noti.messageDate}</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
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
            <!--            Header End-->
            <c:set value="${requestScope.listOfJob}" var="listOfJob" />

            <!-- Search Start -->
            <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;" >
                <div class="container">
                    <form action="JobListManage">
                        <div class="row g-2">
                            <div class="col-md-10">
                                <div class="row g-2">
                                    <div class="col-md-4">
                                        <select class="form-select border-0" name="categoryOFjob">
                                            <option value="null" selected>Category</option>
                                            <c:forEach items="${requestScope.listCategory}" var="cate">
                                                <option  value="${cate.categoryId}"> ${cate.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-4">
                                        <select class="form-select border-0" name="locationOFjob">
                                            <option value="null" selected>Location</option>
                                            <c:forEach items="${requestScope.listcity}" var="city">
                                                <option  value="${city}">${city}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-select border-0" name="salaryRange">
                                            <option value="null" selected>Salary</option>
                                            <option value="1">1000-1500</option>
                                            <option value="2">1500-2000</option>
                                            <option value="3">2000-2500</option>
                                            <option value="4">2500-3000</option>
                                            <option value="5">More than 3000</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-dark border-0 w-100">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Search End -->

            <!-- Category Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Explore By Category</h1>
                    <div class="row p-3" style="background-color: white">
                        <c:forEach items="${requestScope.listCategory}" var="cate" varStatus="status">
                            <c:set var="cnt" value="${requestScope.listCount[status.index]}" />
                            <div class="col-lg-3 col-sm-6 wow fadeInUp mb-4" data-wow-delay="0.1s" >
                                <a class="cat-item rounded p-4" style="background-color: #ddede1" href="ListCategory?categoryId=${cate.categoryId}">
                                    <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                                    <h6 class="mb-3 text-success">${cate.categoryName}</h6>
                                    <span>
                                        <p class=""> ${cnt} việc làm</p>
                                    </span>
                                </a>
                            </div>
                            <!--                            <div class="col-3 mb-4">
                                                            <div class="job-card wow fadeInUp ">
                                                                <div class="job-icon">
                                                                    <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>                           
                                                                </div>
                                                                <div class="job-info">
                                                                    <a class="card-item  p-4" href="ListCategory?categoryId=${cate.categoryId}">
                                                                        <h6 class="mb-3">${cate.categoryName}</h6>
                                                                    </a>                                  
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Category End -->

            <!-- Jobs Start -->
            <div class="container">
                <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Job Listing</h1>
                <button class="open-button btn btn-primary" onclick="toggleModal()">Danh mục Nghề</button>

                <!-- Modal -->

                <form action="" class="modal-content row p-4">
                    <!-- Phần danh sách checkbox -->
                    <div id="categoryModal" class="modal col-md-4">
                        <div class="modal-header">
                            <h2>Chọn Nhóm nghề, Nghề hoặc Chuyên môn</h2>
                            <span class="close" onclick="toggleModal()">&times;</span>
                        </div>

                        <div class="checkbox-list mt-3">
                            <c:forEach items="${requestScope.listCategory}" var="cate">
                                <div class="checkbox-item form-check">
                                    <input type="checkbox" name="name" class="form-check-input" value="${cate.categoryId}" id="cate-${cate.categoryId}">
                                    <label class="form-check-label" for="cate-${cate.categoryId}">${cate.categoryName}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Phần nhập tên công việc -->
                    <div class="col-md-6 d-flex align-items-center">
                        <input type="text" name="jobName" class="form-control" placeholder="Job name, company name">
                    </div>
                </form>
                <script>
                    function toggleModal() {
                        const modal = document.getElementById("categoryModal");
                        // Toggle modal hiển thị hoặc ẩn
                        modal.style.display = (modal.style.display === "none" || modal.style.display === "") ? "flex" : "none";
                    }

                    // Đóng modal khi nhấp ra ngoài
                    window.onclick = function (event) {
                        const modal = document.getElementById("categoryModal");
                        if (event.target === modal) {
                            modal.style.display = "none";
                        }
                    };
                </script>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">

                    <c:if test="${empty listOfJob}">
                        <p>No jobs available.</p>
                    </c:if>

                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="job-item p-4 mb-4">
                                <c:forEach items="${listOfJob}" var="job">
                                    <div class="job-item p-4 mb-4">
                                        <div class="row g-4">
                                            <div class="col-sm-12 col-md-8 d-flex align-items-center" >
                                                <img class="flex-shrink-0 img-fluid border rounded" src="${job.company.logoCompany}" alt="" style="width: 80px; height: 80px;">
                                                <div class="text-start ps-4">
                                                    <h5 class="mb-3"> 
                                                        <a href="JobDetail?jobId=${job.jobId}">
                                                            ${job.jobTitle}
                                                        </a>
                                                    </h5>
                                                    <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>${job.company.companyName}</span>
                                                    <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>${job.company.location}</span>
                                                    <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${job.salary}</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                                <div class="d-flex mb-3">
                                                    <!-- Icon trái tim, với thuộc tính data-job-id để lưu trữ ID của công việc -->
                                                    <span class="heart-icon align-items-center" data-job-id="${job.jobId}" onclick="toggleSaveJob(this)">
                                                        <i class="fa fa-heart ${isSaved ? 'saved' : ''}"></i>
                                                    </span>
                                                    <div id="toast" class="toast" style="display: none; position: fixed; top: 20px; right: 20px; background-color: #28a745; color: white; padding: 10px; border-radius: 5px;">
                                                        Job already saved!
                                                    </div>

                                                    <script>
                                                        function toggleSaveJob(element) {
                                                            console.log("Trái tim đã được bấm!");
                                                            var jobId = element.getAttribute('data-job-id');
                                                            var isSaved = element.querySelector('i').classList.contains('saved');

                                                            // Gửi AJAX request để lưu hoặc bỏ lưu công việc
                                                            var xhr = new XMLHttpRequest();
                                                            xhr.open("POST", "savejob", true);
                                                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                                                            xhr.onreadystatechange = function () {
                                                                if (xhr.readyState === 4 && xhr.status === 200) {
                                                                    // Phân tích phản hồi từ server
                                                                    var response = JSON.parse(xhr.responseText); // Giả sử server trả về JSON {"isSaved": true/false}

                                                                    // Cập nhật trạng thái của trái tim dựa trên phản hồi từ server
                                                                    if (response.isSaved) {
                                                                        element.querySelector('i').classList.add('saved'); // Trái tim sáng lên khi đã lưu
                                                                        showToast("Job saved successfully!");
                                                                    } else {
                                                                        element.querySelector('i').classList.remove('saved'); // Trái tim mất màu khi chưa lưu
                                                                        showToast("Job already saved");
                                                                    }
                                                                }
                                                            };

                                                            // Gửi thông tin về trạng thái hiện tại (đã lưu hay chưa)
                                                            xhr.send("jobId=" + jobId + "&save=" + !isSaved);
                                                        }
                                                        function showToast(message) {
                                                            var toast = document.getElementById("toast");
                                                            toast.innerText = message;
                                                            toast.classList.add("show");
                                                            toast.style.display = 'block'; // Hiển thị toast
                                                            console.log("Toast message: " + message); // Thêm log để kiểm tra
                                                            // Ẩn thông báo sau 3 giây
                                                            setTimeout(function () {
                                                                toast.classList.remove("show");
                                                            }, 3000);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <ul class="pagination justify-content-center">
                                    <c:forEach begin="1" end="${requestScope.pageNum}" var="i">
                                        <li class="page-item <c:if test='${i == requestScope.currentPage}'>active</c:if>">
                                            <a class="page-link m-lg-1" href="home?page=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
                         Thư viện font-awesome cho icon 
                        <script>
                            document.querySelectorAll('.like-button').forEach(button => {
                                button.addEventListener('click', function () {
                                    const jobId = this.getAttribute('data-job-id');
            
                                    // Thay đổi biểu tượng trái tim khi người dùng nhấn
                                    if (this.classList.toggle('liked')) {
                                        this.innerHTML = '<i class="fas fa-heart"></i>'; // Trái tim đầy
                                        // Thêm mã xử lý yêu thích công việc ở đây, như gửi đến server
                                        HttpServe
                                        console.log(`Yêu thích công việc với ID: ${jobId}`);
                                    } else {
                                        this.innerHTML = '<i class="far fa-heart"></i>'; // Trái tim rỗng
                                        // Xử lý khi hủy yêu thích công việc ở đây
                                        console.log(`Hủy yêu thích công việc với ID: ${jobId}`);
                                    }
                                });
                            });
                        </script>-->
            <!-- Jobs End -->


            <!-- Testimonial Start -->
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
            <!-- Testimonial End -->


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