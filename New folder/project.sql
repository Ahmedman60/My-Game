USE [master]
GO
/****** Object:  Database [project]    Script Date: 08/05/2017 10:38:22 م ******/
CREATE DATABASE [project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\project.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\project_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY FULL 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'project', N'ON'
GO
USE [project]
GO
/****** Object:  StoredProcedure [dbo].[addcustomers]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[addcustomers](@name nvarchar(500),@address nvarchar(100),@Gender NVARCHAR(50),
@phone nvarchar(11), @email NVARCHAR(50),@pasWord nvarchar(50))
as
insert into customers
values
(@name,@address,@Gender,@phone,@email,@pasWord)
-------------------

GO
/****** Object:  StoredProcedure [dbo].[addemps]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------
create proc [dbo].[addemps](@name nvarchar(500),@address nvarchar(100),@Gender NVARCHAR(50),
@sallary money,@phone nvarchar(11), @email NVARCHAR(50),@pasWord nvarchar(50),@managername nvarchar(100))
as								   
insert into employees
values
(@name,@address,@Gender,@sallary,@phone,@email,@pasWord,@managername)
-------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[MakeOrder]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MakeOrder](@drugname nvarchar(50),@quantity int
)
as
select m.tradename,@quantity*m.Price as price
from medecines as m
join orderdetails od
on m.drID=od.drID
where m.tradename=@drugname and od.quantity=@quantity
GO
/****** Object:  StoredProcedure [dbo].[removecustomers]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[removecustomers](@customerid int)
as 
delete customers
where customerID=@customerid
---------------------------

GO
/****** Object:  StoredProcedure [dbo].[removeemployees]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[removeemployees](@empid int)
as 
delete employees
where empID=@empid
-------------------------------
GO
/****** Object:  StoredProcedure [dbo].[removeorder]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[removeorder](@orderid int)
as
delete orders
where orderID=@orderid
------------------

GO
/****** Object:  StoredProcedure [dbo].[selectorder]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectorder] @id int
as
(
select OD.quantity,OD.DATEOFORDER ,o.customerID,o.empID,o.empID,o.price
From orderdetails as OD inner join orders as O
ON OD.orderID=O.orderID
where O.orderID=@id
)
GO
/****** Object:  StoredProcedure [dbo].[showcustomers]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showcustomers]
as 
select* from customers
----------------

GO
/****** Object:  StoredProcedure [dbo].[showemployees]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showemployees]
as 
select* from employees
---------------------------

GO
/****** Object:  Table [dbo].[category]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[companies]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[comID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customers]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[pasWord] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[empID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[sallary] [money] NULL,
	[phone] [nvarchar](11) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[pasWord] [nvarchar](50) NULL,
	[managerid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medecines]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medecines](
	[drID] [int] IDENTITY(1,1) NOT NULL,
	[tradename] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[catID] [int] NOT NULL,
	[comID] [int] NOT NULL,
	[expireddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[drID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tradename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[orderID] [int] NULL,
	[drID] [int] NULL,
	[quantity] [int] NOT NULL,
	[DATEOFORDER] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NOT NULL,
	[empID] [int] NULL,
	[customerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[medicines_view]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[medicines_view]
as 
select m.*,c.name
from companies as c
join medecines m
on c.comID=m.comID

GO
/****** Object:  View [dbo].[Resetv]    Script Date: 08/05/2017 10:38:22 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Resetv] 
as 
select o.*,od.DateOfOrder,od.quantity
from orders as o
join orderdetails od
on o.orderID=od.orderID
-------------

GO
ALTER TABLE [dbo].[medecines]  WITH CHECK ADD  CONSTRAINT [FK_medecines_category] FOREIGN KEY([catID])
REFERENCES [dbo].[category] ([catID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[medecines] CHECK CONSTRAINT [FK_medecines_category]
GO
ALTER TABLE [dbo].[medecines]  WITH CHECK ADD  CONSTRAINT [FK_medecines_companies] FOREIGN KEY([comID])
REFERENCES [dbo].[companies] ([comID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[medecines] CHECK CONSTRAINT [FK_medecines_companies]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_medecines] FOREIGN KEY([drID])
REFERENCES [dbo].[medecines] ([drID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_medecines]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[orders] ([orderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customerID])
REFERENCES [dbo].[customers] ([customerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_employees] FOREIGN KEY([empID])
REFERENCES [dbo].[employees] ([empID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_employees]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [ci_check1] CHECK  (([phone] like '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [ci_check1]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [email1_check] CHECK  (([email] like '%@phar.com'))
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [email1_check]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [pass1_check] CHECK  (([pasWord] like '__[0-9]%'))
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [pass1_check]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [ci_check] CHECK  (([phone] like '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [ci_check]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [email_check] CHECK  (([email] like '%@phar.com'))
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [email_check]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [pass_check] CHECK  (([pasWord] like '__[0-9]%'))
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [pass_check]
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
