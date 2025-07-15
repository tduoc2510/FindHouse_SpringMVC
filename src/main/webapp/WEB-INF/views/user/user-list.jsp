<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Danh sách người dùng</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
            }
            th {
                background-color: #f4f4f4;
            }
            form.add-form {
                border: 1px solid #ccc;
                padding: 15px;
                margin-bottom: 20px;
                background: #f9f9f9;
            }
            .form-row {
                margin-bottom: 10px;
            }
            label {
                display: inline-block;
                width: 120px;
            }
            input, select {
                width: calc(100% - 130px);
                padding: 4px;
            }
            button {
                margin-top: 10px;
                padding: 6px 12px;
                background: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 4px;
            }
            a.button {
                display: inline-block;
                padding: 4px 8px;
                margin: 2px;
                background-color: #2196F3;
                color: white;
                text-decoration: none;
                border-radius: 3px;
            }
            a.button.delete {
                background-color: #f44336;
            }

            /* Modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 60px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                background-color: #fff;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 50%;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <h2>📋 Danh sách Người dùng</h2>

        <!-- FORM ADD -->
        <form method="post" action="<c:url value='/user/add'/>" class="add-form">
            <h3>➕ Thêm mới Người dùng</h3>

            <div class="form-row"><label>Username:</label><input type="text" name="username" required /></div>
            <div class="form-row"><label>Password:</label><input type="password" name="password" required /></div>
            <div class="form-row"><label>Email:</label><input type="email" name="email" required /></div>
            <div class="form-row"><label>Họ tên:</label><input type="text" name="fullName" /></div>
            <div class="form-row"><label>Phone:</label><input type="text" name="phoneNumber" /></div>
            <div class="form-row"><label>CCCD:</label><input type="text" name="cccd" /></div>
            <div class="form-row"><label>Role:</label><input type="text" name="role" required /></div>
            <div class="form-row">
                <label>Verified:</label>
                <select name="verified">
                    <option value="true">✅ Đã xác thực</option>
                    <option value="false" selected>❌ Chưa xác thực</option>
                </select>
            </div>

            <button type="submit">💾 Lưu</button>
        </form>

        <!-- TABLE LIST -->
        <table>
            <thead>
                <tr>
                    <th>ID</th><th>Username</th><th>Email</th><th>Full Name</th>
                    <th>Phone</th><th>CCCD</th><th>Role</th><th>Verified</th><th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.fullName}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.cccd}</td>
                        <td>${user.role}</td>
                        <td>${user.verified ? '✅' : '❌'}</td>
                        <td>
                            <a href="javascript:void(0);" class="button edit-btn"
                               data-id="${user.id}"
                               data-username="${user.username}"
                               data-email="${user.email}"
                               data-fullname="${user.fullName}"
                               data-phone="${user.phoneNumber}"
                               data-cccd="${user.cccd}"
                               data-role="${user.role}"
                               data-verified="${user.verified}">✏️ Sửa</a>
                            <a href="<c:url value='/user/delete/${user.id}'/>" class="button delete"
                               onclick="return confirm('Xác nhận xoá người dùng này?')">🗑️ Xoá</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- MODAL EDIT -->
        <div id="editModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3>✏️ Sửa Người dùng</h3>

                <form method="post" action="<c:url value='/user/edit'/>" id="editForm">
                    <input type="hidden" name="id" id="editId" />

                    <div class="form-row"><label>Username:</label><input type="text" name="username" id="editUsername" required /></div>
                    <div class="form-row"><label>Email:</label><input type="email" name="email" id="editEmail" required /></div>
                    <div class="form-row"><label>Họ tên:</label><input type="text" name="fullName" id="editFullName" /></div>
                    <div class="form-row"><label>Phone:</label><input type="text" name="phoneNumber" id="editPhone" /></div>
                    <div class="form-row"><label>CCCD:</label><input type="text" name="cccd" id="editCccd" /></div>
                    <div class="form-row"><label>Role:</label><input type="text" name="role" id="editRole" required /></div>
                    <div class="form-row">
                        <label>Verified:</label>
                        <select name="verified" id="editVerified">
                            <option value="true">✅ Đã xác thực</option>
                            <option value="false">❌ Chưa xác thực</option>
                        </select>
                    </div>

                    <button type="submit">💾 Cập nhật</button>
                </form>
            </div>
        </div>

        <script>
            const modal = document.getElementById("editModal");
            const closeBtn = document.querySelector(".close");

            document.querySelectorAll(".edit-btn").forEach(btn => {
                btn.addEventListener("click", () => {
                    document.getElementById("editId").value = btn.dataset.id;
                    document.getElementById("editUsername").value = btn.dataset.username;
                    document.getElementById("editEmail").value = btn.dataset.email;
                    document.getElementById("editFullName").value = btn.dataset.fullname;
                    document.getElementById("editPhone").value = btn.dataset.phone;
                    document.getElementById("editCccd").value = btn.dataset.cccd;
                    document.getElementById("editRole").value = btn.dataset.role;
                    document.getElementById("editVerified").value = btn.dataset.verified;

                    modal.style.display = "block";
                });
            });

            closeBtn.onclick = () => modal.style.display = "none";
            window.onclick = (e) => {
                if (e.target == modal)
                    modal.style.display = "none";
            }
        </script>

    </body>
</html>
