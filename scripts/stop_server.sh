#!/bin/bash
# this file runs first, so during an initail installation error might happen

# simply stop the application process using pm2
echo stopping server
sudo su
if pm2 list | grep -q "react--build"; then
    echo "Process 'react--build' is stopping. For new app"
    pm2 stop react--build
exit
