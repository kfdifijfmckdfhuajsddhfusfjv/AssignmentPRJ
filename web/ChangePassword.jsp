<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
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

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <title>Change Password Form</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <c:set value="${sessionScope.account}" var="user" />
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h3>Change Password</h3>
                        </div>
                        <div class="card-body">
                            <form action="changepassword" method="POST">
                                <div class="mb-3">
                                    <label for="currentPassword" class="form-label">Current Password</label>
                                    <div class="input-group" style="width: 100%;">
                                        <input type="password" value="${user.password}" class="form-control" id="currentPassword" name="currentPassword" placeholder="Current password" required>
                                        <button type="button" class="btn btn-outline-secondary m-lg-2" onclick="togglePasswordVisibility('currentPassword')">Show</button>
                                    </div>
                                </div>
                                <div class="mb-3 position-relative">
                                    <label for="newPassword" class="form-label">New Password</label>
                                    <c:if test="${not empty requestScope.notChange}">
                                        <div class="text-danger">${requestScope.notChange}</div>
                                    </c:if>
                                    <c:if test="${not empty requestScope.lengthError}">
                                        <div class="text-danger">${requestScope.lengthError}</div>
                                    </c:if>
                                    <div class="input-group" style="width: 100%;">
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password" required>
                                        <button type="button" class="btn btn-outline-secondary m-lg-2" onclick="togglePasswordVisibility('newPassword')">Show</button>
                                    </div>

                                </div>
                                <div class="mb-3 position-relative">
                                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                    <c:if test="${not empty requestScope.notConfirm}">
                                        <div class="text-danger">${requestScope.notConfirm}</div>
                                    </c:if>
                                    <div class="input-group" style="width: 100%;">
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
                                        <button type="button" class="btn btn-outline-secondary m-lg-2" onclick="togglePasswordVisibility('confirmPassword')">Show</button>
                                    </div>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script to toggle password visibility -->
        <script>
                                        function togglePasswordVisibility(fieldId) {
                                            var passwordField = document.getElementById(fieldId);
                                            var button = passwordField.nextElementSibling;
                                            if (passwordField.type === "password") {
                                                passwordField.type = "text";
                                                button.textContent = "Hide";
                                            } else {
                                                passwordField.type = "password";
                                                button.textContent = "Show";
                                            }
                                        }
        </script>

    </body>
</html>
