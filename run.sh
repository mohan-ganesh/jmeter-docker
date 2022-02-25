#This file builds and image and runs it
#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
echo "Current working directory is ${ROOT_DIR}"

##Expected inputs
SCRIPTNAME="$1"
URL="$2"

##validate inputs
if [ -z "$SCRIPTNAME" ] || [ -z "$URL" ]; then
    echo "Usage: $0 <scriptName>  <url>"
    echo "Example: sample.jmx www.google.com"
    exit 1
fi

##Build image
echo "Building JMeter Docker Image"
docker build -t jmeter/5.4.3 .


echo "Running a JMeter Docker Image by mounting local working directory"
docker run -v "${ROOT_DIR}:/opt/apache-jmeter-5.4.3/code" -i -t jmeter/5.4.3:latest $SCRIPTNAME $URL

echo "Process complete"