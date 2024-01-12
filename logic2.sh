#!/bin/bash

# creating a pooled directory
mkdir /home/single-node/Documents/transferred/pooled

src_srv="singlenode-VirtualBox@10.0.2.5"
src_path="/home/single-node/Documents/transferred/pooled"
log_file="/home/single-node/Documents/logs/logfile"
dst_srv="minikube@10.0.2.15"
dst_path="/home/minikube/Documents/scp"
dst_srv="minikube@10.0.2.15"
dst_path="/home/minikube/Documents/scp"


# Set the directory path you want to check

working_dir=/home/single-node/Documents/transferred
cd $working_dir
# Get the current date in YYYY-MM-DD format
current_day=$(date +"%Y-%m-%d")

# Set the number of days before the current day to consider
days_before=4  # Adjust this value as needed

# Calculate the date of the specified days before the current day
target_date=$(date -d "$current_day - $days_before days" +"%Y-%m-%d")

# Find files in the specified directory modified before the target date
files=`find  "$working_dir" -type f ! -newermt "$current_day" -newermt "$target_date"  -exec mv -t "$src_path" {} + "2>/dev/null` 
cd "$src_path"
scp  -r *.txt  "$dst_svr:$dst_path"

if [ $? -eq 0 ]; then 
    echo $files >>  movedfile
    echo  "Files Have been transferred Successfully" 
else

    echo  "Error files not transferred!!"

fi


# Log end of the script
echo "Script completed at $(date)" >> "$log_file"
