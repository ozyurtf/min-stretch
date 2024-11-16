#!/bin/bash

ROOT_FOLDER=$PWD/data/raw
EXPORT_FOLDER=$PWD/data/extracted
GRIPPER_MODEL_PATH=$PWD/data-collection/gripper_model_new.pth

echo "Unzipping data..."
python data-collection/unzip_data.py --source_folder $ROOT_FOLDER --export_folder $EXPORT_FOLDER
sleep 1
echo "Processing data..."
python data-collection/process_from_r3ds.py --r3d_paths_file "${EXPORT_FOLDER}/r3d_files.txt" --model_path $GRIPPER_MODEL_PATH
sleep 1
echo "Exporting videos..."
python data-collection/export_vids_ffmpeg.py --r3d_paths_file "${EXPORT_FOLDER}/r3d_files.txt" --num_workers 1 --start_index 0 --end_index -1
sleep 1
echo "Done!"