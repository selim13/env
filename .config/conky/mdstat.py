#!/usr/bin/env python3

mdstat = open("/proc/mdstat", "r")

title = False
for line in mdstat:
    if line.startswith("md"):
        if not title: print("${color grey}Raid:") 
        title = True

        md = line.split()[0]
        line = mdstat.readline()
        status = line.split()[-1]
        status_color = "${color red}" if "_" in status else "$color"
        print(" ${color grey}", md, ": ", status_color, status, sep="")