CREATE DATABASE FindHouse2;
GO
USE FindHouse2;
GO

-- USERS
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    full_name NVARCHAR(100),
    phone_number NVARCHAR(15),
    cccd NVARCHAR(20),
    role NVARCHAR(50) NOT NULL,
    verified BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- OWNER PROFILES (đa hồ sơ)
CREATE TABLE OwnerProfiles (
    profile_id INT IDENTITY(1,1) PRIMARY KEY,
    owner_id INT NOT NULL,
    land_certificate NVARCHAR(255),
    ownership_contract NVARCHAR(255),
    approved BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);
GO

-- BOARDING HOUSES
CREATE TABLE BoardingHouses (
    house_id INT IDENTITY(1,1) PRIMARY KEY,
    profile_id INT NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    location GEOGRAPHY,
    description NVARCHAR(MAX),
    max_room_count INT NOT NULL DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (profile_id) REFERENCES OwnerProfiles(profile_id)
);
GO

-- ROOMS
CREATE TABLE Rooms (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    house_id INT NOT NULL,
    title NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    price DECIMAL(10,2) NOT NULL,
    area DECIMAL(5,2) NOT NULL,
    contract_url NVARCHAR(500),
    status NVARCHAR(50) DEFAULT 'available', 
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (house_id) REFERENCES BoardingHouses(house_id)
);
GO
-- AMENITIES: mỗi tiện ích thuộc về 1 phòng
CREATE TABLE Amenities (
    amenity_id INT PRIMARY KEY IDENTITY(1,1),
    room_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE CASCADE
);

GO
-- ROOM IMAGES
CREATE TABLE RoomImages (
    image_id INT IDENTITY(1,1) PRIMARY KEY,
    room_id INT NOT NULL,
    image_url NVARCHAR(500) NOT NULL,
    is_360 BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE CASCADE
);
GO

-- TENANTS
CREATE TABLE Tenants (
    tenant_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    rent_start DATE NOT NULL,
    rent_end DATE NULL,
    status NVARCHAR(50) DEFAULT 'active',
    contract_url NVARCHAR(500),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO

-- BOOKING REQUESTS
CREATE TABLE BookingRequests (
    request_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    status NVARCHAR(50) DEFAULT 'pending',
    reason NVARCHAR(255),
    requested_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    viewing_date DATETIME,
    contract_file NVARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO

-- REVIEWS
CREATE TABLE Reviews (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    rating INT,
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO

-- SERVICE PACKAGES
CREATE TABLE ServicePackages (
    package_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    price DECIMAL(10,2),
    duration_days INT,
    max_posts_per_month INT,
    is_featured BIT,
    has_360_images BIT,
    title_color NVARCHAR(20)
);
GO

-- REPAIR REQUESTS
CREATE TABLE RepairRequests (
    repair_id INT IDENTITY(1,1) PRIMARY KEY,
    tenant_id INT,
    room_id INT,
    issue_description NVARCHAR(MAX),
    status NVARCHAR(50) DEFAULT 'pending',
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (tenant_id) REFERENCES Tenants(tenant_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
GO
-- USERS
INSERT INTO Users (username, password, email, full_name, phone_number, cccd, role, verified)
VALUES 
('admin1', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'admin1@example.com', N'Admin 1', '0900000001', '000000001', 'admin', 1),
('admin2', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'admin2@example.com', N'Admin 2', '0900000002', '000000002', 'admin', 1),
('owner1', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'owner1@example.com', N'Chủ Trọ 1', '0910000001', '111111001', 'owner', 1),
('owner2', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'owner2@example.com', N'Chủ Trọ 2', '0910000002', '111111002', 'owner', 1),
('owner3', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'owner3@example.com', N'Chủ Trọ 3', '0910000003', '111111003', 'owner', 1),
('tenant1', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'tenant1@example.com', N'Người Thuê 1', '0920000001', '222222001', 'tenant', 1),
('tenant2', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'tenant2@example.com', N'Người Thuê 2', '0920000002', '222222002', 'tenant', 1),
('tenant3', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'tenant3@example.com', N'Người Thuê 3', '0920000003', '222222003', 'tenant', 1),
('tenant4', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'tenant4@example.com', N'Người Thuê 4', '0920000004', '222222004', 'tenant', 1),
('tenant5', '$2a$10$AghY.Sw7qQJqBLbhOICEm.wDz.LJXeXD3rWllR4p6AhvnC587qV/a', 'tenant5@example.com', N'Người Thuê 5', '0920000005', '222222005', 'tenant', 1);

-- OWNER PROFILES
INSERT INTO OwnerProfiles (owner_id, land_certificate, ownership_contract, approved)
VALUES 
(3, 'sodo1.pdf', 'contract1.pdf', 1),
(4, 'sodo2.pdf', 'contract2.pdf', 1),
(5, 'sodo3.pdf', 'contract3.pdf', 1);

-- BOARDING HOUSES
INSERT INTO BoardingHouses (profile_id, name, address, description, max_room_count)
VALUES 
(1, N'Nhà trọ A', N'123 Đường A', N'Nhà trọ gần chợ', 3),
(1, N'Nhà trọ B', N'124 Đường B', N'Nhà trọ gần trường', 2),
(2, N'Nhà trọ C', N'125 Đường C', N'Nhà trọ sạch sẽ', 3),
(2, N'Nhà trọ D', N'126 Đường D', N'Nhà trọ yên tĩnh', 2),
(3, N'Nhà trọ E', N'127 Đường E', N'Nhà trọ mới xây', 3);

-- ROOMS
-- Chèn vào bảng Rooms
INSERT INTO Rooms (house_id, title, description, price, area, contract_url)
VALUES 
(1, N'Phòng 1A', N'Phòng có máy lạnh', 2000000, 20, NULL),
(1, N'Phòng 2A', N'Phòng có ban công', 2200000, 22, NULL),
(1, N'Phòng 3A', N'Phòng tiện nghi', 2500000, 25, NULL),
(2, N'Phòng 1B', N'Phòng rẻ đẹp', 1800000, 18, NULL),
(2, N'Phòng 2B', N'Phòng yên tĩnh', 1900000, 19, NULL),
(3, N'Phòng 1C', N'Phòng sạch sẽ', 2000000, 20, NULL),
(3, N'Phòng 2C', N'Phòng rộng', 2300000, 23, NULL),
(4, N'Phòng 1D', N'Phòng tiện nghi', 2400000, 24, NULL),
(4, N'Phòng 2D', N'Phòng có bếp', 2600000, 26, NULL),
(5, N'Phòng 1E', N'Phòng cao cấp', 3000000, 30, NULL);
INSERT INTO Amenities (room_id, name)
VALUES
(1, N'Máy lạnh'),
(2, N'Ban công'),
(3, N'Tủ lạnh'),
(3, N'Máy lạnh'),
(4, N'Quạt'),
(5, N'Máy giặt'),
(6, N'Máy lạnh'),
(7, N'Máy nước nóng'),
(8, N'Tủ quần áo'),
(9, N'Bếp điện'),
(10, N'Máy lạnh'),
(10, N'Giường');
-- ROOM IMAGES
INSERT INTO RoomImages (room_id, image_url, is_360)
VALUES 
(1, 'img1.jpg', 0),
(2, 'img2.jpg', 0),
(3, 'img3.jpg', 1),
(4, 'img4.jpg', 0),
(5, 'img5.jpg', 0),
(6, 'img6.jpg', 1),
(7, 'img7.jpg', 0),
(8, 'img8.jpg', 0),
(9, 'img9.jpg', 1),
(10, 'img10.jpg', 0);

-- TENANTS
INSERT INTO Tenants (user_id, room_id, rent_start)
VALUES 
(6, 1, '2024-01-01'),
(7, 2, '2024-02-01'),
(8, 3, '2024-03-01'),
(9, 4, '2024-04-01'),
(10, 5, '2024-05-01'),
(6, 6, '2024-06-01'),
(7, 7, '2024-07-01'),
(8, 8, '2024-08-01'),
(9, 9, '2024-09-01'),
(10, 10, '2024-10-01');

-- BOOKING REQUESTS
INSERT INTO BookingRequests (user_id, room_id, status, reason)
VALUES 
(6, 1, 'approved', N'Muốn chuyển chỗ'),
(7, 2, 'approved', N'Phòng đẹp'),
(8, 3, 'pending', N'Xem phòng trước'),
(9, 4, 'pending', N'Cần gần trường'),
(10, 5, 'rejected', N'Giá cao'),
(6, 6, 'approved', N'Cần gấp'),
(7, 7, 'pending', N'Ưu tiên máy lạnh'),
(8, 8, 'approved', N'Đã xem phòng'),
(9, 9, 'rejected', N'Không vừa ý'),
(10, 10, 'pending', N'Muốn xem thêm');

-- REVIEWS
INSERT INTO Reviews (user_id, room_id, rating, comment)
VALUES 
(6, 1, 5, N'Phòng tốt, sạch sẽ'),
(7, 2, 4, N'Giá hợp lý'),
(8, 3, 3, N'Ổn trong tầm giá'),
(9, 4, 5, N'Rất hài lòng'),
(10, 5, 2, N'Không có máy lạnh'),
(6, 6, 4, N'Chủ nhà dễ tính'),
(7, 7, 5, N'Tiện nghi đầy đủ'),
(8, 8, 3, N'Phòng hơi nhỏ'),
(9, 9, 5, N'Yên tĩnh'),
(10, 10, 1, N'Không đúng như ảnh');

-- SERVICE PACKAGES
INSERT INTO ServicePackages (name, price, duration_days, max_posts_per_month, is_featured, has_360_images, title_color)
VALUES 
(N'Cỏ Cây', 0, 30, 7, 0, 0, 'green'),
(N'Hoa Lá', 100000, 30, 15, 1, 1, 'red'),
(N'Gói Bạc', 200000, 60, 20, 1, 1, 'blue'),
(N'Gói Vàng', 300000, 90, 30, 1, 1, 'gold'),
(N'Gói Kim Cương', 500000, 120, 50, 1, 1, 'purple'),
(N'Khuyến mãi', 50000, 15, 5, 0, 0, 'gray'),
(N'Dùng thử', 0, 7, 2, 0, 0, 'lightgreen'),
(N'VIP', 1000000, 365, 100, 1, 1, 'black'),
(N'Combo Đặc Biệt', 400000, 60, 25, 1, 1, 'orange'),
(N'Cơ bản', 10000, 10, 3, 0, 0, 'blue');

-- REPAIR REQUESTS
INSERT INTO RepairRequests (tenant_id, room_id, issue_description, status)
VALUES 
(1, 1, N'Hỏng bóng đèn', 'pending'),
(2, 2, N'Hỏng quạt', 'resolved'),
(3, 3, N'Không có nước nóng', 'pending'),
(4, 4, N'Hỏng ổ điện', 'in_progress'),
(5, 5, N'Vòi nước rỉ', 'resolved'),
(6, 6, N'Khóa cửa kẹt', 'pending'),
(7, 7, N'Máy lạnh không chạy', 'in_progress'),
(8, 8, N'Có muỗi nhiều', 'pending'),
(9, 9, N'Phòng có mùi', 'pending'),
(10, 10, N'Vách tường bong tróc', 'resolved');
