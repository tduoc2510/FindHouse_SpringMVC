<%-- 
    Document   : footer
    Created on : Mar 1, 2025, 4:25:37 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="bg-dark pt-5">
    <div class="container">
        <!-- Row START -->
        <div class="row g-4">

            <!-- Widget 1 START -->
            <div class="col-lg-3">
                <!-- logo -->
                <a >
                    <img style="height:150px" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="logo">
                </a>
                <p class="my-3 text-body-secondary">
                    Debrent – nền tảng tìm thuê và quản lý nhà trọ thế hệ mới, kết nối trực tiếp giữa người tìm phòng và chủ trọ uy tín. 
                    Chúng tôi giúp bạn tiết kiệm thời gian, an tâm lựa chọn, và trải nghiệm hành trình sống trọn vẹn trong không gian lý tưởng. 
                    Dù là sinh viên, người đi làm hay chủ trọ đang tìm khách, Debrent luôn đồng hành cùng bạn – minh bạch, tiện lợi và hiện đại.
                </p>

                <p class="mb-2">
                    <a href="tel:+84123456789" class="text-body-secondary text-primary-hover">
                        <i class="bi bi-telephone me-2"></i>+84 123 456 789
                    </a>
                </p>
                <p class="mb-0">
                    <a href="mailto:support@debrent.vn" class="text-body-secondary text-primary-hover">
                        <i class="bi bi-envelope me-2"></i>support@debrent.vn
                    </a>
                </p>


            </div>
            <!-- Widget 1 END -->

            <!-- Widget 2 START -->
            <div class="col-lg-8 ms-auto">
                <div class="row g-4">
                    <!-- Link block -->
                    <div class="col-6 col-md-3">
                        <h5 class="text-white mb-2 mb-md-4">Page</h5>
                        <ul class="nav flex-column text-primary-hover">
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">About us</a></li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Contact us</a>
                            </li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">News and Blog</a>
                            </li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Meet a Team</a>
                            </li>
                        </ul>
                    </div>

                    <!-- Link block -->
                    <div class="col-6 col-md-3">
                        <h5 class="text-white mb-2 mb-md-4">Link</h5>
                        <ul class="nav flex-column text-primary-hover">
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Sign up</a></li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Sign in</a></li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Privacy Policy</a>
                            </li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Terms</a></li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Cookie</a></li>
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#">Support</a></li>
                        </ul>
                    </div>


                    <!-- Link block -->
                    <div class="col-6 col-md-3">
                        <h5 class="text-white mb-2 mb-md-4">Booking</h5>
                        <ul class="nav flex-column text-primary-hover">
                            <li class="nav-item"><a class="nav-link text-body-secondary" href="#"><i
                                        class="fa-solid fa-hotel me-2"></i>Hotel</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Widget 2 END -->

        </div><!-- Row END -->




        <!-- Divider -->
        <hr class="mt-4 mb-0">

        <!-- Bottom footer -->
        <div class="row">
            <div class="container">
                <div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-lg-start">
                    <!-- copyright text -->
                    <div class="text-body-secondary text-primary-hover"> Copyrights ©2025 FindHouse</div>
                    <!-- copyright links-->
                    <div class="nav mt-2 mt-lg-0">
                        <ul class="list-inline text-primary-hover mx-auto mb-0">
                            <li class="list-inline-item me-0"><a class="nav-link text-body-secondary py-1"
                                                                 href="#">Privacy policy</a></li>
                            <li class="list-inline-item me-0"><a class="nav-link text-body-secondary py-1"
                                                                 href="#">Terms and conditions</a></li>
                            <li class="list-inline-item me-0"><a class="nav-link text-body-secondary py-1 pe-0"
                                                                 href="#">Refund policy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Back to top -->
<div class="back-top"></div>

<!-- Navbar mobile START -->
<div class="navbar navbar-mobile">
    <ul class="navbar-nav">
        <!-- Nav item Home -->
        <li class="nav-item">
            <a class="nav-link active" href="index.html"><i class="bi bi-house-door fa-fw"></i>
                <span class="mb-0 nav-text">Home</span>
            </a>
        </li>

        <!-- Nav item My Trips -->
        <li class="nav-item">
            <a class="nav-link" href="account-bookings.html"><i class="bi bi-briefcase fa-fw"></i>
                <span class="mb-0 nav-text">My Trips</span>
            </a>
        </li>

        <!-- Nav item Offer -->
        <li class="nav-item">
            <a class="nav-link" href="offer-detail.html"><i class="bi bi-percent fa-fw"></i>
                <span class="mb-0 nav-text">Offer</span>
            </a>
        </li>

        <!-- Nav item Account -->
        <li class="nav-item">
            <a class="nav-link" href="account-profile.html"><i class="bi bi-person-circle fa-fw"></i>
                <span class="mb-0 nav-text">Account</span>
            </a>
        </li>
    </ul>
    <script id="kami-chat-widget" src="https://kamimind.ai/kami-chat-widget.js" token="bDgSxj5N1K97mklImQzpbCHCdhEcQhTf" charset="utf-8" botToken="ec530b26-efd7-4e55-bce0-4e61459a4efe" defer
    ></script>
</div>
<!-- Navbar mobile END -->

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="${pageContext.request.contextPath}/assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/flatpickr/js/flatpickr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/choices/js/choices.min.js"></script>

<!-- ThemeFunctions -->
<script src="${pageContext.request.contextPath}/assets/js/functions.js"></script>