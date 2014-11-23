#!/bin/sh

user=diaspora

echo "Allow $user user to create databases..."
sudo -u postgres psql -c "ALTER USER $user CREATEDB;" || {
  exit 1 
  }
echo "Grant all privileges to $user user..."
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE template1 to $user;" || {
  exit 1
  }


