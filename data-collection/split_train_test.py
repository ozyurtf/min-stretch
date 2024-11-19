import os
import random
import shutil
import json
import argparse

def move_validation_data(data_root):
    """
    Moves a random 10% of the data from the specified root directory to a validation directory.
    """
    # Define the path to the JSON file containing folder paths
    json_file_path = os.path.join(data_root, 'r3d_files.txt')

    # Load the list of folder paths from the JSON file
    with open(json_file_path, 'r') as file:
        file_paths = json.load(file)

    # Remove ".zip" from the folder paths
    folder_paths = [path.replace('.zip', '') for path in file_paths]

    # Select 10% of the folders, with a minimum of 1
    num_folders_to_select = max(1, len(folder_paths) // 10)
    selected_folders = random.sample(folder_paths, num_folders_to_select)

    # Create the validation directory
    val_dir = os.path.join(os.path.dirname(data_root), f'{os.path.basename(data_root)}_val')
    os.makedirs(val_dir, exist_ok=True)

    # Move the selected folders
    for folder_path in selected_folders:
        # Get the relative path of the folder from the data root
        relative_path = os.path.relpath(folder_path, data_root)

        # Construct the destination path
        dest_path = os.path.join(val_dir, relative_path)

        # Ensure the destination directory exists
        os.makedirs(os.path.dirname(dest_path), exist_ok=True)

        # Move the folder
        shutil.move(folder_path, dest_path)

        # Print the action for confirmation
        print(f"Moved: {folder_path} -> {dest_path}")

if __name__ == '__main__':
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description="Move 10% of data to a validation directory.")
    parser.add_argument('data_root', type=str, help="Path to the root data directory containing the 'r3d_files.txt' file.")
    args = parser.parse_args()

    # Run the function with the provided data root
    move_validation_data(args.data_root)
