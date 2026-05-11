# Spotify Data Warehouse, OLAP, and BI Project

Portfolio project for designing and implementing an end-to-end analytics stack on Spotify chart data using `SQL Server`, `SSIS`, `SSAS`, and `Power BI`.

This repository shows how raw chart data can be transformed into a structured warehouse, exposed through an OLAP cube, and consumed in BI dashboards for interactive analysis.

## Project Summary

I built a small business intelligence workflow around Spotify daily ranking data across multiple regions in 2025.

The project covers:

- relational warehouse design with fact and dimension tables
- ETL from flat-file source into SQL Server with `SSIS`
- OLAP cube modeling with `SSAS`
- multidimensional analysis with `MDX`
- dashboarding and reporting with `Power BI`

## Business Objective

The goal is to support analytical questions such as:

- which songs and artists perform best by country or region
- how popularity changes over time
- which songs move strongly on daily or weekly rankings
- how explicitness, tempo, energy, and other audio features relate to chart performance

## What I Built

### 1. Data Warehouse

Designed a star-schema style warehouse centered on `Fact_Daily_Ranking`.

Main modeled entities:

- `Dim_Date`
- `Dim_Country`
- `Dim_Artist`
- `Dim_Album`
- `Dim_Song`
- `Bridge_Song_Artist`
- `Fact_Daily_Ranking`

The warehouse schema is provided in:

- [`sql/schema/create_spotify_datawarehouse.sql`](./sql/schema/create_spotify_datawarehouse.sql)

### 2. ETL Pipeline

Built an `SSIS` package that ingests the raw Spotify CSV file and loads the warehouse tables in SQL Server.

Deliverables:

- [`etl/ssis_spotify_doan/SSIS_Spotify_DoAn/SSIS_Spotify_DoAn.sln`](./etl/ssis_spotify_doan/SSIS_Spotify_DoAn/SSIS_Spotify_DoAn.sln)
- [`etl/ssis_spotify_doan/SSIS_Spotify_DoAn/SSIS_Spotify_DoAn/Package.dtsx`](./etl/ssis_spotify_doan/SSIS_Spotify_DoAn/SSIS_Spotify_DoAn/Package.dtsx)

### 3. OLAP Cube

Built an `SSAS` cube for slice, dice, roll-up, drill-down, and cross-dimensional exploration.

Core cube assets:

- [`olap/ssas_spotify/SSAS_Spotify/SSAS_Spotify.sln`](./olap/ssas_spotify/SSAS_Spotify/SSAS_Spotify.sln)
- cube definition
- dimensions for `Artist`, `Country`, `Date`, and `Song`
- relational data source and data source view

### 4. BI Dashboard

Created a `Power BI` report on top of the warehouse / cube layer for business-facing exploration.

Report file:

- [`bi/powerbi/spotify_datawarehouse_report.pbix`](./bi/powerbi/spotify_datawarehouse_report.pbix)

### 5. Analytical Query Layer

Prepared reusable `MDX` examples to validate and demonstrate the OLAP model.

Query file:

- [`sql/mdx/spotify_olap_queries.mdx`](./sql/mdx/spotify_olap_queries.mdx)

## Technical Stack

- `Microsoft SQL Server`
- `SQL Server Integration Services (SSIS)`
- `SQL Server Analysis Services (SSAS)`
- `Power BI`
- `MDX`
- `Excel / CSV`

## Repository Structure

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
├── RUN_PROJECT.md
└── README.md
```

## Data Source

Primary input:

- [`data/raw/spotify_2025_9regions_separate_artists.csv`](./data/raw/spotify_2025_9regions_separate_artists.csv)

This dataset contains Spotify ranking information and track-level attributes used to populate the warehouse and support downstream analysis.

## Optional Downstream Analysis

This repository also keeps one analytical workbook for later data mining work:

- `Spotify_Scaled_Features_And_Clusters (version 1).xlsx`

That file is not required to run the core warehouse / OLAP / BI flow, but it is useful as an extension into clustering and classification experiments.

## How To Run

The project is reproducible on a Windows machine with the required Microsoft BI stack installed.

High-level run order:

1. Run the schema script in `sql/schema/`
2. Open and execute the `SSIS` package
3. Build and process the `SSAS` cube
4. Open and refresh the `Power BI` report
5. Run `MDX` queries for validation

Detailed instructions:

- [`RUN_PROJECT.md`](./RUN_PROJECT.md)

## What This Project Demonstrates

This project demonstrates practical work across:

- dimensional modeling
- ETL implementation
- OLAP cube design
- BI reporting
- data-to-dashboard thinking across a full analytical workflow

It connects multiple parts of the analytics lifecycle in one repository:

- source data preparation
- warehouse modeling
- ETL execution
- OLAP exploration
- BI reporting

## Notes

- This is a portfolio / academic implementation, not a production deployment.
- The `SSIS`, `SSAS`, and `Power BI` files depend on a Windows environment and may require local connection updates before execution.
- Temporary lock files such as `.~lock*` are intentionally ignored.

## Author

**Đỗ Hải Đăng**  
Information Systems student, UIT - VNUHCM
