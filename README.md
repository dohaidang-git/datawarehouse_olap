# 📊 Data Warehouse & OLAP Project / Đồ án Kho Dữ Liệu và OLAP

## 🌐 English Description

### 🧭 Overview
This project focuses on designing and implementing a **Data Warehouse** combined with **OLAP (Online Analytical Processing)** to support data-driven decision making in businesses.  
The system integrates ETL processes, multidimensional modeling, and visualization tools to deliver analytical insights.

### 🎯 Objectives
- Design a **Star Schema** or **Snowflake Schema** for efficient data analysis.  
- Build **Fact** and **Dimension** tables for storing transactional and descriptive data.  
- Implement **ETL (Extract – Transform – Load)** pipelines using **SSIS**.  
- Develop **OLAP cubes** using **SSAS** for multidimensional analysis.  
- Create **interactive dashboards** using **Power BI** for business intelligence reporting.  

### 🏗️ Project Architecture

- 📦 data-warehouse-olap/
- ├── 📁 ETL/
- │ └── SSIS_Packages/
- ├── 📁 Database/
- │ ├── DDL_Scripts.sql
- │ ├── FactTables/
- │ └── DimensionTables/
- ├── 📁 OLAP/
- │ └── SSAS_Cubes/
- ├── 📁 Reports/
- │ └── PowerBI_Dashboards/
- ├── 📁 Docs/
- │ └── Data_Model_Diagram.png
- └── README.md

### ⚙️ Tools & Technologies
- **Microsoft SQL Server** – Data warehouse storage  
- **SSIS (SQL Server Integration Services)** – ETL implementation  
- **SSAS (SQL Server Analysis Services)** – OLAP cube modeling  
- **Power BI** – Visualization and reporting  
- **Excel** – Initial data source  
- **ER/Studio / draw.io** – Data modeling  

### 🚀 How to Run
1. Restore or execute the SQL scripts from the `Database/` folder.  
2. Open `ETL/SSIS_Packages` in **Visual Studio (Integration Services Project)**.  
3. Execute ETL packages to load data into the warehouse.  
4. Deploy **OLAP cubes** from the `SSAS_Cubes` folder.  
5. Connect **Power BI** to the cube or SQL Server for visualization.

### 📈 Example Output
- Star Schema diagram (Fact & Dimension tables)  
- OLAP Cube structure  
- Power BI dashboard screenshot  

---

## 🇻🇳 Mô tả Tiếng Việt

### 🧭 Tổng quan
Dự án này nhằm **thiết kế và triển khai Kho Dữ Liệu (Data Warehouse)** kết hợp với **OLAP (Phân tích trực tuyến đa chiều)** để hỗ trợ doanh nghiệp trong việc **phân tích dữ liệu và ra quyết định**.  
Hệ thống bao gồm quá trình ETL, mô hình dữ liệu đa chiều và trực quan hóa bằng Power BI.

### 🎯 Mục tiêu
- Xây dựng mô hình **Star Schema hoặc Snowflake Schema**.  
- Thiết kế các **bảng Fact và Dimension**.  
- Thực hiện **ETL (Trích xuất – Biến đổi – Tải dữ liệu)** bằng **SSIS**.  
- Tạo các **khối OLAP (OLAP Cubes)** bằng **SSAS**.  
- Xây dựng **báo cáo và dashboard trực quan** với **Power BI**.  

### ⚙️ Công nghệ sử dụng
- **Microsoft SQL Server** – Lưu trữ kho dữ liệu  
- **SSIS** – Thực hiện quá trình ETL  
- **SSAS** – Mô hình hóa OLAP  
- **Power BI** – Trực quan hóa và báo cáo  
- **Excel** – Dữ liệu nguồn ban đầu  
- **draw.io / ERD Tools** – Thiết kế mô hình dữ liệu  

### 🚀 Cách chạy dự án
1. Chạy các script SQL trong thư mục `Database/` để tạo cấu trúc kho dữ liệu.  
2. Mở các gói SSIS trong `ETL/SSIS_Packages` bằng **Visual Studio**.  
3. Thực thi các gói ETL để nạp dữ liệu.  
4. Triển khai **OLAP Cubes** trong thư mục `SSAS_Cubes`.  
5. Kết nối **Power BI** với kho dữ liệu hoặc cube để tạo báo cáo.  

### 📈 Kết quả đầu ra
- Sơ đồ **Star Schema** (gồm bảng Fact và Dimension).  
- Cấu trúc **OLAP Cube**.  
- Hình ảnh **Dashboard Power BI** minh họa kết quả phân tích.

---

### 📚 Authors / Nhóm thực hiện
- **Name:** [Đỗ Hải Đăng]  
- **University:** [Trường đại học Công Nghệ Thông Tin - ĐHQGHCM / Khoa Hệ Thống Thông Tin/ Kho dữ liệu và OLAP]  
- **Semester:** [Học kỳ 3 - Năm học 2025-2026]  
- **Instructor:** [Đỗ Thị Minh Phụng]  

---

### 🧾 License
This project is for **educational purposes** and may be freely used for learning and academic demonstrations.  
(Dự án phục vụ mục đích **học tập và nghiên cứu**, có thể sử dụng tự do trong phạm vi giáo dục.)

---
