<%-- 
    Document   : signUp
    Created on : Mar 2, 2025, 3:19:32 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from stackbros.in/bookinga/landing/sign-up.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 14 Jan 2025 15:03:39 GMT -->
    <%@include file="../include/head.jsp" %>

    <body>

        <!-- **************** MAIN CONTENT START **************** -->        
        <%@include file="../include/header.jsp" %>

        <main>

            <!-- =======================
            Menu item START -->
            <%@include file="user.include/ownerNavbar.jsp" %>

            <!-- =======================
            Menu item END -->

            <!-- =======================
            Content START -->
            <section class="pt-0">
                <div class="container vstack gap-4">
                    <!-- Title START -->
                    <div class="row">
                        <div class="col-12">
                            <h1 class="fs-4 mb-0"><i class="bi bi-house-door fa-fw me-1"></i>Dashboard</h1>
                        </div>
                    </div>	
                    <!-- Title END -->
                    <div class="bg-secondary text-white p-4 rounded" style=" height: 300px;">
                        <h5 class="text-center">Chỗ Này Làm Thống kê</h5>
                        <div class="row g-4">
                            <!-- Nội dung thống kê ở đây -->
                        </div>
                    </div>
                    <!-- Counter START -->
                    <!--                    <div class="row g-4">
                                             Counter item 
                                            <div class="col-sm-6 col-xl-3">
                                                <div class="card card-body border">
                                                    <div class="d-flex align-items-center">
                                                         Icon 
                                                        <div class="icon-xl bg-success rounded-3 text-white">
                                                            <i class="bi bi-journals"></i>
                                                        </div>
                                                         Content 
                                                        <div class="ms-3">
                                                            <h4>56</h4>
                                                            <span>Total Listings</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                    
                                             Counter item 
                                            <div class="col-sm-6 col-xl-3">
                                                <div class="card card-body border">
                                                    <div class="d-flex align-items-center">
                                                         Icon 
                                                        <div class="icon-xl bg-info rounded-3 text-white">
                                                            <i class="bi bi-graph-up-arrow"></i>
                                                        </div>
                                                         Content 
                                                        <div class="ms-3">
                                                            <h4>$2,55,365</h4>
                                                            <span>Earning</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                    
                                             Counter item 
                                            <div class="col-sm-6 col-xl-3">
                                                <div class="card card-body border">
                                                    <div class="d-flex align-items-center">
                                                         Icon 
                                                        <div class="icon-xl bg-warning rounded-3 text-white">
                                                            <i class="bi bi-bar-chart-line-fill"></i>
                                                        </div>
                                                         Content 
                                                        <div class="ms-3">
                                                            <h4>15K</h4>
                                                            <span>Visitors</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                    
                                             Counter item 
                                            <div class="col-sm-6 col-xl-3">
                                                <div class="card card-body border">
                                                    <div class="d-flex align-items-center">
                                                         Icon 
                                                        <div class="icon-xl bg-primary rounded-3 text-white">
                                                            <i class="bi bi-star"></i>
                                                        </div>
                                                         Content 
                                                        <div class="ms-3">
                                                            <h4>12K</h4>
                                                            <span>Total Reviews</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
                    <!-- Counter END -->



                    <!-- Booking table START -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card border rounded-3">
                                <!-- Card header START -->
                                <div class="card-header border-bottom">
                                    <div class="d-sm-flex justify-content-between align-items-center">
                                        <h5 class="mb-2 mb-sm-0">Upcoming Bookings</h5>
                                        <a href="#" class="btn btn-sm btn-primary mb-0">View All</a>
                                    </div>
                                </div>
                                <!-- Card header END -->

                                <!-- Card body START -->
                                <div class="card-body">
                                    <!-- Search and select START -->
                                    <div class="row g-3 align-items-center justify-content-between mb-3">
                                        <!-- Search -->
                                        <div class="col-md-8">
                                            <form class="rounded position-relative">
                                                <input class="form-control pe-5" type="search" placeholder="Search" aria-label="Search">
                                                <button class="btn border-0 px-3 py-0 position-absolute top-50 end-0 translate-middle-y" type="submit"><i class="fas fa-search fs-6"></i></button>
                                            </form>
                                        </div>

                                        <!-- Select option -->
                                        <div class="col-md-3">
                                            <!-- Short by filter -->
                                            <form>
                                                <select class="form-select js-choice" aria-label=".form-select-sm">
                                                    <option value="">Sort by</option>
                                                    <option>Free</option>
                                                    <option>Newest</option>
                                                    <option>Oldest</option>
                                                </select>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- Search and select END -->

                                    <!-- Hotel room list START -->
                                    <div class="table-responsive border-0">
                                        <table class="table align-middle p-4 mb-0 table-hover table-shrink">
                                            <!-- Table head -->
                                            <thead class="table-light">
                                                <tr>
                                                    <th scope="col" class="border-0 rounded-start">#</th>
                                                    <th scope="col" class="border-0">Tên người đặt</th>
                                                    <th scope="col" class="border-0">Số điện thoại</th>
                                                    <th scope="col" class="border-0">Phòng</th>
                                                    <th scope="col" class="border-0">Giá phòng</th>
                                                    <th scope="col" class="border-0">Ngày đăng ký</th>
                                                    <th scope="col" class="border-0">Ngày hẹn xem phòng</th>

                                                    <th scope="col" class="border-0">Trạng thái</th>
                                                    <th scope="col" class="border-0 rounded-end">Action</th>
                                                </tr>
                                            </thead>

                                            <!-- Table body START -->

                                            <tbody class="border-top-0">
                                                <c:forEach items="${bookingRequests}" var="bookingRequest">
                                                    <tr>
                                                        <td><h6 class="mb-0">${bookingRequest.id}</h6></td>
                                                        <td><h6 class="mb-0"><a href="#">${bookingRequest.user.fullName}</a></h6></td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'confirm3'}">
                                                                    <div class="badge bg-success bg-opacity-10 text-success">
                                                                        ${bookingRequest.user.phoneNumber}
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="badge bg-success bg-opacity-10 text-success">
                                                                        ${fn:substring(bookingRequest.user.phoneNumber, 0, 3)}******
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${bookingRequest.room.title}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${bookingRequest.room.price}" /> VNĐ
                                                        </td>
                                                        <td>
                                                            <fmt:formatDate value="${bookingRequest.requestedAtAsDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                        </td>
                                                        <td>
                                                            <fmt:formatDate value="${bookingRequest.viewingDateAsDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'pending'}">
                                                                    <div class="badge text-bg-warning">Đang chờ xác nhận</div>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm1'}">
                                                                    <div class="badge text-bg-warning">Đang đợi chủ trọ xác nhận</div>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm2'}">
                                                                    <div class="badge text-bg-warning">Đang chờ khách thanh toán</div>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'confirm3'}">
                                                                    <div class="badge text-bg-success">Đã xác nhận</div>
                                                                </c:when>
                                                                <c:when test="${bookingRequest.status == 'rejected'}">
                                                                    <div class="badge text-bg-danger">Từ chối</div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="badge text-bg-danger">${bookingRequest.status}</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bookingRequest.status == 'confirm1'}">
                                                                    <form id="form-${bookingRequest.id}">
                                                                        <input type="hidden" name="requestId" value="${bookingRequest.id}" />
                                                                        <input type="hidden" id="status_${bookingRequest.id}" name="status" />
                                                                        <input type="hidden" id="reason_${bookingRequest.id}" name="reason" />

                                                                        <button type="button" class="btn btn-success" onclick="acceptRequest(${bookingRequest.id})">Accept</button>
                                                                        <button type="button" class="btn btn-danger" onclick="rejectRequest(${bookingRequest.id})">Reject</button>
                                                                    </form>

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="badge text-bg-secondary">None</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>


                                            <script>
                                                function acceptRequest(id) {
                                                    updateStatus(id, "confirm2", "");
                                                }

                                                function rejectRequest(id) {
                                                    const reason = prompt("Vui lòng nhập lý do từ chối:");
                                                    if (!reason || reason.trim() === "") {
                                                        alert("Bạn phải nhập lý do!");
                                                        return;
                                                    }
                                                    updateStatus(id, "rejected", reason);
                                                }

                                                function updateStatus(id, status, reason) {
                                                    const formData = new FormData();
                                                    formData.append("requestId", id);
                                                    formData.append("status", status);
                                                    formData.append("reason", reason);

                                                    fetch("${pageContext.request.contextPath}/booking/update-status", {
                                                        method: "POST",
                                                        body: formData
                                                    })
                                                            .then(response => {
                                                                if (!response.ok)
                                                                    throw new Error("Lỗi máy chủ");
                                                                return response.text();
                                                            })
                                                            .then(data => {
                                                                alert("Cập nhật trạng thái thành công!");
                                                                // Gợi ý: cập nhật UI tại chỗ, hoặc reload một phần bảng
                                                                location.reload(); // hoặc cập nhật DOM cụ thể
                                                            })
                                                            .catch(error => {
                                                                alert("Đã xảy ra lỗi: " + error.message);
                                                            });
                                                }
                                            </script>





                                            <!-- Table body END -->
                                        </table>
                                    </div>
                                    <!-- Hotel room list END -->
                                </div>
                                <!-- Card body END -->

                                <!-- Card footer START -->
                                <div class="card-footer pt-0">
                                    <!-- Pagination and content -->
                                    <div class="d-sm-flex justify-content-sm-between align-items-sm-center">
                                        <!-- Content -->
                                        <p class="mb-sm-0 text-center text-sm-start">Showing 1 to 8 of 20 entries</p>
                                        <!-- Pagination -->
                                        <nav class="mb-sm-0 d-flex justify-content-center" aria-label="navigation">
                                            <ul class="pagination pagination-sm pagination-primary-soft mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">Prev</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item disabled"><a class="page-link" href="#">..</a></li>
                                                <li class="page-item"><a class="page-link" href="#">15</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                                <!-- Card footer END -->
                            </div>
                        </div>
                    </div>	
                    <!-- Booking table END -->
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