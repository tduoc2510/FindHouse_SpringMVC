<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
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
                    title: messageType === "success" ? "Thành công!" : "Lỗi!",
                    text: message,
                    icon: messageType === "success" ? "success" : "error",
                    button: "Đồng ý!",
                });
            }

            // Auto-focus on verification code input
            const verificationInput = document.querySelector('input[name="verificationCode"]');
            if (verificationInput) {
                verificationInput.focus();

                // Format input as user types (add spaces every 3 digits for readability)
                verificationInput.addEventListener('input', function (e) {
                    let value = e.target.value.replace(/\D/g, '').substring(0, 6);
                    e.target.value = value;
                });

                // Handle paste event
                verificationInput.addEventListener('paste', function (e) {
                    setTimeout(() => {
                        let value = e.target.value.replace(/\D/g, '').substring(0, 6);
                        e.target.value = value;
                    }, 0);
                });
            }

            // Add loading state to submit button
            const form = document.querySelector('form');
            const submitBtn = document.querySelector('button[type="submit"]');

            form.addEventListener('submit', function () {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Đang xác thực...';
            });
        });

        // Countdown timer for resend option
        let countdown = 60;
        function startCountdown() {
            const resendBtn = document.getElementById('resendBtn');
            const timer = setInterval(() => {
                countdown--;
                resendBtn.innerHTML = `Gửi lại mã (${countdown}s)`;

                if (countdown <= 0) {
                    clearInterval(timer);
                    resendBtn.innerHTML = 'Gửi lại mã xác thực';
                    resendBtn.disabled = false;
                    resendBtn.classList.remove('disabled');
                    countdown = 60;
                }
            }, 1000);
        }

        // Start countdown on page load
        document.addEventListener("DOMContentLoaded", startCountdown);
    </script>
    <body>

        <!-- **************** MAIN CONTENT START **************** -->
        <main>

            <!-- =======================
            Main Content START -->
            <section class="vh-100 d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5">
                            <div class="card border-0 shadow-lg">
                                <div class="card-body p-4 p-sm-5">

                                    <!-- Header Section with Better Visual Hierarchy -->
                                    <div class="text-center mb-4">
                                        <!-- Success/Security Icon -->
                                        <div class="mb-3">
                                            <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                                <i class="bi bi-shield-check text-primary fs-2"></i>
                                            </div>
                                        </div>

                                        <!-- Title with better typography -->
                                        <h1 class="h3 fw-bold text-dark mb-2">Xác thực tài khoản</h1>
                                        <p class="text-muted mb-0">Vui lòng nhập mã xác thực để hoàn tất đăng ký</p>
                                    </div>

                                    <!-- Email Info Card -->
                                    <div class="alert alert-info border-0 bg-info bg-opacity-10 mb-4" role="alert">
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-envelope-check text-info me-2"></i>
                                            <div class="flex-grow-1">
                                                <small class="text-info fw-medium">
                                                    Mã xác thực 6 chữ số đã được gửi đến:
                                                </small>
                                                <div class="fw-semibold text-dark mt-1">${email}</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Verification Form with Enhanced UX -->
                                    <form class="mb-4" action="${pageContext.request.contextPath}/signup" method="post">

                                        <!-- Verification Code Input with Better Design -->
                                        <div class="mb-4">
                                            <label class="form-label fw-semibold text-dark mb-2">
                                                Mã xác thực
                                                <span class="text-danger">*</span>
                                            </label>
                                            <div class="position-relative">
                                                <input type="text" 
                                                       name="verificationCode" 
                                                       class="form-control form-control-lg text-center fw-bold border-2" 
                                                       placeholder="000000"
                                                       maxlength="6"
                                                       pattern="[0-9]{6}"
                                                       autocomplete="one-time-code"
                                                       inputmode="numeric"
                                                       style="letter-spacing: 0.5em; font-size: 1.25rem;"
                                                       required>
                                                <div class="position-absolute top-50 end-0 translate-middle-y me-3">
                                                    <i class="bi bi-key text-muted"></i>
                                                </div>
                                            </div>
                                            <div class="form-text text-muted mt-2">
                                                <i class="bi bi-info-circle me-1"></i>
                                                Nhập đúng 6 chữ số từ email của bạn
                                            </div>
                                        </div>

                                        <!-- Enhanced Submit Button -->
                                        <div class="d-grid gap-2 mb-3">
                                            <button type="submit" class="btn btn-primary btn-lg fw-semibold py-3">
                                                <i class="bi bi-check-circle me-2"></i>
                                                Xác thực tài khoản
                                            </button>
                                        </div>
                                    </form>

                                    <!-- Additional Actions with Better Layout -->
                                    <div class="text-center">
                                        <div class="d-flex flex-column gap-3">
                                            <!-- Resend Code Button -->
                                            <button type="button" 
                                                    id="resendBtn"
                                                    class="btn btn-outline-secondary disabled" 
                                                    disabled>
                                                <i class="bi bi-arrow-clockwise me-2"></i>
                                                Gửi lại mã (60s)
                                            </button>

                                            <!-- Divider -->
                                            <div class="position-relative">
                                                <hr class="my-3">
                                                <span class="position-absolute top-50 start-50 translate-middle bg-body px-3 text-muted small">hoặc</span>
                                            </div>

                                            <!-- Back to Login -->
                                            <a href="/login" class="btn btn-link text-decoration-none">
                                                <i class="bi bi-arrow-left me-2"></i>
                                                Quay lại đăng nhập
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Help Section -->
                                    <div class="mt-4 pt-3 border-top">
                                        <div class="text-center">
                                            <small class="text-muted">
                                                <i class="bi bi-question-circle me-1"></i>
                                                Không nhận được mã? Kiểm tra thư mục spam hoặc 
                                                <a href="#" class="text-decoration-none">liên hệ hỗ trợ</a>
                                            </small>
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

        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- ThemeFunctions -->
        <script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>

    </body>

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
</html>