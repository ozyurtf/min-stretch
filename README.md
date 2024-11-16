<!-- ## Setting up Mamba Environment

1. Download [mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html#mamba-install) with instructions from [here](https://github.com/conda-forge/miniforge?tab=readme-ov-file#unix-like-platforms-mac-os--linux), also shown below
    1. Run the commands below in terminal and follow the instructions
        
        ```bash
        curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
        bash Miniforge3-$(uname)-$(uname -m).sh
        ```
        
    2. Re-open shell and run `mamba activate` if not already in the base environment
2. Create environment
    1. `mamba env create -f conda_env.yaml`


## Data Processing

For extracting a single environment:

Ensure you've created the `home_robot` mamba environment from the first 3 steps of the [Imitation in Homes documentation](https://educated-diascia-662.notion.site/Setting-Up-Running-Zero-Shot-Models-on-Hello-Robot-Stretch-66658ab1a6454f219e0fb1db1baa9d6f?pvs=97#55e4606db0e045ada791177caa599692). 

1.  Compress video taken from the Record3D app:

    ![Export Data](https://github.com/user-attachments/assets/2c22358e-d0ad-4e18-8058-556156235e8a)
2. Get the files on your machine.
   1. **Option 1: Using Google drive:**
      1. \[Only once] Generate Google Service Account API key to download from private folders on Google Drive. There are some instructions on how to do so in this Stackoverflow link [https://stackoverflow.com/a/72076913](https://stackoverflow.com/a/72076913)
      2. \[Only once] Rename the .json file to `client_secret.json` and put it in the same directory as  `gdrive_downloader.py`
      3. Upload `.zip` file into its own folder on Google Drive, and copy folder\_id from URL to put it in the `GDRIVE_FOLDER_ID` in the `./do-all.sh` file.
   2. **Option 2: Manually**:
      *   Comment out the `GDRIVE_FOLDER_ID` line from `./do-all.sh` and create the following hierarchy locally

          ```bash
          dataset/
          |--- task1/
          |------ home1/
          |--------- env1/
          |------------ {data_file}.zip
          |--------- env2/
          |------------ {data_file}.zip
          |--------- env.../
          |------------ {data_file}.zip
          |------ home2/
          |------ home.../
          |--- task2/
          |--- task.../
          ```
      * The .zip files should contain .r3d files exported from the Record3D app in the previous step.
3. Modify required variables in `do-all.sh`.
   1. `TASK_NAME` task name.
   2. `HOME` name or ID of the home.
   3. `ROOT_FOLDER` folder where the data is stored after downloading.
   4. `EXPORT_FOLDER` folder where the dataset is stored after processing. Should be different from `ROOT_FOLDER`.
   5. `ENV_NO` current environment number in the same home and task set.
   6. `GRIPPER_MODEL_PATH` path to the gripper model. It should be in this folder as `gripper_model_new.pth`.
4.  Run

    ```bash
    ./do-all.sh
    ```

## Model Training
1. 

## Robot Deployment


# Setting Up & Running Zero-Shot Models on Hello Robot Stretch

1. Ensure you have red cylindrical gripper tips on your Stretch’s end-effector
2. Clone and enter repository
    1. `git clone https://github.com/haritheja-e/robot-utility-models.git` 
    2. `cd robot-utility-models`

Open 2 terminal windows. On one side follow “Robot Server” instructions and on the other side follow “Imitation in Homes” instructions below. 

## Robot Server

This is run in the Hello Robot’s root pip environment (outside conda/mamba)

1. Enter the `robot-server` folder
    1. `cd robot-server`
2. Install required packages
    1. `pip install -r requirements.txt`
3. Start server
    1. If using the SE3’s default D405 wrist camera:
        1. `python3 start_server.py camera=d405` 
    2. If using an iPhone Pro (Record3D app’s USB Streaming)
        1. Ensure the phone’s angle relative to gripper is 75º using a third-party app (we use “Precise Level” app)
        2. `python3 start_server.py camera=iphone`

## Imitation in Homes

1. Download [mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html#mamba-install) with instructions from [here](https://github.com/conda-forge/miniforge?tab=readme-ov-file#unix-like-platforms-mac-os--linux), also shown below
    1. Run the commands below in terminal and follow the instructions
        
        ```bash
        curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
        bash Miniforge3-$(uname)-$(uname -m).sh
        ```
        
    2. Re-open shell and run `mamba activate` if not already in the base environment
2. Enter the `imitation-in-homes` folder
    1. `cd imitation-in-homes` 
3. Create environment
    1. `mamba env create -f conda_env.yaml`
4. Edit `configs/env_vars/env_vars.yaml`
    1. Set `project_root` variable to your imitation-in-homes directory
5. Load and run the desired policy (VQ-BeT): 
    1. `python run.py task=door_opening`
    2. `python run.py task=drawer_opening` 
    3. `python run.py task=reorientation`
    4. `python run.py task=bag_pick_up` 
    5. `python run.py task=tissue_pick_up`
6. Ensure the device you’re SSH-ing from and the robot are on the same network
7. Open the UI in your local browser at `http://ROBOT_IP:7860` 
8. Follow the instructions in the UI to run the policy. See the video below for a quick example of using the UI: 
    
    [ui_example.mov](Setting%20Up%20&%20Running%20Zero-Shot%20Models%20on%20Hello%20Rob%2066658ab1a6454f219e0fb1db1baa9d6f/ui_example.mov)
    
9. Optionally: run Diffusion Policy by
    1. `python run.py --config-name=run_diffusion task=door_opening`
    2. `python run.py --config-name=run_diffusion task=drawer_opening` 
    3. `python run.py --config-name=run_diffusion task=reorientation`
    4. `python run.py --config-name=run_diffusion task=bag_pick_up` 
    5. `python run.py --config-name=run_diffusion task=tissue_pick_up`
    6. Note: Diffusion Policy will run very slow on the robot’s CPU (upwards of 5 seconds per step). Modify the following to run on a GPU workstation: 
        1. Ensure the robot and GPU workstation are on the same network
        2. In `robot-server/configs/network/network.yaml` on your robot, set
            1. `host_address` to your robot’s IP
            2. `remote_address` to your workstation’s IP
            3. Then run `python3 start_server.py`
        3. We now instead run `run.py` on the workstation. In `imitation-in-homes/configs/run_diffusion.yaml` on your workstation set
            1. `network.host` to your workstation’s IP
            2. `network.remote` to your robot’s IP 
            3. Then run the desired `python run.py` command -->