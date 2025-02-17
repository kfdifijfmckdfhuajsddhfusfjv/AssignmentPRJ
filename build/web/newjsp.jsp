<%-- 
    Document   : newjsp
    Created on : 3 thg 10, 2024, 09:23:14
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dropdown Menu</title>
        <!-- Bootstrap 4/5 CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            body {
                background-color: #212529; /* Dark background like in the image */
                color: white; /* Text color */
                font-family: 'Arial', sans-serif;
            }

            .dropdown-menu {
                background-color: #2c2c2e; /* Dark gray for dropdown */
                border: none;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .dropdown-menu a {
                color: white; /* Text color inside dropdown */
            }

            .dropdown-menu a:hover {
                background-color: #3a3b3c; /* Hover effect */
            }

            .dropdown-toggle::after {
                display: none; /* Hide default Bootstrap dropdown icon */
            }

            .dropdown-profile {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .dropdown-profile img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <div class="dropdown text-right">
                <!-- Profile Icon with Dropdown -->
                <div class="dropdown-profile dropdown-toggle" data-toggle="dropdown">
                    <img src="https://via.placeholder.com/40" alt="Profile Picture">
                    <span>My Profile</span>
                </div>

                <!-- Dropdown Menu -->
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">GPT của tôi</a>
                    <a class="dropdown-item" href="#">Tùy chỉnh ChatGPT</a>
                    <a class="dropdown-item" href="#">Cài đặt</a>
                    <a class="dropdown-item" href="#">Nâng cấp gói</a>
                    <div class="dropdown-divider"></div> <!-- Divider line -->
                    <a class="dropdown-item" href="#">Đăng xuất</a>
                </div>
            </div>
        </div>

        <!-- Bootstrap 4/5 JS + jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
