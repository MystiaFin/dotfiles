#!/bin/bash
tmux new-session -d -s boot_trigger
sleep 10
tmux kill-session -t boot_trigger
