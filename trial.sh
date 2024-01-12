#!/bin/bash 

cd /home/single-node/Documents/transferred/

echo $files
dst_srv="minikube@10.0.2.15"
dst_path="/home/minikube/Documents/scp"

src_srv="singlenode-VirtualBox@10.0.2.5"
src_path="$files"


# Use scp to copy files  from src to destination

scp  *.txt "$dst_srv:$dst_path"

if [ $? -eq 0 ];
then
    echo "Files Successfully transferred from $src_srv to $dst_srv \n"
else
    echo "Error: Files not transferred \n"
fi

