#!/bin/bash

echo -e "\033[33mStarting Pigal installation process\033[0m"
echo
echo -e "\033[33mInstalling dependent debian packages\033[0m"
sudo aptitude install git ruby1.9.3 build-essential libxml2-dev libxml2

if ! [ -e /home/pi/pigal/ ]
then
  echo -e "\033[33mCloning pigal repo\033[0m"
  git clone git://github.com/djcp/pigal.git /home/pi/pigal/
fi

echo -e "\033[33mInstalling gems\033[0m"
cd /home/pi/pigal/ && sudo bundle

if ! [[ `crontab -l | grep "bin/pigal start"` ]]
then
  echo -e "\033[33mInstalling cron job\033[0m"
  (crontab -l ; echo "@reboot /home/pi/pigal/bin/pigal start") | crontab -
fi

cat <<WellHelloThere

Assuming you didn't see any frightening errors above, you should be able to
restart your pi and access pigal at:

http://<your ip address>:9292

You can start it manually as well, thusly:

/home/pi/pigal/bin/pigal start & bg

WellHelloThere
