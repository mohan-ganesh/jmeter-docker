#!/usr/bin/env bash
echo ""
echo "Running entry.sh script."
cd code/
pwd
#ls
echo ""
SCRIPTNAME="$1"
URL="$2"
echo "Starting JMeter tests on ${SCRIPTNAME} with ${URL}"

#Command
pwd
#echo "running ls command for my own sanity"
#ls
##Remember Jmeter runs in the same directory as the script is so, changing the directory to the bin directory
cd ../bin

##Few declarations for logs and results
echo "running ls command"
pwd
currentDay=$(date +'%m-%d-%Y')
#epoch time
currentEpoch=$(date +%s)
echo "*** current time is ${day} ${currentDate}"

#-n — tells JMeter to run in non-GUI mode.
#-t — specifies the path to source .jmx script to run.
#-JURL=www.abcdef.com 

sh  jmeter -n -t /opt/apache-jmeter-5.4.3/code/${SCRIPTNAME} -JURL=${URL} -l /opt/apache-jmeter-5.4.3/code/test_output_${currentDay}_${currentEpoch}.csv

echo "********entry.sh process completed succesfully*******"