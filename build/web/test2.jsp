<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .navbar-custom {
                background-color: #009999; /* Dark background */
                border-radius: 8px;
                width: 100%
            }
            .navbar-custom .nav-item, .navbar-custom .navbar-brand {
                color: #ffffff;
            }
            .navbar-custom .btn-custom, .navbar-custom .location-btn {
                background-color: #2ecc71; /* Green button */
                color: white;
                border-radius: 20px;
                border: none;
                padding: 5px 15px;
                margin-right: 5px;
            }
            .navbar-custom .search-btn {
                padding: 5px 20px;
            }
            .location-dropdown, .navbar-custom .location-btn {
                background-color: #333;
                color: #ffffff;
                border-radius: 20px;
                padding: 5px 15px;
                border: none;
                display: flex;
                align-items: center;
            }
           
            .navbar-custom .btn-custom {
                display: flex;
                align-items: center;
            }
          
        </style>
    </head>
    <body>

        <div class="container mt-3">
            <nav class="navbar navbar-expand-lg navbar-custom row">
                <!-- Danh mục nghề Button -->
                <div class="col-2">
                    <button class="btn btn-custom">
                        <span class="icon">&#9776;</span> <!-- List icon -->
                        Danh mục Nghề
                    </button>
                </div>

                <!-- FPT Text -->
                <div class="col-6">
                    <span class="navbar-brand mx-3">FPT</span>

                    <!-- Close icon -->
                    <span class="nav-item mx-2">&#10006;</span> <!-- Close (X) icon -->
                </div>

                <!-- Location Dropdown -->
                <div class="location-dropdown mx-3 col-2">
                    <span class="icon">&#128205;</span> <!-- Location pin icon -->
                    Hà Nội
                    <select class="form-control ml-2" style="background-color: #333; border: none; color: white;">
                        <option>Hà Nội</option>
                        <option>TP. HCM</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>

                <!-- Search Button -->
                <button class="btn search-btn col-2 btn-success">
                    <span class="icon">&#128269;</span> <!-- Search icon -->
                    Tìm kiếm
                </button>
            </nav>
        </div>

        <form action="action">
            <input type="checkbox" name="d" value="ON" />
        </form>
        
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
