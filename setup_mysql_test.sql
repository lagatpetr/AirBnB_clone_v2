-- Prepare MySQL server for project testing

-- Create a testing database named 'hbnb_test_db' if it doesn't exist
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Create a new user 'hbnb_test' with the password 'hbnb_test_pwd' if it doesn't exist
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grant the SELECT privilege on the 'performance_schema' database to the 'hbnb_test' user
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';

-- Flush privileges to apply the SELECT privilege
FLUSH PRIVILEGES;

-- Grant all privileges on the 'hbnb_test_db' database to the 'hbnb_test' user
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

-- Flush privileges again to apply all privileges
FLUSH PRIVILEGES;

