# Race Condition Bug in Bash

This repository demonstrates a race condition bug in a bash script.  Two processes write concurrently to the same file, resulting in data corruption. The solution shows how to use locking mechanisms to prevent this issue.  The `bug.sh` file contains the buggy script while `bugSolution.sh` offers a corrected version. 

## Bug Description

The script `bug.sh` demonstrates a simple race condition. Two background processes write to `file1.txt` concurrently, which might result in interleaved output and file corruption. This is a classic example of how concurrent access without synchronization can lead to unexpected behavior.

## Solution

The `bugSolution.sh` script presents a solution to the race condition. While a more robust solution might involve dedicated locking mechanisms (e.g., flock), the solution presented here demonstrates a simple, if limited, approach. The approach here shows a simplified locking mechanism that prevents simultaneous file access using a lock file. It's not suitable for high-concurrency scenarios, but it demonstrates the fundamental concept.