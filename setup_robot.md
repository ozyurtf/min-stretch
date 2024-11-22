## Robot setup
1. Turn on the robot and set charger to 12V supply mode
![Stretch power supply](images/stretch_power_supply.png)
2. SSH into robot via Tailscale
3. **Remove phone clamp** (if attached) with an allen key
4. Run `stretch_robot_home.py` in terminal for joint calibration
    - **ALWAYS** repeat Step 3 before running this
5. Ensure wrist is level and parallel to arm (typically not necessary):
    - https://forum.hello-robot.com/t/calibrating-zeros-for-the-dex-wrist-roll-pitch-yaw-joints/768 
6. Attach iPhone mount onto wrist with allen key
    - Be sure not to make it too tight, as this may cause disturbances internally
    - Should be tight enough to not wobble
![iPhone mount](images/stretch_iphone_mount.png)
7. Attach iPhone onto robot
    - Slide in the iPhone **all the way** into the wrist-mounted phone holder
        - The camera should be on the right (towards the center of the wrist)
    - Connect the USB cable
![iPhone USB cable](images/stretch_iphone_usb.png)
8. Go into the `Record3D` app and press the red record button while in USB streaming mode
    - If not in USB streaming mode, go into settings and toggle it