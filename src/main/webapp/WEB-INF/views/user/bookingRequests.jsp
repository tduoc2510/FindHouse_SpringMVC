<%-- 
    Document   : bookingRequests
    Created on : Mar 6, 2025, 3:10:43 PM
    Author     : Thanh Duoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách yêu cầu đặt phòng</title>
    </head>
    <body>
        <h2>Danh sách yêu cầu đặt phòng</h2>

        <table border="1">

            <c:if test="${empty bookingRequests}">
                <p>Khong co</p><!-- comment -->
            </c:if>
            <c:if test="${not empty bookingRequests}">
                <tr>
                    <th>ID</th>
                    <th>Phòng</th>
                    <th>Trạng thái</th>
                    <th>Thời gian yêu cầu</th>
                </tr>
                <c:forEach var="booking" items="${bookingRequests}">
                    <tr>
                        <td>${booking.id}</td>
                        <td>${booking.room != null ? booking.room.title : 'Không xác định'}</td> 
                        <td>${booking.status}</td>
                        <td>${booking.requestedAt}</td>
                    </tr>
                </c:forEach>
            </c:if>

        </table>
    </body>
</html>

