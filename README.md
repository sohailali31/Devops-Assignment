# Real-time Log Monitoring Script

This shell script monitors a specified log file in real time and counts occurrences of specific patterns, such as error messages and HTTP status codes. It outputs a summary report when stopped and saves monitoring results to a temporary file for further inspection.

## Prerequisites
- Linux or Unix-like system.
- Bash shell.
- Permission to read the specified log file. You may need `sudo` or elevated privileges to access system log files.

## Dependencies
- No external dependencies are required. The script uses built-in Linux/Unix commands such as `tail` and `grep`.

## Features
- **Real-time Monitoring**: Uses `tail -f` to continuously monitor a log file and display new entries in real time.
- **Keyword Tracking**: Tracks and counts specific patterns, including error messages and HTTP status codes.
- **Signal Handling**: Graceful exit with Ctrl+C, triggering a summary report.
## Addtional feature
- **Temporary File Output**: Saves the monitoring results to a temporary file for later review.

## Configuration
- **Log File**: Edit the `LOGFILE` variable to specify the log file to monitor. The default is `/var/log/syslog`.
- **Patterns to Track**: You can modify `ERROR_MESSAGE` and `HTTP_STATUS` to define which patterns to count. The default keywords are "error" (case-insensitive) and HTTP status codes in the typical format (e.g., `HTTP/1.1 200`).

## Usage
1. **Make Executable**: Ensure the script is executable. If not, run `chmod +x log-monitor.sh`.
2. **Run the Script**: Execute the script to start monitoring:
   ```bash
   ./log-monitor.sh
3. **Stop the Script**: Press Ctrl+C to stop monitoring and trigger the summary report.
