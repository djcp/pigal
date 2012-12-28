#!/bin/bash

cd /home/pi/code/pigal/
source /home/pi/.rvm/scripts/rvm

rackup -P /home/pi/code/pigal/tmp/pigal.pid config.ru
