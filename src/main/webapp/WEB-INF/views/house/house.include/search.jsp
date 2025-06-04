<%-- 
    Document   : search
    Created on : Mar 16, 2025, 9:58:55 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="col-xl-4 col-xxl-3">
    <!-- Responsive offcanvas body START -->
    <div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasSidebarLabel">Advance Filters</h5>
            <button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body flex-column p-3 p-xl-0">
            <form class="rounded-3 shadow" action="/boarding-house/searchHouse" method="get">
                <div class="card card-body rounded-0 p-4">
                    <h6 class="mb-2">
                        <i class="bi bi-search me-2"></i>Từ khóa tìm kiếm
                    </h6>
                    <input type="text" class="form-control" name="name" 
                           placeholder="Nhập tên trọ hoặc từ khóa..." 
                           value="${param.name != null ? param.name : ''}"
                           maxlength="100">
                </div>

                <hr class="my-0">

                <!-- Thành phố & Quận -->
                <div class="card card-body rounded-0 p-4">
                    <h6 class="mb-2">
                        <i class="bi bi-geo-alt me-2"></i>Địa điểm
                    </h6>
                    <select class="form-select" name="address" id="addressSelect">
                        <option value="">-- Chọn thành phố --</option>
                        <option value="Hà Nội" ${param.address == 'Hà Nội' ? 'selected' : ''}>Hà Nội</option>
                        <option value="Hồ Chí Minh" ${param.address == 'Hồ Chí Minh' ? 'selected' : ''}>Hồ Chí Minh</option>
                        <option value="Đà Nẵng" ${param.address == 'Đà Nẵng' ? 'selected' : ''}>Đà Nẵng</option>
                        <option value="Hải Phòng" ${param.address == 'Hải Phòng' ? 'selected' : ''}>Hải Phòng</option>
                        <option value="Cần Thơ" ${param.address == 'Cần Thơ' ? 'selected' : ''}>Cần Thơ</option>
                        <option value="Nha Trang" ${param.address == 'Nha Trang' ? 'selected' : ''}>Nha Trang</option>
                    </select>
                </div>

                <hr class="my-0">

                <!-- Giá tiền -->
                <div class="card card-body rounded-0 p-4">
                    <h6 class="mb-2">
                        <i class="bi bi-cash-coin me-2"></i>Khoảng giá (VNĐ/tháng)
                    </h6>

                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="minPrice" value="0" data-max="2000000"
                               ${minPrice == 0 ? 'checked' : ''}>
                        <label class="form-check-label">
                            Dưới 2 triệu
                        </label>
                    </div>

                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="minPrice" value="2000000" data-max="3000000"
                               ${minPrice == 2000000 ? 'checked' : ''}>
                        <label class="form-check-label">
                            2 - 3 triệu
                        </label>
                    </div>

                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="minPrice" value="3000000" data-max="5000000"
                               ${minPrice == 3000000 ? 'checked' : ''}>
                        <label class="form-check-label">
                            3 - 5 triệu
                        </label>
                    </div>

                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="minPrice" value="5000000" data-max="10000000"
                               ${minPrice == 5000000 ? 'checked' : ''}>
                        <label class="form-check-label">
                            5 - 10 triệu
                        </label>
                    </div>

                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="minPrice" value="10000000" data-max=""
                               ${minPrice == 10000000 ? 'checked' : ''}>
                        <label class="form-check-label">
                            Trên 10 triệu
                        </label>
                    </div>

                    <input type="hidden" name="maxPrice" id="maxPrice" value="${maxPrice}">
                </div>


                <hr class="my-0">

                <!-- Đánh giá -->
                <div class="card card-body rounded-0 p-4">
                    <h6 class="mb-2">
                        <i class="bi bi-star me-2"></i>Đánh giá tối thiểu
                    </h6>
                    <div>
                        <input type="radio" class="btn-check" name="minRating" value="" id="ratingAll"
                               ${empty minRating ? 'checked' : ''}>
                        <label class="btn btn-sm btn-light" for="ratingAll">Tất cả</label>

                        <input type="radio" class="btn-check" name="minRating" value="3" id="rating3"
                               ${minRating == 3 ? 'checked' : ''}>
                        <label class="btn btn-sm btn-light" for="rating3">3<i class="bi bi-star-fill ms-1"></i>+</label>

                        <input type="radio" class="btn-check" name="minRating" value="4" id="rating4"
                               ${minRating == 4 ? 'checked' : ''}>
                        <label class="btn btn-sm btn-light" for="rating4">4<i class="bi bi-star-fill ms-1"></i>+</label>

                        <input type="radio" class="btn-check" name="minRating" value="5" id="rating5"
                               ${minRating == 5 ? 'checked' : ''}>
                        <label class="btn btn-sm btn-light" for="rating5">5<i class="bi bi-star-fill ms-1"></i></label>
                    </div>
                </div>


                <hr class="my-0">
                <div class="d-flex justify-content-between p-2 p-xl-0 mt-xl-4">
                    <a href="/boarding-house/houseList" class="btn btn-link p-0 mb-0">Clear all</a>

                    <button type="submit" class="btn btn-primary mb-0">Tìm kiếm</button>
                </div>
            </form>

        </div>
        <!-- Buttons -->

    </div>
    <!-- Responsive offcanvas body END -->
</aside>
