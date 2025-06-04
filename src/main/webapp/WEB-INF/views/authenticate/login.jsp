<%-- 
    Document   : login
    Created on : Mar 2, 2025, 3:26:24 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <%@include file="../include/head.jsp" %>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Handle alert messages
            var message = "${message}";
            var messageType = "${messageType}";

            if (message && message.trim() !== "") {
                swal({
                    title: messageType === "success" ? "Thành công!" : "Lỗi!",
                    text: message,
                    icon: messageType === "success" ? "success" : "error",
                    button: "Đóng",
                });
            }

            // Password toggle functionality
            const passwordInput = document.getElementById('password-input');
            const passwordToggle = document.getElementById('password-toggle');

            if (passwordToggle && passwordInput) {
                passwordToggle.addEventListener('click', function () {
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);

                    // Toggle icon
                    const icon = this.querySelector('i');
                    if (type === 'password') {
                        icon.classList.remove('fa-eye');
                        icon.classList.add('fa-eye-slash');
                    } else {
                        icon.classList.remove('fa-eye-slash');
                        icon.classList.add('fa-eye');
                    }
                });
            }

            // Form submission with loading state
            const loginForm = document.getElementById('login-form');
            const submitButton = document.getElementById('submit-btn');

            if (loginForm && submitButton) {
                loginForm.addEventListener('submit', function (e) {
                    // Add loading state
                    submitButton.disabled = true;
                    submitButton.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Đang đăng nhập...';

                    // Re-enable after 5 seconds in case of no response
                    setTimeout(function () {
                        submitButton.disabled = false;
                        submitButton.innerHTML = 'Đăng nhập';
                    }, 5000);
                });
            }

            // Input validation feedback
            const emailInput = document.getElementById('email-input');
            const passwordInputField = document.getElementById('password-input');

            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(email);
            }

            if (emailInput) {
                emailInput.addEventListener('blur', function () {
                    const email = this.value.trim();
                    const feedback = this.nextElementSibling;

                    if (email && !validateEmail(email)) {
                        this.classList.add('is-invalid');
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = 'Vui lòng nhập email hợp lệ';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }
                });

                emailInput.addEventListener('input', function () {
                    if (this.classList.contains('is-invalid')) {
                        const email = this.value.trim();
                        if (validateEmail(email)) {
                            this.classList.remove('is-invalid');
                        }
                    }
                });
            }

            if (passwordInputField) {
                passwordInputField.addEventListener('blur', function () {
                    const password = this.value.trim();
                    const feedback = this.parentElement.querySelector('.invalid-feedback');

                    if (password && password.length < 6) {
                        this.classList.add('is-invalid');
                        if (feedback) {
                            feedback.textContent = 'Mật khẩu phải có ít nhất 6 ký tự';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }
                });

                passwordInputField.addEventListener('input', function () {
                    if (this.classList.contains('is-invalid')) {
                        const password = this.value.trim();
                        if (password.length >= 6) {
                            this.classList.remove('is-invalid');
                        }
                    }
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
                                            <img src="assets/images/element/signin.svg" alt="Hình ảnh đăng nhập" class="img-fluid">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">
                                            <!-- Title -->
                                            <div class="text-center mb-4">
                                                <h1 class="mb-2 h3 fw-bold">Chào mừng trở lại!</h1>
                                                <p class="mb-0 text-muted">Đăng nhập để tiếp tục sử dụng dịch vụ</p>
                                            </div>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start" action="${pageContext.request.contextPath}/login" method="post" id="login-form" novalidate>
                                                <!-- Email -->
                                                <div class="mb-3">
                                                    <label for="email-input" class="form-label fw-medium">
                                                        <i class="fas fa-envelope me-2 text-primary"></i>Email
                                                    </label>
                                                    <input 
                                                        type="email" 
                                                        name="email" 
                                                        id="email-input"
                                                        class="form-control form-control-lg" 
                                                        placeholder="Nhập địa chỉ email của bạn"
                                                        required
                                                        autocomplete="email"
                                                        >
                                                    <div class="invalid-feedback">
                                                        Vui lòng nhập email hợp lệ
                                                    </div>
                                                </div>

                                                <!-- Password -->
                                                <div class="mb-4 position-relative">
                                                    <label for="password-input" class="form-label fw-medium">
                                                        <i class="fas fa-lock me-2 text-primary"></i>Mật khẩu
                                                    </label>
                                                    <input 
                                                        type="password" 
                                                        name="password" 
                                                        id="password-input"
                                                        class="form-control form-control-lg pe-5" 
                                                        placeholder="Nhập mật khẩu của bạn"
                                                        required
                                                        autocomplete="current-password"
                                                        >
                                                    <button 
                                                        type="button" 
                                                        class="btn position-absolute end-0 top-50 translate-middle-y mt-3 me-2 p-2 border-0 bg-transparent" 
                                                        id="password-toggle"
                                                        tabindex="-1"
                                                        aria-label="Hiện/ẩn mật khẩu"
                                                        >
                                                        <i class="fas fa-eye-slash text-muted"></i>
                                                    </button>
                                                    <div class="invalid-feedback">
                                                        Mật khẩu phải có ít nhất 6 ký tự
                                                    </div>
                                                </div>

                                                <!-- Remember me and Forgot password -->
                                                <div class="row mb-4">
                                                    <div class="col-6">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                                            <label class="form-check-label text-sm" for="rememberMe">
                                                                Ghi nhớ đăng nhập
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 text-end">
                                                        <a href="/forgot-password" class="text-decoration-none small">
                                                            Quên mật khẩu?
                                                        </a>
                                                    </div>
                                                </div>

                                                <!-- Submit Button -->
                                                <div class="d-grid mb-4">
                                                    <button type="submit" class="btn btn-primary btn-lg" id="submit-btn">
                                                        <i class="fas fa-sign-in-alt me-2"></i>Đăng nhập
                                                    </button>
                                                </div>

                                                <!-- Divider -->
                                                <div class="position-relative text-center mb-4">
                                                    <span class="divider-content-center bg-mode px-3 text-muted small">hoặc</span>
                                                    <hr>
                                                </div>

                                                <!-- Sign up link -->
                                                <div class="text-center">
                                                    <p class="mb-0 small text-muted">
                                                        Chưa có tài khoản? 
                                                        <a href="/signup" class="text-decoration-none fw-medium">
                                                            Đăng ký ngay
                                                        </a>
                                                    </p>
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
</html>