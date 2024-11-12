#!/bin/bash

# Check if tmux is installed
if command -v tmux &> /dev/null; then
    # Create a new tmux session called "robot"
    tmux new-session -d -s robot

    # Enable mouse mode
    tmux set -g mouse on

    # Split the right pane horizontally
    tmux split-window -h -t robot:1.1

    # Change directory and activate environment in each pane
    tmux send-keys -t robot:1.1 'mamba deactivate && cd robot-server' C-m
    tmux send-keys -t robot:1.2 'mamba activate home_robot && cd imitation-in-homes' C-m

    # Attach to the session
    tmux attach-session -t robot
fi
