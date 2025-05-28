<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
    <%@include file="../include/head.jsp" %>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/sweetalert.min.js"></script>
    <script>
        // Check if the message variable and message type are set or not
        document.addEventListener("DOMContentLoaded", (event) => {
            var message = "${message}"; // Message content
            var messageType = "${messageType}"; // Message type, e.g., 'success' or 'error'

            if (message != "") {
                swal({
                    title: messageType === "success" ? "Success!" : "Error!",
                    text: message,
                    icon: messageType === "success" ? "success" : "error",
                    button: "OK!",
                });
            }
        });
    </script>
    <body>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->
            <section class="vh-xxl-100">
                <div class="container h-90 d-flex px-0 px-sm-4">
                    <div class="row justify-content-center align-items-center m-auto">
                        <div class="col-12">
                            <div class="bg-mode shadow rounded-3 overflow-hidden">
                                <div class="row g-0">
                                    <!-- Vector Image -->
                                    <div class="col-lg-6 d-md-flex align-items-center order-2 order-lg-1">
                                        <div class="p-3 p-lg-5">
                                            <img src="assets/images/element/signin.svg" alt="">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">

                                            <!-- Title -->
                                            <h1 class="mb-2 h3">Create new account</h1>
                                            <p class="mb-0">Already a member?<a href="/login">Login</a></p>

                                            <!-- Message display -->



                                            <!-- Form START -->

                                            <form class="mt-4 text-start" action="${pageContext.request.contextPath}/verifycodesignup" method="post">

                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <label class="form-label">Email</label>
                                                    <input type="email" name="email" class="form-control" required>
                                                </div>

                                                <!-- Username -->
                                                <div class="mb-3">
                                                    <label class="form-label">Tên đăng nhập</label>
                                                    <input type="text" name="username" class="form-control" required>
                                                </div>

                                                <!-- Password -->
                                                <div class="mb-3 position-relative">
                                                    <label class="form-label">Mật khẩu</label>
                                                    <input type="password" name="password" class="form-control fakepassword" id="psw-input" required>
                                                    <span class="position-absolute top-50 end-0 translate-middle-y p-0 mt-3">
                                                        <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                    </span>
                                                </div>

                                                <!-- Confirm Password -->
                                                <div class="mb-3">
                                                    <label class="form-label">Xác nhận mật khẩu</label>
                                                    <input type="password" name="confirmPassword" class="form-control" required>
                                                </div>

                                                <!-- Họ tên -->
                                                <div class="mb-3">
                                                    <label class="form-label">Họ và tên</label>
                                                    <input type="text" name="fullName" class="form-control">
                                                </div>

                                                <!-- Số điện thoại -->
                                                <div class="mb-3">
                                                    <label class="form-label">Số điện thoại</label>
                                                    <input type="text" name="phoneNumber" class="form-control">
                                                </div>

                                                <!-- CCCD -->
                                                <div class="mb-3">
                                                    <label class="form-label">CCCD</label>
                                                    <input type="text" name="cccd" class="form-control">
                                                </div>

                                                <!-- Vai trò -->
                                                <div class="mb-3">
                                                    <label class="form-label">Vai trò</label>
                                                    <select name="role" class="form-control" required>
                                                        <option value="tenant">Người thuê trọ</option>
                                                        <option value="owner">Chủ trọ</option>
                                                    </select>
                                                </div>

                                                <!-- Submit -->
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-100 mb-0">Đăng ký</button>
                                                </div>
                                            </form>



                                            <!-- Form END -->
                                        </div>		
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- =======================
            Main Content END -->

        </main>
        <!-- **************** MAIN CONTENT END **************** -->

        <!-- Back to top -->
        <div class="back-top"></div>

        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

    </body>

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
</html>