#!/bin/sh

# Simply crawls the webpage. Good for making a static version of WordPress website.

wget -P ./output -mpck --user-agent="" -e robots=off --wait 1 -E https://yourdomain.com/
