#!/bin/bash
#set -x

# template source: https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sqs/send-message.html

FUNC="Lambda-Concurrency"
QUEUE_NAME="LambdaInputQueue"
QUEUE_URL=$(aws sqs get-queue-url --queue-name ${QUEUE_NAME} --output json | awk -F"\"" '{print $4}')

# uncomment this in case you want to see the queue settings:
#aws sqs get-queue-attributes --queue-url ${QUEUE_URL} --region us-east-1 --attribute-names All

# number of messages sent to the queue:
COUNT=100

for i in `seq 1 ${COUNT}`
do
	aws sqs send-message --queue-url ${QUEUE_URL} --message-body "Test message $RANDOM" \
                             --region us-east-1 \
                             --output table  &
done

echo timestamp:
date
echo

