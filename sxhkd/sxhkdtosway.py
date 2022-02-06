#!/usr/bin/env python3

import sys

def change_key_names(s: str) -> str:
    return s.replace("super", "$mod").replace("alt", "$alt").replace("ctrl", "Ctrl")

data = sys.stdin.read().split("\n")

settings = []
for line in data:
    line = line.strip()
    if line == "":
        continue
    if line.startswith("#"):
        continue
    settings.append(line)

if len(settings) % 2 == 1:
    raise Exception("settings odd")

for i in range(int(len(settings) / 2)):
    sys.stdout.write(f"bindsym {change_key_names(''.join(settings[i*2].split()))} exec {settings[i*2+1]}\n")

