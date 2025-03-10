## Robot setup
1. Turn on the robot and set charger to 12V supply mode  
   <img src="images/stretch_power_supply.png" alt="Stretch power supply" width="300"/>

2. SSH into robot via local or Tailscale IP
   1. Username: hello-robot
   2. Password: hello2020
4. **Remove phone clamp** (if attached) with an allen key  
5. Run `stretch_robot_home.py` in terminal for joint calibration  
    - **ALWAYS** repeat Step 3 before running this  
6. Ensure wrist is level and parallel to arm (typically not necessary):  
    - <a href="https://forum.hello-robot.com/t/calibrating-zeros-for-the-dex-wrist-roll-pitch-yaw-joints/768">Calibrating wrist joints</a>

7. Attach iPhone mount onto wrist with allen key  
    - Be sure not to make it too tight, as this may cause disturbances internally  
    - Should be tight enough to not wobble  
   <img src="images/stretch_iphone_mount.png" alt="iPhone mount" width="300"/>

8. Attach iPhone onto robot  
    - Slide in the iPhone **all the way** into the wrist-mounted phone holder  
        - The camera should be on the right (towards the center of the wrist)  
    - Connect the USB cable  
   <img src="images/stretch_iphone_usb.png" alt="iPhone USB cable" width="300"/>

9. Go into the `Record3D` app and press the red record button while in USB streaming mode  
    - If not in USB streaming mode, go into settings and toggle it
