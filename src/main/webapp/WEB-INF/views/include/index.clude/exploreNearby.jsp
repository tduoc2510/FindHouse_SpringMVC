<%-- 
    Document   : exploreNearby
    Created on : Feb 28, 2025, 2:22:15 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section>
    <div class="container">
        <!-- Title -->
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2 class="mb-0">Explore Nearby</h2>
            </div>
        </div>

        <div class="row g-4 g-md-5">
            <!-- Card item START -->
            <c:forEach items="${houses}" var="houses">
                <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                    <div class="card bg-transparent text-center p-1 h-100">
                        <!-- Image -->
                        <img src="assets/images/category/hotel/nearby/01.jpg" class="rounded-circle" alt="">

                        <div class="card-body p-0 pt-3">
                            <h5 class="card-title"><a href="#" class="stretched-link">${houses.name}</a></h5>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- Card item END -->
        </div> <!-- Row END -->
    </div>
</section>
