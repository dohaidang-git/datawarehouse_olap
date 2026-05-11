USE master;
GO

IF DB_ID('Spotify_DataWarehouse') IS NULL
    CREATE DATABASE Spotify_DataWarehouse
    COLLATE SQL_Latin1_General_CP1_CI_AS;  
GO

USE Spotify_DataWarehouse;
GO


IF OBJECT_ID('Fact_Daily_Ranking') IS NOT NULL DROP TABLE Fact_Daily_Ranking;
IF OBJECT_ID('Bridge_Song_Artist') IS NOT NULL DROP TABLE Bridge_Song_Artist;
IF OBJECT_ID('Dim_Song') IS NOT NULL DROP TABLE Dim_Song;
IF OBJECT_ID('Dim_Album') IS NOT NULL DROP TABLE Dim_Album;
IF OBJECT_ID('Dim_Artist') IS NOT NULL DROP TABLE Dim_Artist;
IF OBJECT_ID('Dim_Country') IS NOT NULL DROP TABLE Dim_Country;
IF OBJECT_ID('Dim_Date') IS NOT NULL DROP TABLE Dim_Date;
GO


-- Dim_Date (YYYYMMDD làm surrogate key)
CREATE TABLE Dim_Date (
    date_id         INT PRIMARY KEY,                   
    snapshot_date   DATE NOT NULL,
    [year]          INT NOT NULL,
    [month]         INT NOT NULL,
    [day]           INT NOT NULL,
    quarter         INT NOT NULL,
    [weekday]       VARCHAR(20) NOT NULL,
    weekday_name    VARCHAR(10) NOT NULL,
    is_weekend      BIT NOT NULL
);
GO

-- Dim_Country
CREATE TABLE Dim_Country (
    country_id      INT IDENTITY(1,1) PRIMARY KEY,
    country_code    VARCHAR(20) NOT NULL UNIQUE,        
    country_name    NVARCHAR(100) NOT NULL,
    region          NVARCHAR(100) NULL
);
GO

-- Dim_Artist 
CREATE TABLE Dim_Artist (
    artist_id       INT IDENTITY(1,1) PRIMARY KEY,
    artist_name     NVARCHAR(300) NOT NULL        
);
GO

-- Dim_Album
CREATE TABLE Dim_Album (
    album_id            INT IDENTITY(1,1) PRIMARY KEY,
    album_name          NVARCHAR(500) NOT NULL,            
    album_release_date  DATE NULL
);
GO

-- Dim_Song
CREATE TABLE Dim_Song (
    song_id             INT IDENTITY(1,1) PRIMARY KEY,
    spotify_id          NVARCHAR(50) NOT NULL,
    name                NVARCHAR(500) NOT NULL,            
    duration_ms         BIGINT NOT NULL,
    is_explicit         BIT NOT NULL,
    album_id            INT NULL FOREIGN KEY REFERENCES Dim_Album(album_id),
    
    -- Audio features
    danceability        FLOAT NULL,
    energy              FLOAT NULL,
    [key]               INT NULL,
    loudness            FLOAT NULL,
    mode                INT NULL,
    speechiness         FLOAT NULL,
    acousticness        FLOAT NULL,
    instrumentalness    FLOAT NULL,
    liveness            FLOAT NULL,
    valence             FLOAT NULL,
    tempo               FLOAT NULL,
    time_signature      INT NULL
);
GO

-- Bridge_Song_Artist (many-to-many)
CREATE TABLE Bridge_Song_Artist (
    song_id         INT NOT NULL FOREIGN KEY REFERENCES Dim_Song(song_id),
    artist_id       INT NOT NULL FOREIGN KEY REFERENCES Dim_Artist(artist_id),
    artist_order    INT NOT NULL,                      
    PRIMARY KEY (song_id, artist_id, artist_order)
);
GO


CREATE TABLE Fact_Daily_Ranking (
    fact_id             BIGINT IDENTITY(1,1) PRIMARY KEY,
    song_id             INT NOT NULL FOREIGN KEY REFERENCES Dim_Song(song_id),
    date_id             INT NOT NULL FOREIGN KEY REFERENCES Dim_Date(date_id),
    country_id          INT NOT NULL FOREIGN KEY REFERENCES Dim_Country(country_id),
    
    daily_rank          INT NOT NULL,
    daily_movement      INT NOT NULL,
    weekly_movement     INT NOT NULL,
    popularity          INT NOT NULL
);
GO


CREATE INDEX IX_Dim_Song_SpotifyID          ON Dim_Song(spotify_id);
CREATE INDEX IX_Dim_Artist_Name             ON Dim_Artist(artist_name);
CREATE INDEX IX_Dim_Album_Name_Date         ON Dim_Album(album_name, album_release_date);
CREATE INDEX IX_Fact_Date_Country_Song      ON Fact_Daily_Ranking(date_id, country_id, song_id);
CREATE INDEX IX_Fact_Song_Date              ON Fact_Daily_Ranking(song_id, date_id);
GO


WITH DateSeries AS (
    SELECT CAST('2025-01-01' AS DATE) AS snapshot_date
    UNION ALL
    SELECT DATEADD(DAY, 1, snapshot_date)
    FROM DateSeries
    WHERE snapshot_date < '2025-12-31'
)
INSERT INTO Dim_Date (date_id, snapshot_date, [year], [month], [day], quarter, [weekday], weekday_name, is_weekend)
SELECT 
    CONVERT(INT, CONVERT(VARCHAR(8), snapshot_date, 112)) AS date_id,
    snapshot_date,
    YEAR(snapshot_date),
    MONTH(snapshot_date),
    DAY(snapshot_date),
    DATEPART(QUARTER, snapshot_date),
    DATENAME(WEEKDAY, snapshot_date),
    LEFT(DATENAME(WEEKDAY, snapshot_date), 3),
    CASE WHEN DATEPART(WEEKDAY, snapshot_date) IN (1,7) THEN 1 ELSE 0 END
FROM DateSeries
OPTION (MAXRECURSION 365);
GO


INSERT INTO Dim_Country (country_code, country_name, region)
VALUES
    ('Global', 'Global', NULL),
    ('VN', 'Vietnam', 'Asia'),
    ('US', 'United States', 'North America'),
    ('KR', 'South Korea', 'Asia'),
    ('JP', 'Japan', 'Asia'),
    ('IN', 'India', 'Asia'),
    ('FR', 'France', 'Europe'),
    ('DE', 'Germany', 'Europe'),
    ('BR', 'Brazil', 'South America');
GO



Select * from Dim_Date;
Select * from Dim_Country;
select * from Dim_Album;
Select * from Dim_Song;
Select * from Fact_Daily_Ranking;
Select * from Dim_Artist;
Select * from Bridge_Song_Artist;
--select * from Dim_Song where spotify_id='0BUkQGUXgcvf3gdCWYbtnJ';