#!/bin/bash
# script to restore split model files

# Find all files matching *.model.part.aa and restore them
find checkpoints -type f -name "*.model.part.aa" | while read -r first_part; do
    # the original model file name is without the .part.aa
    original_model="${first_part%.part.aa}"
    
    echo "Restoring ${original_model}..."
    cat "${original_model}.part."* > "${original_model}"
    
    if [ $? -eq 0 ]; then
        echo "Successfully restored ${original_model}"
    else
        echo "Failed to restore ${original_model}"
    fi
done

echo "All models restored"
