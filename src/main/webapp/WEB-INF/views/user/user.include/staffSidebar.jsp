<nav class="navbar sidebar navbar-expand-xl navbar-light">
    <!-- Navbar brand for xl START -->
    <div class="d-flex align-items-center">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <img class="light-mode-item navbar-brand-item" src="assets/images/logo.svg" alt="logo">
            <img class="dark-mode-item navbar-brand-item" src="assets/images/logo-light.svg" alt="logo">
        </a>
    </div>
    <!-- Navbar brand for xl END -->

    <div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
        <div class="offcanvas-body sidebar-content d-flex flex-column pt-4">

            <!-- Sidebar menu START -->
            <ul class="navbar-nav flex-column" id="navbar-sidebar">
                <!-- Menu item -->
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/user/profile" class="nav-link  d-flex align-items-center py-3">
                        <i class="bi bi-speedometer2 me-3 fs-5"></i>
                        <span class="fw-medium">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/user/ownerProfile/listing?page=1&size=5"
                       class="nav-link d-flex align-items-center py-3">
                        <i class="bi bi-person-badge me-3 fs-5"></i>
                        <span class="fw-medium">Manage Owner Profiles</span>
                    </a>
                </li>


                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/booking/requests/pending" class="nav-link d-flex align-items-center py-3">
                        <i class="bi bi-clock-history me-3 fs-5"></i>
                        <span class="fw-medium">Pending Bookings</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/user/tenants" class="nav-link d-flex align-items-center py-3">
                        <i class="bi bi-person-badge me-3 fs-5"></i>
                        <span class="fw-medium">Rental History </span>
                    </a>
                </li>

            </ul>
            <!-- Sidebar menu end -->

            <!-- Sidebar footer START -->
            <div class="d-flex align-items-center justify-content-between text-primary-hover mt-auto p-3">
                <a class="btn btn-outline-danger btn-sm d-flex align-items-center" 
                   href="${pageContext.request.contextPath}/logout" 
                   data-bs-toggle="tooltip" 
                   data-bs-placement="top" 
                   title="Sign out">
                    <i class="fa-solid fa-arrow-right-from-bracket me-2"></i> 
                    Log out
                </a>
            </div>
            <!-- Sidebar footer END -->

        </div>
    </div>
</nav>