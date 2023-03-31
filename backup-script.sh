#!/bin/bash


#current_date:
date=$(date '+%Y-%m-%d-%H-%M-%S')

#perform backup here:
backup(){
    local json_file="$1"
    local cluster_name=$(basename "$json_file" .json )
    local backfile="${cluster_name}_configuration_backup"

    #check if the json file is present or not:
    if ! [-f "$json_file" ]; then
        echo "json file not found"
        return 1
    fi

    #Load the data from json file: 
    local nodes=$(jq '.' "$json_file")
    local server_ip=$(echo "$nodes" | jq -c '.')
}