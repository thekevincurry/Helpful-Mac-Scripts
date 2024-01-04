#Helpful Shell Scripts

This is a collection of shell scripts I have created for accomplishing simple, but time consuming tasks. 

## ZIP File Creator Script (zip_script.sh)

This script is designed to help you create multiple ZIP files from a given folder, each limited to a specific size. It's particularly useful for managing large folders that need to be compressed into smaller, more manageable archived files.

### Prerequisites

Before running this script, ensure you have the following:
- A Unix-like environment (Linux, macOS)
- `zip` utility installed on your system

### Installation

1. Clone this repository or download the script directly.
2. Make sure the script (`zip_creator.sh`) is executable. You can use the following command:
   ```bash
   chmod +x zip_creator.sh

## Photo Timestamp Update Script (photo_time.sh)

This bash script is designed to update the file modification/access times and EXIF data of photos based on the directory names they are contained in. It's particularly useful for organizing and managing photo collections, especially when the photos need to be sorted or processed based on the dates.

### How It Works

The script iterates through all subdirectories in the directory it's run from. It assumes that each subdirectory's name is a date in the format `YYYY-MM-DD`. The script then performs two main functions:

1. **Updates File Timestamps:** Modifies the file modification and access times of all files (not just photos) in each directory to match the date derived from the directory name.
2. **Updates EXIF Data:** Specifically for JPEG files, the script updates the EXIF date to match the directory name.

### Prerequisites

- Bash shell (Unix/Linux/Mac)
- `jhead` tool installed for handling JPEG EXIF data

### Usage

1. Place the script in the parent directory containing your dated folders.
2. Ensure that each folder's name follows the `YYYY-MM-DD` format.
3. Run the script:
   ```bash
   ./phote_time.sh
