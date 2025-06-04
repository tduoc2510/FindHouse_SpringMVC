<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            const confirmPasswordInput = document.getElementById('confirm-password-input');
            const confirmPasswordToggle = document.getElementById('confirm-password-toggle');

            function setupPasswordToggle(input, toggle) {
                if (toggle && input) {
                    toggle.addEventListener('click', function () {
                        const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                        input.setAttribute('type', type);

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
            }

            setupPasswordToggle(passwordInput, passwordToggle);
            setupPasswordToggle(confirmPasswordInput, confirmPasswordToggle);

            // Form submission with loading state
            const signupForm = document.getElementById('signup-form');
            const submitButton = document.getElementById('submit-btn');

            if (signupForm && submitButton) {
                signupForm.addEventListener('submit', function (e) {
                    // Check if form is valid first
                    if (!this.checkValidity()) {
                        e.preventDefault();
                        e.stopPropagation();
                        this.classList.add('was-validated');
                        return;
                    }

                    // Add loading state
                    submitButton.disabled = true;
                    submitButton.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Đang đăng ký...';

                    // Re-enable after 10 seconds in case of no response
                    setTimeout(function () {
                        submitButton.disabled = false;
                        submitButton.innerHTML = '<i class="fas fa-user-plus me-2"></i>Đăng ký';
                    }, 10000);
                });
            }

            // Validation functions
            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(email);
            }

            function validatePhone(phone) {
                const re = /^[0-9]{10,11}$/;
                return re.test(phone.replace(/\s+/g, ''));
            }

            function validateCCCD(cccd) {
                const re = /^[0-9]{12}$/;
                return re.test(cccd.replace(/\s+/g, ''));
            }

            // Input validation
            const emailInput = document.getElementById('email-input');
            const usernameInput = document.getElementById('username-input');
            const phoneInput = document.getElementById('phone-input');
            const cccdInput = document.getElementById('cccd-input');

            // Email validation
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

            // Username validation
            if (usernameInput) {
                usernameInput.addEventListener('blur', function () {
                    const username = this.value.trim();
                    const feedback = this.nextElementSibling;

                    if (username && username.length < 3) {
                        this.classList.add('is-invalid');
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = 'Tên đăng nhập phải có ít nhất 3 ký tự';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }
                });
            }

            // Password strength validation
            if (passwordInput) {
                passwordInput.addEventListener('input', function () {
                    const password = this.value;
                    const feedback = this.parentElement.querySelector('.invalid-feedback');

                    if (password.length > 0 && password.length < 6) {
                        this.classList.add('is-invalid');
                        if (feedback) {
                            feedback.textContent = 'Mật khẩu phải có ít nhất 6 ký tự';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }

                    // Check confirm password match
                    if (confirmPasswordInput && confirmPasswordInput.value) {
                        checkPasswordMatch();
                    }
                });
            }

            // Confirm password validation
            function checkPasswordMatch() {
                if (confirmPasswordInput && passwordInput) {
                    const feedback = confirmPasswordInput.nextElementSibling;

                    if (confirmPasswordInput.value !== passwordInput.value) {
                        confirmPasswordInput.classList.add('is-invalid');
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = 'Mật khẩu xác nhận không khớp';
                        }
                    } else {
                        confirmPasswordInput.classList.remove('is-invalid');
                    }
                }
            }

            if (confirmPasswordInput) {
                confirmPasswordInput.addEventListener('input', checkPasswordMatch);
                confirmPasswordInput.addEventListener('blur', checkPasswordMatch);
            }

            // Phone validation
            if (phoneInput) {
                phoneInput.addEventListener('input', function () {
                    // Only allow numbers
                    this.value = this.value.replace(/[^0-9]/g, '');
                });

                phoneInput.addEventListener('blur', function () {
                    const phone = this.value.trim();
                    const feedback = this.nextElementSibling;

                    if (phone && !validatePhone(phone)) {
                        this.classList.add('is-invalid');
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = 'Số điện thoại phải có 10-11 chữ số';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }
                });
            }

            // CCCD validation
            if (cccdInput) {
                cccdInput.addEventListener('input', function () {
                    // Only allow numbers
                    this.value = this.value.replace(/[^0-9]/g, '');
                });

                cccdInput.addEventListener('blur', function () {
                    const cccd = this.value.trim();
                    const feedback = this.nextElementSibling;

                    if (cccd && !validateCCCD(cccd)) {
                        this.classList.add('is-invalid');
                        if (feedback && feedback.classList.contains('invalid-feedback')) {
                            feedback.textContent = 'CCCD phải có đúng 12 chữ số';
                        }
                    } else {
                        this.classList.remove('is-invalid');
                    }
                });
            }

            // Form validation on submit
            if (signupForm) {
                signupForm.addEventListener('submit', function (e) {
                    if (!this.checkValidity()) {
                        e.preventDefault();
                        e.stopPropagation();
                    }
                    this.classList.add('was-validated');
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
                                            <img src="assets/images/element/signin.svg" alt="Hình ảnh đăng ký" class="img-fluid">
                                        </div>
                                        <!-- Divider -->
                                        <div class="vr opacity-1 d-none d-lg-block"></div>
                                    </div>

                                    <!-- Information -->
                                    <div class="col-lg-6 order-1">
                                        <div class="p-4 p-sm-6">
                                            <!-- Title -->
                                            <div class="text-center mb-4">
                                                <h1 class="mb-2 h3 fw-bold">Tạo tài khoản mới</h1>
                                                <p class="mb-0 text-muted">
                                                    Đã có tài khoản? 
                                                    <a href="/login" class="text-decoration-none fw-medium">Đăng nhập ngay</a>
                                                </p>
                                            </div>

                                            <!-- Form START -->
                                            <form class="mt-4 text-start" action="${pageContext.request.contextPath}/verifycodesignup" method="post" id="signup-form" novalidate>

                                                <div class="row">
                                                    <!-- Email -->
                                                    <div class="col-12 mb-3">
                                                        <label for="email-input" class="form-label fw-medium">
                                                            <i class="fas fa-envelope me-2 text-primary"></i>Email *
                                                        </label>
                                                        <input 
                                                            type="email" 
                                                            name="email" 
                                                            id="email-input"
                                                            class="form-control" 
                                                            placeholder="Nhập địa chỉ email"
                                                            required
                                                            autocomplete="email"
                                                            >
                                                        <div class="invalid-feedback">
                                                            Vui lòng nhập email hợp lệ
                                                        </div>
                                                    </div>

                                                    <!-- Username -->
                                                    <div class="col-12 mb-3">
                                                        <label for="username-input" class="form-label fw-medium">
                                                            <i class="fas fa-user me-2 text-primary"></i>Tên đăng nhập *
                                                        </label>
                                                        <input 
                                                            type="text" 
                                                            name="username" 
                                                            id="username-input"
                                                            class="form-control" 
                                                            placeholder="Nhập tên đăng nhập"
                                                            required
                                                            autocomplete="username"
                                                            minlength="3"
                                                            >
                                                        <div class="invalid-feedback">
                                                            Tên đăng nhập phải có ít nhất 3 ký tự
                                                        </div>
                                                    </div>

                                                    <!-- Password -->
                                                    <div class="col-md-6 mb-3 position-relative">
                                                        <label for="password-input" class="form-label fw-medium">
                                                            <i class="fas fa-lock me-2 text-primary"></i>Mật khẩu *
                                                        </label>
                                                        <input 
                                                            type="password" 
                                                            name="password" 
                                                            id="password-input"
                                                            class="form-control pe-5" 
                                                            placeholder="Nhập mật khẩu"
                                                            required
                                                            autocomplete="new-password"
                                                            minlength="6"
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

                                                    <!-- Confirm Password -->
                                                    <div class="col-md-6 mb-3 position-relative">
                                                        <label for="confirm-password-input" class="form-label fw-medium">
                                                            <i class="fas fa-lock me-2 text-primary"></i>Xác nhận mật khẩu *
                                                        </label>
                                                        <input 
                                                            type="password" 
                                                            name="confirmPassword" 
                                                            id="confirm-password-input"
                                                            class="form-control pe-5" 
                                                            placeholder="Nhập lại mật khẩu"
                                                            required
                                                            autocomplete="new-password"
                                                            >
                                                        <button 
                                                            type="button" 
                                                            class="btn position-absolute end-0 top-50 translate-middle-y mt-3 me-2 p-2 border-0 bg-transparent" 
                                                            id="confirm-password-toggle"
                                                            tabindex="-1"
                                                            aria-label="Hiện/ẩn mật khẩu"
                                                            >
                                                            <i class="fas fa-eye-slash text-muted"></i>
                                                        </button>
                                                        <div class="invalid-feedback">
                                                            Mật khẩu xác nhận không khớp
                                                        </div>
                                                    </div>

                                                    <!-- Full Name -->
                                                    <div class="col-12 mb-3">
                                                        <label for="fullname-input" class="form-label fw-medium">
                                                            <i class="fas fa-id-card me-2 text-primary"></i>Họ và tên
                                                        </label>
                                                        <input 
                                                            type="text" 
                                                            name="fullName" 
                                                            id="fullname-input"
                                                            class="form-control" 
                                                            placeholder="Nhập họ và tên đầy đủ"
                                                            autocomplete="name"
                                                            >
                                                    </div>

                                                    <!-- Phone Number -->
                                                    <div class="col-md-6 mb-3">
                                                        <label for="phone-input" class="form-label fw-medium">
                                                            <i class="fas fa-phone me-2 text-primary"></i>Số điện thoại
                                                        </label>
                                                        <input 
                                                            type="tel" 
                                                            name="phoneNumber" 
                                                            id="phone-input"
                                                            class="form-control" 
                                                            placeholder="Nhập số điện thoại"
                                                            autocomplete="tel"
                                                            pattern="[0-9]{10,11}"
                                                            >
                                                        <div class="invalid-feedback">
                                                            Số điện thoại phải có 10-11 chữ số
                                                        </div>
                                                    </div>

                                                    <!-- CCCD -->
                                                    <div class="col-md-6 mb-3">
                                                        <label for="cccd-input" class="form-label fw-medium">
                                                            <i class="fas fa-id-badge me-2 text-primary"></i>CCCD
                                                        </label>
                                                        <input 
                                                            type="text" 
                                                            name="cccd" 
                                                            id="cccd-input"
                                                            class="form-control" 
                                                            placeholder="Nhập số CCCD"
                                                            pattern="[0-9]{12}"
                                                            maxlength="12"
                                                            >
                                                        <div class="invalid-feedback">
                                                            CCCD phải có đúng 12 chữ số
                                                        </div>
                                                    </div>

                                                    <!-- Role -->
                                                    <div class="col-12 mb-4">
                                                        <label for="role-select" class="form-label fw-medium">
                                                            <i class="fas fa-users me-2 text-primary"></i>Vai trò *
                                                        </label>
                                                        <select name="role" id="role-select" class="form-select" required>
                                                            <option value="">Chọn vai trò của bạn</option>
                                                            <option value="tenant">🏠 Người thuê trọ</option>
                                                            <option value="owner">🏢 Chủ trọ</option>
                                                        </select>
                                                        <div class="invalid-feedback">
                                                            Vui lòng chọn vai trò
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Terms and conditions -->
                                                <div class="mb-4">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="terms" required>
                                                        <label class="form-check-label small" for="terms">
                                                            Tôi đồng ý với 
                                                            <a href="/terms" class="text-decoration-none" target="_blank">Điều khoản sử dụng</a> 
                                                            và 
                                                            <a href="/privacy" class="text-decoration-none" target="_blank">Chính sách bảo mật</a>
                                                        </label>
                                                        <div class="invalid-feedback">
                                                            Bạn phải đồng ý với điều khoản để tiếp tục
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Submit Button -->
                                                <div class="d-grid mb-4">
                                                    <button type="submit" class="btn btn-primary btn-lg" id="submit-btn">
                                                        <i class="fas fa-user-plus me-2"></i>Đăng ký
                                                    </button>
                                                </div>

                                                <!-- Divider -->
                                                <div class="position-relative text-center mb-4">
                                                    <span class="divider-content-center bg-mode px-3 text-muted small">hoặc</span>
                                                    <hr>
                                                </div>

                                                <!-- Login link -->
                                                <div class="text-center">
                                                    <p class="mb-0 small text-muted">
                                                        Đã có tài khoản? 
                                                        <a href="/login" class="text-decoration-none fw-medium">
                                                            Đăng nhập ngay
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