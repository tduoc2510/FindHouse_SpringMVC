-- Tạo cơ sở dữ liệu
CREATE DATABASE FindHouse;
GO
USE FindHouse;
GO

-- Bảng Người Dùng (Users)
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    full_name NVARCHAR(100),
    phone_number NVARCHAR(15),
    role NVARCHAR(50) CHECK (role IN ('tenant', 'owner', 'admin')) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Bảng Căn Hộ (Apartments)
CREATE TABLE Apartments (
    apartment_id INT IDENTITY(1,1) PRIMARY KEY,
    owner_id INT,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);
GO

-- Bảng Phòng (Rooms)
CREATE TABLE Rooms (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    apartment_id INT,
    title NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    price DECIMAL(10,2) NOT NULL,
    area DECIMAL(5,2) NOT NULL,
    amenities NVARCHAR(MAX),
    status NVARCHAR(50) CHECK (status IN ('available', 'rented')) DEFAULT 'available',
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);
GO

-- Bảng Yêu Cầu Thuê (BookingRequests)
CREATE TABLE BookingRequests (
    request_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    room_id INT,
    status NVARCHAR(50) CHECK (status IN ('pending', 'confirmed', 'rejected')) DEFAULT 'pending',
    requested_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO

-- Bảng Bình Luận và Đánh Giá (Reviews)
CREATE TABLE Reviews (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    room_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO

-- Chỉ mục tối ưu truy vấn
CREATE INDEX idx_username ON Users(username);
CREATE INDEX idx_apartment_name ON Apartments(name);
CREATE INDEX idx_room_title ON Rooms(title);
CREATE INDEX idx_review_rating ON Reviews(rating);
GO

-- Dữ liệu mẫu
INSERT INTO Users (username, password, email, full_name, phone_number, role) VALUES
('owner1', 'hashedpassword', 'owner1@mail.com', 'Nguyen Van A', '0123456789', 'owner'),
('tenant1', 'hashedpassword', 'tenant1@mail.com', 'Le Thi B', '0987654321', 'tenant');

INSERT INTO Apartments (owner_id, name, address, description) VALUES
(1, 'Căn hộ Lux', '123 Đường ABC, TP. HCM', 'Căn hộ cao cấp tại trung tâm thành phố.');

INSERT INTO Rooms (apartment_id, title, description, price, area, amenities, status) VALUES
(1, 'Phòng Deluxe', 'Phòng có view đẹp', 5000000, 30, 'WiFi, Máy lạnh', 'available'),
(1, 'Phòng Tiêu Chuẩn', 'Phòng phù hợp sinh viên', 3000000, 20, 'WiFi', 'available');
