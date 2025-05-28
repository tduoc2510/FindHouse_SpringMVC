<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="container h-100 d-flex px-0 px-sm-4">
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



                                            <!-- Verification Form -->
                                            <form class="mt-4 text-start" action="${pageContext.request.contextPath}/signup" method="post">
                                                <!-- Verification Code -->
                                                <div class="mb-3">
                                                    <label class="form-label">Nhập mã xác thực</label>
                                                    <input type="text" name="verificationCode" class="form-control" required>
                                                </div>

                                                <!-- Submit Button -->
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-100 mb-0">Xác thực</button>
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