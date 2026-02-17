# Spotify Relational SQL Analysis

## Overview
This project demonstrates relational database design and analytical SQL queries using a Spotify-like schema.

## Database Structure
01_schema.sql        - Database schema and constraints
02_demo_data.sql     - Sample professional dataset
03_analysis_queries.sql - Analytical SQL queries

## Concepts Used
- Primary & Foreign Keys
- Joins
- Aggregations
- Window Functions
- CASE-based segmentation

## Tools
PostgreSQL, pgAdmin

## Key Insights from Analysis

- Majority of tracks fall into the Medium duration category (~210 seconds).
- Playlist engagement shows higher inclusion of Bollywood and Pop genres.
- Window functions used to rank tracks by duration per artist.
- CASE-based segmentation applied to classify song lengths.
