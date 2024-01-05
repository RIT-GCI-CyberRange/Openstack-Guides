#!/bin/bash

#Alex Nasca
#1/3/2024

# get a list of names for all instances in the project:
IFS=$'\n' instances=($(openstack server list -f value -c Name))

# get a list of IDs for all instances in the list
IDs=($(openstack server list -f value -c ID))



# Check if the lengths of instances and IDs arrays match
if [ "${#instances[@]}" -ne "${#IDs[@]}" ]; then
    echo "Error: Mismatch in the number of instances and IDs."
    exit 1
fi

# Use a for loop to iterate over the instance names and IDs
counter=0
for instance_name in "${instances[@]}"; do
    # Extract ID using the counter
    id="${IDs[$counter]}"
    # Skip Control-Node This is my deployment box so I don't want to delete it
    if [ "$instance_name" == "openstack toolbox" ]; then # MAKE SURE THE NAME MATCHES YOUR CONTROL-NODE NAME
        echo "passing Control Node"
        continue
    fi

    # Delete the instance
    echo "deleting instance: $instance_name"

    # comment out the line below for testing
    openstack server delete $id

    # Delete the volume associated with the box deleted above (won't delete automatically)
    volume_id=$(openstack server show $id -f json -c volumes_attached | grep -oP '"id": "\K[^"]+' | head -1) #get and parse volume ID
    if [ -n "$volume_id" ]; then #if ID length is greater than 0 (not empty)
        echo "deleting volume connected to: $instance_name - $volume_id"
        # comment out the line below for testing
        openstack volume delete $volume_id
    fi

    counter=$((counter + 1))
done