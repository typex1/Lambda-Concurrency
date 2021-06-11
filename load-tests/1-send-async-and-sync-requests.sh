#!/bin/bash
#set -x

FUNC=Lambda-Concurrency

# Synchronous invocation, like e.g. API Gateway:
#TYPE="RequestResponse"

# Asynchronous invocation, like e.g. S3 notificatin:
TYPE="Event"

# number of invocations:
COUNT=1

for i in `seq 1 ${COUNT}`
do
    aws lambda invoke --function-name ${FUNC} --payload fileb://event.json \
                      --invocation-type ${TYPE} output.json --region us-east-1 \
                      --output table &
done

echo timestamp: 
date
echo
