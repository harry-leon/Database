-- Create database and schema for the library system
DROP DATABASE IF EXISTS library_management;
CREATE DATABASE library_management;
\connect library_management
CREATE SCHEMA IF NOT EXISTS library;
SET search_path = library, public;
