#!/bin/bash


log_file="/home/single-node/Documents/logs/logfile"
dst_srv="minikube@10.0.2.15"
dst_path="/home/minikube/Documents/scp"

# Set the directory path you want to check
working_dir=/home/single-node/Documents/transferred
cd $working_dir
# Get the current date in YYYY-MM-DD format
current_day=$(date +"%Y-%m-%d")

# Set the number of days before the current day to consider
days_before=1  # Adjust this value as needed

# Calculate the date of the specified days before the current day
target_date=$(date -d "$current_day - $days_before days" +"%Y-%m-%d")

# Find files in the specified directory modified before the target date
files=$(find  *.txt -type f ! -newermt "$current_day" -newermt "$target_date" 2>/dev/null)

scp scp  $files "$dst_svr:$dst_path"



 if [ -n "$files" ]; then
    echo $files
    scp  *.txt "$dst_svr:$dst_path" && \
    echo "Transfer of File complete"
    echo "Successfully copied $file" >> "$log_file"
    echo "Failed to copy $file. Exit code: $?" >> "$log_file"
 else
    echo "No files found modified before $current_day and after $target_date."
 fi


# Log end of the script
echo "Script completed at $(date)" >> "$log_file"
