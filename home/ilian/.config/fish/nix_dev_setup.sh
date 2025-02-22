#!/usr/bin/env bash

# Use fzf to interactively select a file
selected_file=$(fd . '/home/ilian/dotfiles/default_dev_flakes' | fzf)

if [ -z "$selected_file" ]; then
    echo "No file selected. Exiting."
    exit 1
fi

base_name=$(basename "$selected_file")

echo $base_name
# Check if the filename contains "_"
if [[ $base_name == *_* ]]; then
    # Split the filename into parts using "_"
    IFS='_' read -r notcopy copy <<< "$base_name"

    # Construct the new filename with the specified prefix
    # new_file_name="${copy}.nix"

    # Copy the selected file to the current directory with the new filename
    cp "$selected_file" "./$copy"

    echo "Copied $selected_file to $copy"
else
    echo "Selected file does not contain the expected separator. Exiting."
    exit 1
fi

echo "Script execution completed."
