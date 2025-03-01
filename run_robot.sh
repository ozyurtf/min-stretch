#!/bin/bash

# Check if tmux is installed
if command -v tmux &> /dev/null; then
    # Create a new tmux session called "robot" and window 1
    tmux new-session -d -s robot -n window1

    # Enable mouse mode
    tmux set -g mouse on

    # Split the first window horizontally
    tmux split-window -h -t robot:0

    # Change directory and activate environment in each pane
    tmux send-keys -t robot:0.0 'mamba deactivate && cd robot-server' C-m
    tmux send-keys -t robot:0.1 'mamba activate home_robot && cd imitation-in-homes' C-m

    # Attach to the session
    tmux attach-session -t robot
fi
