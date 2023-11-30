#!/bin/bash

# Apache DevLake Installation Script

echo "=== Apache DevLake Installation ==="

# Step 1: Prerequisites
echo "Step 1: Prerequisites"
echo "Make sure you have Docker v19.03.10+ and docker-compose v2.2.3+ installed."
echo "If you have Docker Desktop installed, docker-compose is already included."

# Check if docker-compose.yml and env.example already exist
if [ ! -e docker-compose.yml ] && [ ! -e env.example ]; then
    # Step 2: Launch DevLake
    echo "Step 2. Downloading docker-compose.yml and env.example"
    wget https://example.com/path/to/latest/release/docker-compose.yml
    wget https://example.com/path/to/latest/release/env.example

    echo "Step 3. Renaming env.example to .env..."
    mv env.example .env
else
    echo "Existing docker-compose.yml and env.example found. Skipping download."
fi

echo "Step 4. Generating encryption key..."
encryption_key=$(openssl rand -base64 2000 | tr -dc 'A-Z' | fold -w 128 | head -n 1)

# Method 2: Alternatively, you can set the ENCRYPTION_SECRET environment variable in the .env file
echo "Method 2: Setting in .env file"
echo "ENCRYPTION_SECRET=\"$encryption_key\"" >>.env

# Step 5: Run Docker Compose to launch DevLake
echo "Step 5: Launching DevLake with Docker Compose"
docker-compose up -d

# Step 6: Collect data and view dashboards
echo "Step 6: Collect data and view dashboards"
echo "Visit http://localhost:4000 in your browser to configure DevLake and collect data."

echo "=== Installation Completed ==="
