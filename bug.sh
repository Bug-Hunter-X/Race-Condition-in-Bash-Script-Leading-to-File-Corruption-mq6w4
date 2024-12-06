#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes concurrently that modify the same file
(while true; do echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2" >> file1.txt; sleep 1; done) &

# Wait for a few seconds to allow the processes to run
sleep 5

# Stop the processes
kill %1
kill %2

# Print the contents of the file, which may be corrupted
cat file1.txt