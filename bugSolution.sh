#!/bin/bash

# This script demonstrates a solution to the race condition bug.

# Create two files
touch file1.txt
touch file1.lock

# Function to acquire a lock on the file
lock_file() {
  while ! flock -n 2 file1.lock; do
    sleep 0.1
  done
}

# Function to release the lock on the file
unlock_file() {
  flock -u 2 file1.lock
}

# Start two processes concurrently that modify the same file, using locks
(while true; do lock_file; echo "Process 1"; unlock_file; echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do lock_file; echo "Process 2"; unlock_file; echo "Process 2" >> file1.txt; sleep 1; done) &

# Wait for a few seconds to allow the processes to run
sleep 5

# Stop the processes
kill %1
kill %2

# Remove the lock file
rm file1.lock

# Print the contents of the file
cat file1.txt