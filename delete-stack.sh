#!/bin/bash

# Cleanup
STACK_NAME="sam-Lambda-Concurrency"

# Delete the stack
aws cloudformation delete-stack --stack-name ${STACK_NAME}

# Confirm the stack has been deleted
aws cloudformation list-stacks --query "StackSummaries[?contains(StackName,'${STACK_NAME}')].StackStatus"
