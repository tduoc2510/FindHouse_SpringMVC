<%-- 
    Document   : mainBanner
    Created on : Feb 28, 2025, 2:28:08 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="pt-3 pt-lg-5">
    <div class="container">
        <!-- Content and Image START -->
        <div class="row g-4 g-lg-5">
            <!-- Content -->
            <div class="col-lg-6 position-relative mb-4 mb-md-0">
                <!-- Title -->
                <h1 class="mb-4 mt-md-5 display-5">Tìm nhà trọ
                    <span class="position-relative z-index-9">gần đây.
                    </span>
                </h1>
                <!-- Info -->
                <p class="mb-4">Chúng tôi mang đến cho bạn không chỉ một chỗ trọ, mà còn một trải nghiệm phù hợp với ngân sách để tìm được nơi ở lý tưởng.</p>

                <!-- Buttons -->
                <div class="hstack gap-4 flex-wrap align-items-center">
                    <!-- Button -->
                    <a href="#timtro" class="btn btn-primary-soft mb-0">Tìm ngay</a>
                    <!-- Story button -->

                </div>
            </div>

            <!-- Image -->
            <div class="col-lg-6 position-relative">

                <img src="assets/images/bg/06.jpg" class="rounded" alt="">

                <!-- Support guid -->
                <div class="position-absolute top-0 end-0 z-index-1 mt-n4">
                    <div class="bg-blur border border-light rounded-3 text-center shadow-lg p-3">
                        <!-- Title -->
                        <i class="bi bi-headset text-danger fs-3"></i>
                        <h5 class="text-dark mb-1">24 / 7</h5>
                        <h6 class="text-dark fw-light small mb-0">Guide Supports</h6>
                    </div>
                </div>

                <!-- Round image group -->
                <div
                    class="vstack gap-5 align-items-center position-absolute top-0 start-0 d-none d-md-flex mt-4 ms-n3">
                    <img class="icon-lg shadow-lg border border-3 border-white rounded-circle"
                         src="assets/images/category/hotel/4by3/11.jpg" alt="avatar">
                    <img class="icon-xl shadow-lg border border-3 border-white rounded-circle"
                         src="assets/images/category/hotel/4by3/12.jpg" alt="avatar">
                </div>
            </div>
        </div>
        <!-- Content and Image END -->

        <!-- Search START -->
        <div class="row">
            <div class="col-xl-10 position-relative mt-n3 mt-xl-n9">
                <!-- Title -->
                <h6 class="d-none d-xl-block mb-3">Check Availability</h6>

                <!-- Booking from START -->
                <form class="card shadow rounded-3 position-relative p-4 pe-md-5 pb-5 pb-md-4">
                    <div class="row g-4 align-items-center">
                        <!-- Location -->
                        <div class="col-lg-4">
                            <div class="form-control-border form-control-transparent form-fs-md d-flex">
                                <!-- Icon -->
                                <i class="bi bi-geo-alt fs-3 me-2 mt-2"></i>
                                <!-- Select input -->
                                <div class="flex-grow-1">
                                    <label class="form-label">Location</label>
                                    <select class="form-select js-choice" data-search-enabled="true">
                                        <option value="">Select location</option>
                                        <option>Đà Nẵng, Việt Nam</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Guest -->
                        <div class="col-lg-4">
                            <div class="form-control-border form-control-transparent form-fs-md d-flex">
                                <!-- Icon -->
                                <i class="bi bi-person fs-3 me-2 mt-2"></i>
                                <!-- Dropdown input -->
                                <div class="w-100">
                                    <label class="form-label">Guests & rooms</label>
                                    <div class="dropdown guest-selector me-2">
                                        <input type="text"
                                               class="form-guest-selector form-control selection-result"
                                               value="2 Guests 1 Room" data-bs-auto-close="outside"
                                               data-bs-toggle="dropdown">

                                        <!-- dropdown items -->
                                        <ul class="dropdown-menu guest-selector-dropdown">
                                            <!-- Adult -->
                                            <li class="d-flex justify-content-between">
                                                <div>
                                                    <h6 class="mb-0">Adults</h6>
                                                    <small>Ages 13 or above</small>
                                                </div>

                                                <div class="hstack gap-1 align-items-center">
                                                    <button type="button"
                                                            class="btn btn-link adult-remove p-0 mb-0"><i
                                                            class="bi bi-dash-circle fs-5 fa-fw"></i></button>
                                                    <h6 class="guest-selector-count mb-0 adults">2</h6>
                                                    <button type="button"
                                                            class="btn btn-link adult-add p-0 mb-0"><i
                                                            class="bi bi-plus-circle fs-5 fa-fw"></i></button>
                                                </div>
                                            </li>

                                            <!-- Divider -->
                                            <li class="dropdown-divider"></li>

                                            <!-- Child -->
                                            <li class="d-flex justify-content-between">
                                                <div>
                                                    <h6 class="mb-0">Child</h6>
                                                    <small>Ages 13 below</small>
                                                </div>

                                                <div class="hstack gap-1 align-items-center">
                                                    <button type="button"
                                                            class="btn btn-link child-remove p-0 mb-0"><i
                                                            class="bi bi-dash-circle fs-5 fa-fw"></i></button>
                                                    <h6 class="guest-selector-count mb-0 child">0</h6>
                                                    <button type="button"
                                                            class="btn btn-link child-add p-0 mb-0"><i
                                                            class="bi bi-plus-circle fs-5 fa-fw"></i></button>
                                                </div>
                                            </li>

                                            <!-- Divider -->
                                            <li class="dropdown-divider"></li>

                                            <!-- Rooms -->
                                            <li class="d-flex justify-content-between">
                                                <div>
                                                    <h6 class="mb-0">Rooms</h6>
                                                    <small>Max room 8</small>
                                                </div>

                                                <div class="hstack gap-1 align-items-center">
                                                    <button type="button"
                                                            class="btn btn-link room-remove p-0 mb-0"><i
                                                            class="bi bi-dash-circle fs-5 fa-fw"></i></button>
                                                    <h6 class="guest-selector-count mb-0 rooms">1</h6>
                                                    <button type="button"
                                                            class="btn btn-link room-add p-0 mb-0"><i
                                                            class="bi bi-plus-circle fs-5 fa-fw"></i></button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Button -->
                    <div class="btn-position-md-middle">
                        <a class="icon-lg btn btn-round btn-primary mb-0" href="#"><i
                                class="bi bi-search fa-fw"></i></a>
                    </div>
                </form>
                <!-- Booking from END -->
            </div>
        </div>
        <!-- Search END -->
    </div>
</section>