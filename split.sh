#!/bin/bash
# script to split model files larger than 90M

find checkpoints -type f -name "*.model" -size +50M | while read -r model_file; do
    echo "Splitting ${model_file}..."
    # Split into 90M chunks to be safely under 100M limit
    split -b 90m "${model_file}" "${model_file}.part."
    if [ $? -eq 0 ]; then
        echo "Successfully split ${model_file}, removing original..."
        rm "${model_file}"
    else
        echo "Failed to split ${model_file}"
    fi
done

echo "All models split successfully"
