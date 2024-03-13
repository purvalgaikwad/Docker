#!/bin/bash

# Set MySQL root password
MYSQL_ROOT_PASSWORD=my-secret-pw

# Create Dockerfile
cat > Dockerfile << EOF
FROM mysql:latest

# Set root password
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# Create database and table
COPY init.sql /docker-entrypoint-initdb.d/
EOF

# Create SQL file
cat > init.sql << EOF
CREATE DATABASE insta;

USE insta;

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
EOF

# Build Docker image
docker build -t mysql-with-db-and-table .

# Run Docker container
docker run -d -p 3306:3306 --name mysql-with-db-and-table mysql-with-db-and-table
