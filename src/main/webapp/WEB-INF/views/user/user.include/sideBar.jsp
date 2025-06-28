<%-- 
    Document   : sideBar
    Created on : Mar 6, 2025, 2:33:20 PM
    Author     : Thanh Duoc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-4 col-xl-3">
    <!-- Responsive offcanvas body START -->
    <div class="offcanvas-lg offcanvas-end" tabindex="-1" id="offcanvasSidebar">
        <!-- Offcanvas header -->
        <div class="offcanvas-header justify-content-end pb-2">
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
        </div>
        <!-- Offcanvas body -->
        <div class="offcanvas-body p-3 p-lg-0">
            <div class="card border-0 shadow-sm bg-dark text-light">
                <!-- Edit profile button -->
                <div class="position-absolute top-0 end-0 p-3 z-index-1">
                    <a href="#" class="btn btn-sm btn-outline-primary rounded-circle p-2" 
                       data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="Edit profile">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </div>

                <!-- Card body START -->
                <div class="card-body p-4">
                    <!-- Avatar and content -->
                    <div class="text-center mb-4">
                        <!-- Avatar placeholder -->
                        <div class="avatar avatar-xl mx-auto mb-3 position-relative">
                            <div class="avatar-img rounded-circle bg-gradient-primary d-flex align-items-center justify-content-center" style="width: 80px; height: 80px; background: linear-gradient(135deg, #8B5CF6 0%, #A855F7 100%);">
                                <i class="bi bi-person-fill text-white fs-2"></i>
                            </div>
                            <!-- Online status indicator -->
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
                                <span class="visually-hidden">Online</span>
                            </span>
                        </div>

                        <h5 class="mb-1 fw-bold text-light">${USER.fullName}</h5>
                        <a href="#" class="text-muted text-decoration-none small d-block mb-2 hover-primary">${USER.email}</a>

                     

                        <hr class="my-3">
                    </div>

                    <!-- Sidebar menu item START -->
                    <ul class="nav flex-column gap-1">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center py-3 px-3 rounded-3 text-light hover-bg-dark transition-all" 
                               href="${pageContext.request.contextPath}/user/profile">
                                <div class="icon-shape icon-sm rounded-circle bg-primary-dark me-3">
                                    <i class="bi bi-person text-primary"></i>
                                </div>
                                <div>
                                    <div class="fw-semibold">My Profile</div>
                                    <small class="text-muted">Manage your account</small>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center py-3 px-3 rounded-3 text-light hover-bg-dark transition-all" 
                               href="${pageContext.request.contextPath}/user/booking">
                                <div class="icon-shape icon-sm rounded-circle bg-info-dark me-3">
                                    <i class="bi bi-ticket-perforated text-info"></i>
                                </div>
                                <div>
                                    <div class="fw-semibold">My Bookings</div>
                                    <small class="text-muted">View your reservations</small>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center py-3 px-3 rounded-3 text-light hover-bg-dark transition-all" 
                               href="${pageContext.request.contextPath}/user/tenant">
                                <div class="icon-shape icon-sm rounded-circle bg-warning-dark me-3">
                                    <i class="bi bi-house-door text-warning"></i>
                                </div>
                                <div>
                                    <div class="fw-semibold">Tenant</div>
                                    <small class="text-muted">Property management</small>
                                </div>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center py-3 px-3 rounded-3 text-light hover-bg-dark transition-all" 
                               href="account-delete.html">
                                <div class="icon-shape icon-sm rounded-circle bg-danger-dark me-3">
                                    <i class="bi bi-trash text-danger"></i>
                                </div>
                                <div>
                                    <div class="fw-semibold">Delete Profile</div>
                                    <small class="text-muted">Remove your account</small>
                                </div>
                            </a>
                        </li>
                    </ul>

                    <!-- Sign out button -->
                    <div class="mt-4 pt-3 border-top border-secondary">
                        <a class="btn btn-outline-danger w-100 d-flex align-items-center justify-content-center py-2 hover-danger" href="#">
                            <i class="fas fa-sign-out-alt me-2"></i>
                            <span class="fw-semibold">Sign Out</span>
                        </a>
                    </div>
                    <!-- Sidebar menu item END -->
                </div>
                <!-- Card body END -->
            </div>
        </div>
    </div>	
    <!-- Responsive offcanvas body END -->	
</div>

<!-- Custom CSS for enhanced styling -->
<style>
    .hover-bg-dark:hover {
        background-color: rgba(255, 255, 255, 0.1) !important;
        transform: translateX(5px);
    }

    .hover-primary:hover {
        color: #8B5CF6 !important;
    }

    .hover-danger:hover {
        background-color: rgba(220, 53, 69, 0.1) !important;
        border-color: #dc3545 !important;
    }

    .transition-all {
        transition: all 0.3s ease;
    }

    .icon-shape {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .icon-sm {
        width: 35px;
        height: 35px;
    }

    .bg-primary-dark {
        background-color: rgba(139, 92, 246, 0.2);
    }

    .bg-info-dark {
        background-color: rgba(13, 202, 240, 0.2);
    }

    .bg-warning-dark {
        background-color: rgba(255, 193, 7, 0.2);
    }

    .bg-danger-dark {
        background-color: rgba(220, 53, 69, 0.2);
    }

    .bg-success-soft {
        background-color: rgba(var(--bs-success-rgb), 0.1);
    }

    .bg-dark-subtle {
        background-color: rgba(33, 37, 41, 0.6);
    }

    .z-index-1 {
        z-index: 1;
    }

    .nav-link:hover {
        text-decoration: none;
    }

    .card {
        border-radius: 16px;
        background-color: #1a1d21 !important;
    }

    .rounded-3 {
        border-radius: 12px !important;
    }

    .avatar-img:hover {
        transform: scale(1.05);
        transition: transform 0.3s ease;
    }

    .bg-gradient-primary {
        background: linear-gradient(135deg, #8B5CF6 0%, #A855F7 100%) !important;
    }

    .text-primary {
        color: #8B5CF6 !important;
    }

    .border-secondary {
        border-color: rgba(255, 255, 255, 0.2) !important;
    }

    .btn-outline-danger {
        border-color: #dc3545;
        color: #dc3545;
    }

    .btn-outline-danger:hover {
        background-color: rgba(220, 53, 69, 0.1);
        border-color: #dc3545;
        color: #dc3545;
    }
</style>