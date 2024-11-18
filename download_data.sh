#!/bin/bash

GDRIVE_FOLDER_ID="file_id" # make the zip file public and copy the file_id in the url. example url: https://drive.google.com/file/d/{FILE_ID}/view?usp=share_link
TASK_NUMBER=1 # 1=Door_Opening 2=Door_Closing 3=Drawer_Opening 4=Drawer_Closing
NET_ID="abc123" # enter first name; used to keep track and properly attribute data
ENV_NO=1 # used to name and separate environments. starting with 1, increment by 1 for each new environment.

echo "Downloading data..."
python data-collection/download.py --file $GDRIVE_FOLDER_ID --task_number $TASK_NUMBER --name $NET_ID --root_folder $PWD/imitation-in-homes/data/raw --env_no $ENV_NO
echo "Done!"