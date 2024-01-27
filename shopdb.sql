USE [MyShop2023]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](250) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](32) NULL,
	[phone] [nvarchar](15) NULL,
	[isAdmin] [int] NULL,
	[brandID] [int] NULL,
	[avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK__Account__DE508E2EFEDB3781] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[bname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[color_id] [int] NOT NULL,
	[color_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[feature_id] [int] NOT NULL,
	[feature_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Layout]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layout](
	[layout_id] [int] NOT NULL,
	[layout_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[layout_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[material_id] [int] NOT NULL,
	[material_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[order_date] [date] NULL,
	[status] [int] NULL,
	[total_money] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[odid] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[price] [money] NULL,
	[numItem] [int] NULL,
	[total_money] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[odid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[sold] [int] NULL,
	[image] [nvarchar](max) NULL,
	[intro] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[brandID] [int] NULL,
	[discount] [float] NULL,
	[view] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 1/12/2024 9:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[bid] [int] NULL,
	[cid] [int] NULL,
	[mid] [int] NULL,
	[lid] [int] NULL,
	[fid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (6, N'AKKO', N'hlhn0221@gmail.com', N'akko1', N'123', N'0862810356', 0, 1, N'https://upload.wikimedia.org/wikipedia/vi/thumb/a/a1/Man_Utd_FC_.svg/800px-Man_Utd_FC_.svg.png')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (7, N'FKEYSHOP', N'anhlehoang9@gmail.com', N'admin', N'123', N'0862810356', 1, NULL, N'https://cdn.tuoitre.vn/thumb_w/640/2022/3/16/2022-03-15t215351z782215062up1ei3f1otp6srtrmadp3soccer-champions-mun-atm-report-164738314918989417221.jpg')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (10, N'Manchester United', N'manchesterthree@gmail.com', N'user', N'123', N'0123456789', 0, NULL, N'https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (11, N'Gateron', N'gateron@gmail.com', N'gateron', N'123', N'10101010', 0, 4, N'https://cdn.shopify.com/s/files/1/0565/8070/2297/products/Gateron-logo.jpg')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (12, N'FL-Esport', N'flesport@gmail.com', N'fl', N'123', N'0862810356', 0, 2, N'https://manuals.plus/wp-content/uploads/2022/05/FL-ESPORTS-logo.jpg')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (23, N'Le Hoang Anh', N'anhlhhe176345@fpt.edu.vn', N'anhlhhe176345@fpt.edu.vn', N'123', N'0862810356', 0, NULL, N'https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (25, N'Nguoi Dung Facebook', N'fb123@gmai.com', N'user2', N'123', N'0123456789', 0, NULL, N'https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png')
INSERT [dbo].[Account] ([aid], [fullname], [email], [username], [password], [phone], [isAdmin], [brandID], [avatar]) VALUES (26, N'Lionel Messi', N'messi10@gmail.com', N'user3', N'123', N'0123456789', 0, NULL, N'https://sohanews.sohacdn.com/thumb_w/1000/160588918557773824/2023/6/7/photo-1-16861708247811388614868.jpg')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([bid], [bname]) VALUES (1, N'Akko')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (2, N'FL-Esport')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (3, N'Monsgeek')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (4, N'Gateron')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (5, N'Cherry')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (6, N'TTC')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (7, N'Logitech')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (8, N'Razer')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (9, N'Asus')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (10, N'Cherry')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (11, N'XDA')
INSERT [dbo].[Brand] ([bid], [bname]) VALUES (12, N'SA')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'SWITCH')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'CUSTOM KEYBOARD KIT')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'MECHANICAL KEYBOARD')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'KEYCAPS')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (0, NULL)
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (1, N'Black')
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (2, N'White')
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (3, N'Silver')
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (4, N'Green')
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (5, N'Blue')
INSERT [dbo].[Color] ([color_id], [color_name]) VALUES (6, N'Chocolate')
GO
INSERT [dbo].[Feature] ([feature_id], [feature_name]) VALUES (0, NULL)
INSERT [dbo].[Feature] ([feature_id], [feature_name]) VALUES (1, N'Wireless')
INSERT [dbo].[Feature] ([feature_id], [feature_name]) VALUES (2, N'Wired')
GO
INSERT [dbo].[Layout] ([layout_id], [layout_name]) VALUES (0, NULL)
INSERT [dbo].[Layout] ([layout_id], [layout_name]) VALUES (1, N'Fullsize')
INSERT [dbo].[Layout] ([layout_id], [layout_name]) VALUES (2, N'Tenkeyless')
INSERT [dbo].[Layout] ([layout_id], [layout_name]) VALUES (3, N'75%')
INSERT [dbo].[Layout] ([layout_id], [layout_name]) VALUES (4, N'65%')
GO
INSERT [dbo].[Material] ([material_id], [material_name]) VALUES (0, NULL)
INSERT [dbo].[Material] ([material_id], [material_name]) VALUES (1, N'Plastic')
INSERT [dbo].[Material] ([material_id], [material_name]) VALUES (2, N'Aluminum')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (1, 10, N'Manchester City', N'hlhn0221@gmail.com', N'0862810356', N'Dai Hoc FPT Ha Noi', CAST(N'2023-05-26' AS Date), 1, 68.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (2, 10, N'Manchester City', N'hlhn0221@gmail.com', N'0862810356', N'Dai Hoc FPT Ha Noi', CAST(N'2023-05-28' AS Date), 1, 530.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (3, 23, N'Le Hoang Anh', N'anhlhhe176345@fpt.edu.vn', N'0862810356', N'Hoa Lac', CAST(N'2023-05-29' AS Date), 1, 1225.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (4, 23, N'Le Hoang Anh', N'anhlhhe176345@fpt.edu.vn', N'0862810356', N'Hoa Lac', CAST(N'2023-06-10' AS Date), 1, 210.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (5, 25, N'Nguoi Dung Facebook', N'fb123@gmai.com', N'0123456789', N'Hoa Lac', CAST(N'2023-06-20' AS Date), 1, 1170.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (6, 10, N'Manchester United', N'manchesterthree@gmail.com', N'0123456789', N'Manchester', CAST(N'2023-06-30' AS Date), 1, 210.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (7, 10, N'Manchester United', N'manchesterthree@gmail.com', N'0123456789', N'Manchester', CAST(N'2023-07-03' AS Date), 1, 210.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (8, 10, N'Manchester United', N'manchesterthree@gmail.com', N'0123456789', N'Thanh Xuan', CAST(N'2023-07-06' AS Date), 1, 1620.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (9, 23, N'Le Hoang Anh', N'anhlhhe176345@fpt.edu.vn', N'0862810356', N'Binh Yen', CAST(N'2023-07-08' AS Date), 1, 1120.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (10, 26, N'Lionel Messi', N'messi10@gmail.com', N'0123456789', N'America', CAST(N'2023-07-07' AS Date), 1, 793.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (11, 23, N'Le Hoang Anh', N'anhlhhe176345@fpt.edu.vn', N'0862810356', N'Hoa Lac', CAST(N'2023-07-10' AS Date), 1, 580.0000)
INSERT [dbo].[Order] ([oid], [account_id], [fullname], [email], [phone], [address], [order_date], [status], [total_money]) VALUES (12, 6, N'AKKO', N'hlhn0221@gmail.com', N'0862810356', N'Ha Noi', CAST(N'2023-10-03' AS Date), 1, 10.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (1, 1, 1, 28.0000, 1, 68.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (2, 2, 1, 40.0000, 1, 68.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (3, 7, 2, 265.0000, 2, 530.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (4, 21, 3, 540.0000, 1, 1225.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (5, 8, 3, 285.0000, 1, 1225.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (6, 11, 3, 400.0000, 1, 1225.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (7, 70, 4, 21.0000, 10, 210.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (8, 49, 5, 390.0000, 3, 1170.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (9, 70, 6, 21.0000, 10, 210.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (10, 70, 7, 21.0000, 10, 210.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (11, 21, 8, 540.0000, 3, 1620.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (12, 19, 9, 290.0000, 2, 1120.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (13, 21, 9, 540.0000, 1, 1120.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (14, 58, 10, 176.0000, 2, 793.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (15, 67, 10, 220.5000, 2, 793.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (16, 19, 11, 290.0000, 2, 580.0000)
INSERT [dbo].[OrderDetail] ([odid], [product_id], [order_id], [price], [numItem], [total_money]) VALUES (17, 3, 12, 10.0000, 1, 10.0000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (1, N'Keycap Frost Witch XDA', 35.0000, 10, 1, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2023/02/DSC05022-Edit.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 11, 20, 26)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (2, N'Keycap Milk Avocado XDA', 40.0000, 10, 1, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2023/04/DSC5286-Edit.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 11, 0, 14)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (3, N'SWITCH TTC GOLD BROWN V3 TACTILE', 10.0000, 10, 1, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_d581eb7f-a7e6-43ec-9ecb-3fbd4e04276d_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 6, 0, 17)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (4, N'SWITCH TTC NCR-V2 LINEAR', 11.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_2c6f15de-6510-4679-ac52-86375e0fe11f_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 6, 0, 28)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (5, N'Keycap Danger Zone SA', 70.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2022/10/O1CN01gJTN111lE2LxwEPF2_710374786.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 12, 0, 10)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (6, N'Keycap Chocolate Aifei SA', 75.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2022/12/O1CN01C874Fr1LsB1R5XYkM_1609821354.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 12, 20, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (7, N'Razer Huntsman V2 Analog', 265.0000, 10, 2, N'https://product.hstatic.net/1000026716/product/bg_ducky_t2_2021.xlsx_ad56f0ddd75049978e546b6b05129dcf.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 8, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (8, N'Razer Blackwidow V3 Tenkeyless', 285.0000, 10, 1, N'https://product.hstatic.net/1000026716/product/gearvn-ban-phim-razer-blackwidow-v3-tenkeyless-666_24483706be45408da1aaa07a0616824b.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 8, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (9, N'KIT MonsGeek MG108W B', 190.0000, 10, 0, N'https://owlgaming.vn/wp-content/uploads/2023/04/kit-ban-phim-co-monsgeek-mg108w-black.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 0, 3)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (10, N'KIT MonsGeek MG75 W (Dual Mode)', 170.0000, 10, 0, N'https://owlgaming.vn/wp-content/uploads/2023/01/kit-ban-phim-co-monsgeek-mg75-white-6.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (11, N'KIT MonsGeek x MR.SUIT LUX', 500.0000, 10, 1, N'https://media.karousell.com/media/photos/products/2021/12/25/owlab_mr_suit_r2_babypowder_bl_1640421932_dccbf641_progressive.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 20, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (12, N'Logitech G213', 165.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/gearvn_logitechg213_5_c33273e553d3448bbec26c521965d89b.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 20, 5)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (13, N'Logitech Mechanical Gaming G413 TKL', 245.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/thumbphim_c89f6d836d1844afadb2b4cb6ec33bf8.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 0, 3)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (14, N'Logitech G PRO', 400.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/thumbphim_9c0bdbe5ab3143108b0154961ab4ed2e.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 0, 4)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (15, N'Keycap Blue Samurai cherry', 35.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2021/12/O1CN01vKycuj1LsAzSPyoU5_1609821354.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 10, 0, 5)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (16, N'Keycap Mecha 01 cherry', 45.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2022/10/O1CN01QCCYnC1NtD9hfrpwZ_689851627.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 10, 0, 6)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (17, N'SWITCH GATERON OIL KING LINEAR', 15.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/2_0b379e4c-a4b1-48fd-8021-e31ac62983a3_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'<p>A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a &ldquo;floating&rdquo; mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience. This design allows for more flex and cushioning, which can result in a softer typing experience. 5075B Plus comes with Beken Plus chip with tri-modes solution (2.4G/Bluetooth/Type-C). The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go. The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences. The keyboard also supports screw-in stabilizers.</p>
', 1, 4, 0, 7)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (18, N'SWITCH GATERON INK V2 BLACK LINEAR', 8.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_26463b7c-7a99-4c84-bb03-83d420625cae_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 4, 0, 11)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (19, N'Kit FL-Esports QK75 Crystal Grey', 290.0000, 10, 4, N'https://owlgaming.vn/wp-content/uploads/2022/03/kit-ban-phim-co-fl-esports-q75-crystal-grey.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'<p>A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a &ldquo;floating&rdquo; mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience. This design allows for more flex and cushioning, which can result in a softer typing experience. 5075B Plus comes with Beken Plus chip with tri-modes solution (2.4G/Bluetooth/Type-C). The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go. The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences. The keyboard also supports screw-in stabilizers.</p>
', 2, 2, 0, 14)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (20, N'Kit FL-Esports FL75', 175.0000, 10, 0, N'https://owlgaming.vn/wp-content/uploads/2022/03/kit-ban-phim-co-fl-esports-cmk87-ice-mint-1.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 2, 0, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (21, N'Kit FL x V65R2 Limited for Hnganh', 540.0000, 10, 5, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/436/596/products/6-1675234197193.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 2, 0, 9)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (22, N'SWITCH CHERRY MX HYPERGLIDE BLACK LINEAR', 7.0000, 10, 0, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/438/322/products/e496ac5d-c967-4c1a-9c56-399adeffe6c6.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 5, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (23, N'SWITCH CHERRY MX HYPERGLIDE BROWN TACTILE', 3.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_7144fd56-6aa7-4714-9511-cb7886704445_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 5, 20, 2)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (24, N'Asus ROG Strix Scope NX Deluxe', 270.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/h525_2116a4aa8a374b4587a29f0583d84177.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (25, N'Asus ROG Strix Scope NX', 235.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/h732_33cc0dfae75945f49871f9d6711dbea1_master_987a646275cb4b35ac7fbd3da9527dbd.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (26, N'ASUS TUF Gaming K3', 255.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/4_788b5b6e5e6c4dfbbdecc545e75f7293.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (28, N'Kit AKKO Designer Studio – MOD003', 245.0000, 10, 0, N'https://en.akkogear.com/wp-content/uploads/2021/08/Designer-Studio-003-Peacock-Blue.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 1, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (29, N'Kit AKKO ACR64', 137.0000, 10, 0, N'https://chiaki.vn/upload/product/2022/09/kit-ban-phim-co-akko-acr64-64-phim-hotswap-rgb-foam-tieu-am-gasket-mount-631708e2ade17-06092022154626.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 1, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (30, N'Keycap Dessert XDA', 25.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2023/05/O1CN01TZTxOl1cGwMJFnwxo_2490273574.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 11, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (31, N'Keycap Child hood XDA', 30.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2023/05/O1CN01kxl1111cGwMYqUsG6_2490273574.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 11, 0, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (32, N'SWITCH TTC GOLDEN RED V3 LINEAR', 5.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_6e2d5339-eb22-4ef8-bead-60f81f78ce8b_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 6, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (33, N'SWITCH TTC LIGHT CLOUD V2 LINEAR', 8.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_468db451-28fb-496f-a2ea-f04bdc2ae26d_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 6, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (34, N'Keycap Blue on White SA', 60.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2022/04/akko-keycap-set-blue-on-white-02.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 12, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (35, N'Keycap Aifei Flamingo SA', 65.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2022/06/O1CN01opD37X1NtD8BlyP9L_689851627-scaled.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 12, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (36, N'KIT MonsGeek M1', 100.0000, 10, 0, N'https://monsgeek.vn/wp-content/uploads/2023/01/%E7%99%BD%E8%89%B2%E5%A5%97%E4%BB%B6-%E6%AD%A3%E9%9D%A2.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (37, N'KIT MonsGeek M2 QMK', 150.0000, 10, 0, N'https://bizweb.dktcdn.net/100/438/322/products/3-3c10c1a2-99e6-4607-b347-dc7846e063fc.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (38, N'KIT MonsGeek M3 QMK', 315.0000, 10, 0, N'https://www.monsgeek.com/wp-content/uploads/2023/04/M3-Purple-1.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 3, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (39, N'Logitech G512 GX RGB', 225.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/thumbphim_f3885b3f5138471a957514abaece8391.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (40, N'Logitech G913 TKL Lightspeed Wireless', 275.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/thumbphim_b8b3aa506f7a422eaa3db1caa37aae35.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (41, N'Logitech G613 Wireless', 150.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/logitechg613-gearvn.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 7, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (42, N'Keycap Arctic V2 cherry', 30.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2021/11/O1CN018Qf9uB1NtDAJKoTBN_689851627.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 10, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (43, N'Keycap Bento PBT cherry', 40.0000, 10, 0, N'https://i0.wp.com/mkgshop.vn/wp-content/uploads/2020/07/DSC03685-Edit.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 4, 10, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (44, N'SWITCH GATERON G PRO 3.0 SILVER TACTTILE', 10.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/files/1_4087959b-2703-4770-acac-7bcf6fdcbc2d_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 4, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (45, N'SWITCH GATERON YELLOW LINEAR', 4.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_ddca7206-8d7e-404e-9405-73d0bd660697_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 4, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (46, N'SWITCH GATERON BLIZZARD TACTILE', 5.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/b8421501ceee8ed8defa49d79fc692df_d2938f86-6288-4e4e-bc7b-ba70fc8fd97a_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 4, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (47, N'Kit FL-Esports MK750', 120.0000, 10, 0, N'https://owlgaming.vn/wp-content/uploads/2023/05/kit-ban-phim-co-fl-esports-mk750-black.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 2, 20, 3)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (48, N'Kit FL-Esports FL MK870 Wireless', 325.0000, 10, 0, N'https://owlgaming.vn/wp-content/uploads/2022/03/fl-mk870-keyboard-clear-black.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 2, 0, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (49, N'Kit FL-Esport CMK87 Black/Gold', 390.0000, 10, 3, N'https://owlgaming.vn/wp-content/uploads/2022/03/kit-ban-phim-co-fl-esports-cmk87-polar-night-black-1.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 2, 0, 5)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (50, N'SWITCH CHERRY MX HYPERGLIDE GREEN TACTILE', 6.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/1_42198621-697d-40a3-9d16-3026f7479610_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 5, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (51, N'SWITCH CHERRY RGB RED LINEAR', 4.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/products/RGB_1_161f8ed8-58b6-4914-9773-912220060c65_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 5, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (52, N'SWITCH CHERRY MX BLACK CLEAR-TOP TACTTILE', 8.0000, 10, 0, N'https://cdn.shopify.com/s/files/1/1473/3902/files/1_2d2e4da3-b76c-4757-8de7-6d2e345c5d9f_720x.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 1, 5, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (53, N'Asus ROG Claymore II', 230.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/claymore_ii_55ecb67643874edcbe0b399817e87681.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 0, 1)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (54, N'ASUS ROG Strix Flare II Animate', 330.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/h732_e21b78ea446541868510ba3c404c3f30.png
', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (55, N'Asus ROG Falchion', 160.0000, 10, 0, N'https://product.hstatic.net/1000026716/product/h525_6d868ff042fe4aa59d13d644e449584f.png', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 3, 9, 20, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (56, N'Kit AKKO Designer Studio – MOD007S Very Peri', 300.0000, 10, 0, N'https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img,w_510/https://akko.vn/wp-content/uploads/2022/11/KIT-ban-phim-co-AKKO-MOD007S-mach-xuoi-001-510x510.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 1, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (57, N'Kit AKKO Designer Studio – MOD007v2', 250.0000, 10, 0, N'https://anphat.com.vn/media/product/41740_akko_designer_studio_mod007v2_space_gray.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 1, 0, 0)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (58, N'Kit AKKO Designer Studio – MOD006', 220.0000, 10, 2, N'https://akko.com.vn/wp-content/uploads/2021/11/kit-ban-phim-co-AKKO-Designer-Studio-mod007-space-gray-beegaming-3.jpg', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.', N'A gasket mount keyboard is a type of mechanical keyboard that uses a gasket material, such as silicone or neoprene, to create a “floating” mount for the switches. The gasket is placed between the plate and the PCB, which allows for a more flexible and cushioned typing experience.
This design allows for more flex and cushioning, which can result in a softer typing experience.

5075B Plus comes with Beken Plus chip with tri-modes solution  (2.4G/Bluetooth/Type-C).
The solution is a convenient and versatile option for users who use multiple devices and want a keyboard that can easily switch between different modes of connectivity. The ability to connect using 2.4GHz wireless, Bluetooth, or Type-C makes these keyboards compatible with a wide range of devices, while the portability and battery life benefits make them a great choice for people who are frequently on-the-go.
The stabilizer comes with POM housing and POM+TPU stem to minimize rattle and pings. They are Akko proprietary and meant to provide better out of box experiences.
The keyboard also supports screw-in stabilizers.', 2, 1, 20, 4)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (67, N'KIT KEYBOARD AKKO SPR67 – Black', 245.0000, 6, 2, N'https://akkogear.com.vn/wp-content/uploads/2023/05/kit-ban-phim-akko-spr67-gray-01-510x631.jpg', N'KIT bàn phím AKKO SPR67 là kit bàn phím cơ full nhôm hứa hẹn sẽ rất hot trong tầm giá hơn 4 triệu Đồng nhờ những ưu điểm sau:

Full nhôm, màu trắng được anode tỉ mỉ, kĩ lưỡng. Bề mặt được phủ thêm một lớp sơn nướng giúp gia tăng tuổi thọ bề mặt trong quá trình sử dụng
Mạch xuôi, không có LED do sử dụng flex-cut ENIG PCBA -> trải nghiệm gõ sẽ tối ưu', N'<p><em><strong>KIT b&agrave;n ph&iacute;m AKKO SPR67&nbsp;<img alt="heart" src="http://localhost:9999/fkbshop/libraries/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /></strong> <span style="color:#2ecc71">l&agrave; kit b&agrave;n ph&iacute;m cơ full nh&ocirc;m hứa hẹn sẽ rất hot trong tầm gi&aacute; hơn 4 triệu Đồng nhờ những ưu điểm sau: Full nh&ocirc;m, m&agrave;u trắng được anode tỉ mỉ, kĩ lưỡng.&nbsp;</span></em></p>

<ul>
	<li>Bề mặt được phủ th&ecirc;m một lớp sơn nướng gi&uacute;p gia tăng tuổi thọ bề mặt trong qu&aacute; tr&igrave;nh sử dụng Mạch xu&ocirc;i, kh&ocirc;ng c&oacute; LED do sử dụng flex-cut ENIG PCBA -&gt; trải nghiệm g&otilde; sẽ tối ưu Sử dụng cơ chế spring mount rất đặc biệt, gia tặng độ nh&uacute;n v&agrave; l&agrave;m mềm mại đều &acirc;m hơn&nbsp;</li>
	<li>Full foam v&agrave; phụ kiện đi k&egrave;m Layout 65% nhỏ gọn, thuận tiện mang v&aacute;c đi lại KIT b&agrave;n ph&iacute;m AKKO SPR67 C&oacute; mid-frame v&agrave; cả tạ đ&aacute;y gia tăng t&iacute;nh thẩm mỹ K&egrave;m sẵn 2 Plate l&agrave; POM v&agrave; FR4 ph&ugrave; hợp với nhiều lựa chọn của người d&ugrave;ng</li>
</ul>
', 2, 1, 10, 28)
INSERT [dbo].[Product] ([id], [name], [price], [quantity], [sold], [image], [intro], [description], [cateID], [brandID], [discount], [view]) VALUES (70, N'FL ESPORT HNGANH LINEAR SWITCHES', 21.0000, 20, 20, N'https://cdn.shopify.com/s/files/1/1473/3902/files/1_01a4e28e-8eed-4fda-859f-2e98bb16b8f9.jpg', N'This project is out of the wish to make a switch that has an “old school” typing feeling. While I received a sample from JERRZI, its quality shocked me. Their bottom housing is thicker than others. Therefore, its total travel is shortened to 3.7mm. Meanwhile, it’s still the stem glider that hit the bottom.', N'<ul>
	<li>Linear</li>
	<li>PCB Mount 5-Pin</li>
	<li>Top House Material: POM+UPE</li>
	<li>Bottom House Material: POM+UPE</li>
	<li>Stem Material: POK</li>
	<li>Spring: 65g Bottom out, 22mm Length</li>
	<li><strong>Lightly lubed</strong></li>
	<li>Travel：2.0mm/3.7mm normal stem pole (not a long pole)</li>
	<li>Designed by Jasper from NAJAKeys</li>
	<li>Manufactured by FL-Esport</li>
</ul>
', 1, 2, 0, 26)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (14, 1, 11, 5, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (15, 2, 11, 2, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (16, 5, 12, 5, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (17, 6, 12, 6, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (18, 15, 10, 5, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (19, 16, 10, 4, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (20, 30, 11, 2, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (21, 31, 11, 2, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (22, 34, 12, 2, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (23, 35, 12, 6, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (24, 42, 10, 3, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (25, 43, 10, 5, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (26, 3, 6, 6, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (27, 4, 6, 3, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (28, 17, 4, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (29, 18, 4, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (30, 22, 5, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (31, 23, 5, 6, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (32, 32, 2, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (33, 33, 2, 6, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (34, 44, 4, 3, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (35, 45, 4, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (36, 46, 4, 3, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (37, 50, 5, 4, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (38, 51, 5, 2, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (39, 52, 5, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (40, 9, 3, 1, 1, NULL, NULL)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (41, 10, 3, 2, 2, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (42, 11, 3, 3, 2, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (43, 19, 2, 3, 1, 3, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (44, 20, 2, 4, 1, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (45, 21, 2, 1, 2, 4, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (47, 28, 1, 4, 2, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (48, 29, 1, 2, 1, 4, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (49, 36, 3, 2, 1, 3, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (50, 37, 3, 1, 2, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (51, 38, 3, 6, 2, 2, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (52, 47, 2, 1, 1, 3, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (53, 48, 2, 3, 1, 2, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (54, 49, 2, 1, 1, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (55, 56, 1, 5, 2, 3, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (56, 57, 1, 1, 2, 3, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (57, 58, 1, 1, 2, 3, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (58, 7, 8, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (59, 8, 8, 1, 1, 2, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (60, 12, 7, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (62, 14, 7, 1, 1, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (63, 24, 9, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (64, 25, 9, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (65, 26, 9, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (66, 39, 7, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (67, 40, 7, 1, 2, 2, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (68, 41, 7, 1, 1, 1, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (69, 53, 9, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (71, 55, 9, 1, 1, 4, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (72, 54, 9, 1, 1, 1, 2)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (82, 67, 1, 1, 2, 4, 1)
INSERT [dbo].[ProductDetail] ([id], [pid], [bid], [cid], [mid], [lid], [fid]) VALUES (85, 70, 2, 6, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Acc_Brand_1] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([bid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Acc_Brand_1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OD_1] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([aid])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OD_1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OD_2] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OD_2]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OD_3] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([oid])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OD_3]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Prod_Brand_1] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([bid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Prod_Brand_1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Prod_cate_1] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Prod_cate_1]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_1] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_1]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_2] FOREIGN KEY([bid])
REFERENCES [dbo].[Brand] ([bid])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_2]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_3] FOREIGN KEY([cid])
REFERENCES [dbo].[Color] ([color_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_3]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_4] FOREIGN KEY([mid])
REFERENCES [dbo].[Material] ([material_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_4]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_5] FOREIGN KEY([lid])
REFERENCES [dbo].[Layout] ([layout_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_5]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_PD_6] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([feature_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_PD_6]
GO
