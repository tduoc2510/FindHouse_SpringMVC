<%-- 
    Document   : sideBar
    Created on : Mar 6, 2025, 2:33:20 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-4 col-xl-3">
    <!-- Responsive offcanvas body START -->
    <div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar" >
        <!-- Offcanvas header -->
        <div class="offcanvas-header justify-content-end pb-2">
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
        </div>

        <!-- Offcanvas body -->
        <div class="offcanvas-body p-3 p-lg-0">
            <div class="card bg-light w-100">

                <!-- Edit profile button -->
                <div class="position-absolute top-0 end-0 p-3">
                    <a href="#" class="text-primary-hover" data-bs-toggle="tooltip" data-bs-title="Edit profile">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </div>

                <!-- Card body START -->
                <div class="card-body p-3">
                    <!-- Avatar and content -->
                    <div class="text-center mb-3">

                        <h6 class="mb-0">${USER.fullName}</h6>
                        <a href="#" class="text-reset text-primary-hover small">${USER.email}</a>
                        <hr>
                    </div>

                    <!-- Sidebar menu item START -->
                    <ul class="nav nav-pills-primary-soft flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/profile"><i class="bi bi-person fa-fw me-2"></i>My Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/booking"><i class="bi bi-ticket-perforated fa-fw me-2"></i>My Bookings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="account-delete.html"><i class="bi bi-trash fa-fw me-2"></i>Delete Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger bg-danger-soft-hover" href="#"><i class="fas fa-sign-out-alt fa-fw me-2"></i>Sign Out</a>
                        </li>
                    </ul>
                    <!-- Sidebar menu item END -->
                </div>
                <!-- Card body END -->
            </div>
        </div>
    </div>	
    <!-- Responsive offcanvas body END -->	
</div>