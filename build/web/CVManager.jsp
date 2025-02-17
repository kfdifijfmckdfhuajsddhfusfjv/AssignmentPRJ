<%-- 
    Document   : CVManager
    Created on : 8 thg 10, 2024, 01:44:27
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>
        <%@include file="Header.jsp" %><br>
        <c:set value="${requestScope.listCvOfSeeker}" var="list"/>
        <h2 class="text-s text-success m-lg-4">List CV</h2>
           
        <div class="row m-4">
            <c:forEach items="${list}" var="cv">
                <div class="col-md-3 mb-3">
                    <!-- Card component -->
                    <div class="card shadow-sm">
                        <!-- Card header with iframe -->
                        <iframe class="card-img-top rounded-top" width="12220%" src="${cv.cvLink}"  height="200" style="border: none;"></iframe>
                        <!-- Card body with action icons -->
                        <div class="card-body">
                            <div class="d-flex justify-content-around">
                                <!-- "View" icon -->
                                <a class="mx-2 text-primary" href="readfile?cvId=${cv.cvId}" title="View" target="_blank">
                                    <i class="fa-regular fa-eye fa-2x"></i>
                                </a>
                                <!-- "Download" icon -->
                                <a class="mx-2 text-success" href="downloadCV?cvId=${cv.cvId}" title="Download">
                                    <i class="fa-solid fa-download fa-2x"></i>
                                </a>
                                <!-- "Delete" icon -->
                                <a class="mx-2 text-danger" href="deleteCV?cvId=${cv.cvId}" title="Delete" onclick="return confirm('Are you sure you want to delete this CV?');">
                                    <i class="fa-solid fa-trash fa-2x"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
