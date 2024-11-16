import argparse
import gdown
import os

TASK_NAMES = [
    "Door_Opening",  # 1
    "Door_Closing",  # 2
    "Drawer_Opening",  # 3
    "Drawer_Closing",  # 4
]

parser = argparse.ArgumentParser()
parser.add_argument(
    "--file_id",
    type=str,
    required=True,
    help="File ID of the shared Google drive file",
)
parser.add_argument(
    "--task_number",
    type=int,
    required=False,
    help="Task category identifier number",
    default=-1,
)
parser.add_argument(
    "--name",
    type=str,
    required=True,
    help="Home number or name",
)
parser.add_argument(
    "--root_folder",
    type=str,
    required=True,
    help="Folder to export the data to",
)
parser.add_argument(
    "--env_no",
    type=int,
    required=True,
    help="Current env number within this home and task category",
)

args = parser.parse_args()
params = vars(args)

if __name__ == "__main__":
    file_id = params["file_id"]
    task_no = params["task_number"]
    home = params["name"]
    root_folder = params["root_folder"]
    env = "Env" + str(params["env_no"])
    
    url = f'https://drive.google.com/uc?id={file_id}'
    # make root folder
    if not os.path.exists(root_folder):
        os.makedirs(root_folder)
    # make task folder
    if task_no == -1:
        raise ValueError("Enter valid task number.")
    task_folder = os.path.join(root_folder, TASK_NAMES[task_no - 1])
    if not os.path.exists(task_folder):
        os.makedirs(task_folder)
    # make home folder
    home_folder = os.path.join(task_folder, home)
    if not os.path.exists(home_folder):
        os.makedirs(home_folder)
    # make env folder
    env_folder = os.path.join(home_folder, env)
    if not os.path.exists(env_folder):
        os.makedirs(env_folder)
    
    output_path = os.path.join(env_folder, f"{file_id}.zip")
    gdown.download(url, output_path, quiet=False)