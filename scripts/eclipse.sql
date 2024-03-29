/* *****************************************************************************
// Setup preferences
// ****************************************************************************/
SET NAMES utf8 COLLATE 'utf8_unicode_ci';
SET @@global.time_zone = '+3:00';
SET CHARACTER SET utf8;

/* *****************************************************************************
// Remove database (if it already exists)
// ****************************************************************************/
DROP DATABASE IF EXISTS eclipsedb;

/* *****************************************************************************
// Create new database
// ****************************************************************************/
CREATE DATABASE eclipsedb DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
USE eclipsedb;

/* *****************************************************************************
// Create the table(s)
// ****************************************************************************/
CREATE TABLE user (
    id TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	username VARCHAR(18) NOT NULL,
	uuid VARCHAR(64) NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    password_hash CHAR(64) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	UNIQUE (username),
    PRIMARY KEY (id)
);
