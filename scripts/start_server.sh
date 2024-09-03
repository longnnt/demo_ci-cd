#!/bin/bash
echo starting server

# here we just use npm to run the build
cd /var/www/
# echo building application...
# sudo npm run build

# start the application with pm2
echo starting application...
# sudo pm2 serve build/ --name 'react--build' --spa -f

# Check if the process 'react--build' is running
if pm2 list | grep -q "react--build"; then
    echo "Process 'react--build' is running. Reloading..."
    sudo pm2 reload react--build
else
    sudo pm2 serve build/ --name 'react--build' --spa -f
fi
