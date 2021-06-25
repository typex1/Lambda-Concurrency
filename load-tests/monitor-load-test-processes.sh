#!/bin/bash

while true
do
	echo -n "number of AWS CLI processes running: "
	ps -ef | grep "aws lambda" | grep -v grep | wc -l
	sleep 1
done
