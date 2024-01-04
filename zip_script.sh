#!/bin/bash

# Configuration
FOLDER_PATH="/Users/kevincurry/Downloads/FOLDER"  # Replace with your folder path
MAX_SIZE=$((1000 * 1024 * 1024))     # 250 MB in bytes
ZIP_FILE_PREFIX="archive"           # Prefix for ZIP file names
COUNTER=1
CURRENT_ZIP=""

# Function to start a new zip file
start_new_zip() {
    CURRENT_ZIP="${ZIP_FILE_PREFIX}_${COUNTER}.zip"
    echo "Creating new ZIP file: $CURRENT_ZIP"
    zip -r "$CURRENT_ZIP" "$FOLDER_PATH" -i "$1" # Add the first file
    let COUNTER=COUNTER+1
}

# Navigate to the folder's parent directory
cd "$(dirname "$FOLDER_PATH")" || exit

# Find all files and loop through them
find "$FOLDER_PATH" -type f | while read -r file; do
    if [[ -z "$CURRENT_ZIP" ]]; then
        start_new_zip "$file"
    else
        zip -r "$CURRENT_ZIP" "$file" # Add file to current ZIP
        # Check size of current ZIP
        CURRENT_SIZE=$(stat -f"%z" "$CURRENT_ZIP")
        if [ $CURRENT_SIZE -ge $MAX_SIZE ]; then
            echo "Maximum size reached for $CURRENT_ZIP"
            start_new_zip "$file"
        fi
    fi
done

echo "ZIP file creation complete."
