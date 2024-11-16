#!/bin/bash

GDRIVE_FOLDER_ID="1VdQ-4U-EDwcwF1rwTv3o0O-Dk_nLZc9a"
TASK_NUMBER=1 # 1=Door_Opening 2=Door_Closing 3=Drawer_Opening 4=Drawer_Closing
NAME="john" # enter first name; used to keep track and properly attribute data
ENV_NO=1 # used to name and separate environments. starting with 1, increment by 1 for each new environment.

echo "Downloading data..."
python data-collection/download.py --file $GDRIVE_FOLDER_ID --task_number $TASK_NUMBER --name $NAME --root_folder $PWD/data/raw --env_no $ENV_NO
echo "Done!"