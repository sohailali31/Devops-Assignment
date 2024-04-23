

# Define the log file to monitor
LOGFILE="/var/log/syslog"

# Keywords to monitor
ERROR_MESSAGE="error"
HTTP_STATUS="HTTP/[1-9]\.[0-9] [0-9]{3}"

# Variables to track the counts of specific patterns
error_count=0
http_status_count=0

# Signal handling for Ctrl+C to exit the monitoring loop
trap "echo 'Exiting...'; exit 0" SIGINT

# Monitoring the log file in real time
echo "Monitoring log file: $LOGFILE"

tail -f "$LOGFILE" | while read line; do
    # Display new log entries in real time
    echo "$line"

    # Increment the error count if the message is found
    if echo "$line" | grep -i -q "$ERROR_MESSAGE"; then
        ((error_count++))
    fi

    # Increment the HTTP status code count if the pattern is found
    if echo "$line" | grep -qE "$HTTP_STATUS"; then
        ((http_status_count++))
    fi
done

# This block will never be reached unless the script is terminated via Ctrl+C
# Output the summary report after stopping the monitoring
echo "Summary Report"
echo "=================================================="
echo "Total 'error' occurrences: $error_count"
echo "=================================================="
echo "Total HTTP status occurrences: $http_status_count"


#ADDITIONAL FEATURES

# Create a temporary file to store results
TMP_FILE=$(mktemp /tmp/monitor_log_file)

# Function to process each log line and update counts to temporary file
process_log_line() {
    local line="$1"
    # Write to the temporary file
    echo "$line" >> "$TMP_FILE"
}

# Write the summary to the temporary file
echo -e "\nSummary Report" >> "$TMP_FILE"
echo "===============" >> "$TMP_FILE"
echo "Total 'error' occurrences: $error_count" >> "$TMP_FILE"
echo "Total HTTP status occurrences: $http_status_count" >> "$TMP_FILE"

echo "Monitoring results saved to: $TMP_FILE"
