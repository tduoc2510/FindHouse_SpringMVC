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

    <body>

        <!-- **************** MAIN CONTENT START **************** -->        <%@include file="../include/header.jsp" %>

        <main>

            <!-- =======================
            Content START -->
            <section class="pt-3">
                <div class="container">
                    <div class="row">

                        <!-- Sidebar START -->
                        <%@include file="user.include/sideBar.jsp" %>
                        <!-- Sidebar END -->

                        <!-- Main content START -->
                        <div class="col-lg-8 col-xl-9">

                            <!-- Offcanvas menu button -->
                            <div class="d-grid mb-0 d-lg-none w-100">
                                <button class="btn btn-primary mb-4" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                                    <i class="fas fa-sliders-h"></i> Menu
                                </button>
                            </div>

                            <div class="vstack gap-4">


                                <!-- Personal info START -->
                                <div class="card border">
                                    <!-- Card header -->
                                    <div class="card-header border-bottom">
                                        <h4 class="card-header-title">Thông tin cá nhân</h4>
                                    </div>

                                    <!-- Card body START -->
                                    <div class="card-body">
                                        <!-- Form START -->
                                        <form class="row g-3" action="profile/update" method="post">
                                            <input type="hidden" name="id" value="${USER.id}">

                                            <div class="col-md-6">
                                                <label class="form-label">Full Name<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" name="fullName" value="${USER.fullName}" placeholder="Enter your full name">
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label">Email address<span class="text-danger">*</span></label>
                                                <input type="email" class="form-control" value="${USER.email}" disabled="true">
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label">Mobile number<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" name="phoneNumber" value="${USER.phoneNumber}" placeholder="Enter your mobile number">
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label">National<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" value="VIET NAM" disabled="true">
                                            </div>

                                            <div class="col-12 text-end">
                                                <button type="submit" class="btn btn-primary mb-0">Save Changes</button>
                                            </div>
                                        </form>

                                        <!-- Form END -->
                                    </div>
                                    <!-- Card body END -->
                                </div>
                                <!-- Personal info END -->


                                <!-- Update Password START -->
                                <div class="card border">
                                    <!-- Card header -->
                                    <div class="card-header border-bottom">
                                        <h4 class="card-header-title">Update Password</h4>
                                        <p class="mb-0">Your current email address is <span class="text-primary">example@gmail.com</span></p>
                                    </div>

                                    <!-- Card body START -->
                                    <form class="card-body">
                                        <!-- Current password -->
                                        <div class="mb-3">
                                            <label class="form-label">Current password</label>
                                            <input class="form-control" type="password" placeholder="Enter current password">
                                        </div>
                                        <!-- New password -->
                                        <div class="mb-3">
                                            <label class="form-label"> Enter new password</label>
                                            <div class="input-group">
                                                <input class="form-control fakepassword" placeholder="Enter new password" type="password" id="psw-input">
                                                <span class="input-group-text p-0 bg-transparent">
                                                    <i class="fakepasswordicon fas fa-eye-slash cursor-pointer p-2"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!-- Confirm -->
                                        <div class="mb-3">
                                            <label class="form-label">Confirm new password</label>
                                            <input class="form-control" type="password" placeholder="Confirm new password">
                                        </div>

                                        <div class="text-end">
                                            <a href="#" class="btn btn-primary mb-0">Change Password</a>
                                        </div>
                                    </form>
                                    <!-- Card body END -->
                                </div>
                                <!-- Update Password END -->
                            </div>
                        </div>
                        <!-- Main content END -->

                    </div>
                </div>
            </section>
            <!-- =======================
            Content END -->

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