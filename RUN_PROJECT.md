# RUN_PROJECT

This guide explains how to run the local `datawarehouse_olap` project from source on a Windows machine.

## Scope

This repository is reproducible with prerequisites, not fully portable out of the box.

You still need to update local connection paths in:

- `SSIS` flat file connection manager
- `SSIS` SQL Server connection manager
- `SSAS` relational data source
- `Power BI` data source settings

That is normal for a Visual Studio + SQL Server + Power BI academic project.

## Required Environment

- Windows
- SQL Server
- SQL Server Management Studio
- Visual Studio with:
  - `SQL Server Integration Services Projects`
  - `Analysis Services Projects`
- SQL Server Analysis Services
- Power BI Desktop
- `MSOLEDBSQL` provider installed

## Files To Keep In The Repository

These files are part of the runnable source:

- `sql/schema/create_spotify_datawarehouse.sql`
- `sql/mdx/spotify_olap_queries.mdx`
- `bi/powerbi/spotify_datawarehouse_report.pbix`
- `data/raw/spotify_2025_9regions_separate_artists.csv`
- `etl/ssis_spotify_doan/`
- `olap/ssas_spotify/`

These files are intentionally ignored or optional:

- `*.zip`
- `*.mdf`
- `OLAP.docx`
- `Excel_Pivot.xlsx`
- `Spotify_Scaled_Features_And_Clusters (version 1).xlsx`

## Important Configuration Notes

Before running the project, update these machine-specific values:

1. `SSIS` currently references the CSV file at:

```text
C:\Users\dohai\Downloads\spotify_2025_9regions_separate_artists.csv
```

You must point it to your local copy of:

```text
data/raw/spotify_2025_9regions_separate_artists.csv
```

2. `SSIS` and `SSAS` currently reference the SQL Server host:

```text
KroosCocy
```

Replace that with your local SQL Server server name if different.

3. The project should use database name:

```text
Spotify_DataWarehouse
```

The SSIS source files in this repository were normalized to use this name consistently.

## Recommended Run Order

1. Create the relational warehouse in SQL Server.
2. Load the CSV into the warehouse with `SSIS`.
3. Build and process the cube with `SSAS`.
4. Open `bi/powerbi/spotify_datawarehouse_report.pbix` and refresh the data source.
5. Run optional `MDX` queries for OLAP validation.

## Step 1: Create The Database Schema

Open `sql/schema/create_spotify_datawarehouse.sql` in SQL Server Management Studio and execute it.

What this script does:

- creates database `Spotify_DataWarehouse`
- creates dimensions and fact table
- creates indexes
- seeds `Dim_Date`
- seeds `Dim_Country`

After running, verify these tables exist:

- `Dim_Date`
- `Dim_Country`
- `Dim_Artist`
- `Dim_Album`
- `Dim_Song`
- `Bridge_Song_Artist`
- `Fact_Daily_Ranking`

## Step 2: Run SSIS To Load Data

Open:

```text
etl/ssis_spotify_doan/SSIS_Spotify_DoAn/SSIS_Spotify_DoAn.sln
```

Inside Visual Studio:

1. Open `Package.dtsx`.
2. Update the `Flat File Connection Manager` so it points to your local `data/raw/spotify_2025_9regions_separate_artists.csv`.
3. Update the SQL Server connection manager so `Data Source` matches your SQL Server instance.
4. Confirm the target database is `Spotify_DataWarehouse`.
5. Execute the package.

Expected result:

- data is loaded into dimension tables
- bridge table is populated
- `Fact_Daily_Ranking` is populated

Recommended validation in SSMS:

```sql
USE Spotify_DataWarehouse;
GO

SELECT COUNT(*) AS fact_rows FROM Fact_Daily_Ranking;
SELECT COUNT(*) AS songs FROM Dim_Song;
SELECT COUNT(*) AS artists FROM Dim_Artist;
SELECT COUNT(*) AS countries FROM Dim_Country;
```

## Step 3: Build And Process SSAS Cube

Open:

```text
olap/ssas_spotify/SSAS_Spotify/SSAS_Spotify.sln
```

Inside Visual Studio:

1. Open the data source `Spotify Data Warehouse.ds`.
2. Update `Data Source` so it points to your SQL Server host.
3. Keep `Initial Catalog=Spotify_DataWarehouse`.
4. Build the solution.
5. Deploy the project.
6. Process the cube.

Main cube source files:

- `Spotify Data Warehouse.cube`
- `Spotify Data Warehouse.dsv`
- `Dim Artist.dim`
- `Dim Country.dim`
- `Dim Date.dim`
- `Dim Song.dim`

## Step 4: Open Power BI And Refresh

Open:

```text
bi/powerbi/spotify_datawarehouse_report.pbix
```

Then:

1. Go to data source settings.
2. Update the SQL Server or Analysis Services connection if needed.
3. Refresh the dataset.
4. Confirm visuals render without missing-field errors.

If you plan to show this project in CV or GitHub, export dashboard screenshots after refresh and place them under `docs/screenshots/`.

## Step 5: Run MDX Validation Queries

Open `sql/mdx/spotify_olap_queries.mdx` in SSMS or an MDX-capable client connected to the cube.

The file includes examples for:

- roll up by region
- yearly fact counts
- drill down by artist and song
- slice by country
- weekend movement analysis
- top artists
- cross-join analysis

## Common Failure Points

### 1. CSV file not found

Cause:

- `SSIS` still points to the original absolute path on the old machine

Fix:

- update `Flat File Connection Manager`

### 2. Cannot connect to SQL Server

Cause:

- local server name is not `KroosCocy`

Fix:

- update the connection manager server name in `SSIS`
- update the relational data source in `SSAS`
- update the data source in `Power BI`

### 3. Database name mismatch

Cause:

- older `SSIS` configuration used `SpotifyDataWarehouse`

Fix:

- use `Spotify_DataWarehouse`

### 4. Cube processing fails

Cause:

- relational tables were not loaded successfully before processing

Fix:

- re-run `SSIS`
- validate row counts in `Fact_Daily_Ranking` and dimensions

## Suggested GitHub Push Set

Push these:

- `README.md`
- `RUN_PROJECT.md`
- `sql/schema/create_spotify_datawarehouse.sql`
- `sql/mdx/spotify_olap_queries.mdx`
- `bi/powerbi/spotify_datawarehouse_report.pbix`
- `data/raw/spotify_2025_9regions_separate_artists.csv`
- `etl/ssis_spotify_doan/`
- `olap/ssas_spotify/`

Do not push:

- `.vs/`
- `bin/`
- `obj/`
- `*.user`
- `*.zip`
- `*.mdf`

## Fast Checklist

1. Run `sql/schema/create_spotify_datawarehouse.sql`.
2. Fix the CSV path in `SSIS`.
3. Fix the SQL Server host in `SSIS`.
4. Run the `SSIS` package.
5. Fix the SQL Server host in `SSAS`.
6. Deploy and process the cube.
7. Open `bi/powerbi/spotify_datawarehouse_report.pbix`.
8. Refresh and capture screenshots.
