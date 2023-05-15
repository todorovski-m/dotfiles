#!/usr/bin/python3
import subprocess
import collections
import os
import socket

if socket.gethostname() == "dell-3567":
    res = []
    returned_output = subprocess.check_output("xrandr")
    for line in returned_output.decode("utf-8").split("\n"):
        if line.startswith("   "):
            res.append(line.split(" ")[3])

    res = [item for item, count in collections.Counter(
        res).items() if count > 1]
    res = "\n".join(res)

    chosen = subprocess.check_output(
        "echo '" + res + "' | rofi -dmenu -p 'Select common resolution'", shell=True)
    chosen = chosen.decode("utf-8").replace("\n", "")
    print(chosen)

    command = f"xrandr --output eDP-1 --primary --mode {chosen} --output HDMI-1 --same-as eDP-1 --mode {chosen}"
    os.system(command)
