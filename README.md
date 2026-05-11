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

```text
datawarehouse_olap/
├── data/
│   └── raw/
│       └── spotify_2025_9regions_separate_artists.csv
├── sql/
│   ├── schema/
│   │   └── create_spotify_datawarehouse.sql
│   └── mdx/
│       └── spotify_olap_queries.mdx
├── etl/
│   └── ssis_spotify_doan/
├── olap/
│   └── ssas_spotify/
├── bi/
│   └── powerbi/
│       └── spotify_datawarehouse_report.pbix
├── docs/
│   ├── notes/
│   └── screenshots/
├── README.md
└── RUN_PROJECT.md
```

### ⚙️ Tools & Technologies
- **Microsoft SQL Server** – Data warehouse storage  
- **SSIS (SQL Server Integration Services)** – ETL implementation  
- **SSAS (SQL Server Analysis Services)** – OLAP cube modeling  
- **Power BI** – Visualization and reporting  
- **Excel** – Initial data source  
- **ER/Studio / draw.io** – Data modeling  

### 🚀 How to Run
1. Execute the schema script in `sql/schema/`.  
2. Open the SSIS solution in `etl/ssis_spotify_doan/` with **Visual Studio**.  
3. Execute ETL packages to load data into the warehouse.  
4. Deploy the SSAS project from `olap/ssas_spotify/`.  
5. Open the Power BI report in `bi/powerbi/`.

Detailed local run instructions: see `RUN_PROJECT.md`.

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
1. Chạy script tạo schema trong `sql/schema/`.  
2. Mở solution SSIS trong `etl/ssis_spotify_doan/` bằng **Visual Studio**.  
3. Thực thi ETL để nạp dữ liệu vào kho dữ liệu.  
4. Triển khai project SSAS trong `olap/ssas_spotify/`.  
5. Mở báo cáo Power BI trong `bi/powerbi/`.  

Hướng dẫn chạy chi tiết ở file `RUN_PROJECT.md`.

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
