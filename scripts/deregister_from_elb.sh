#!/bin/bash

# AWS Variables
export AWS_DEFAULT_REGION="us-east-2"
export AUTOSCALING_GROUP_NAME="Infra-LinuxWebASG-1H1XIZ0RK6WKJ"
export LBN="LinuxWebELB"  # Load Balancer Name
instanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

# AWS functions
aws autoscaling update-auto-scaling-group --auto-scaling-group-name $AUTOSCALING_GROUP_NAME --health-check-type EC2

aws elb deregister-instances-from-load-balancer --load-balancer-name $LBN --instances instanceID

sleep 60
