#!/bin/bash -eu

bash -c 'df -h | grep -E "root|mnt" | awk "{print \$(NF-1)\"\t\"\$2\"\t\"\$3\"\t\"\$NF\"\t\t\"\$1}" '

