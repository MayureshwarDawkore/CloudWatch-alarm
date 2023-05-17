#!/bin/bash

# Specify the necessary parameters
INSTANCE_ID="i-0bdcdcbc33e1daa16"
ALARM_NAME="HighCpuAlarm"
METRIC_NAME="CPUUtilization"
NAMESPACE="AWS/EC2"
THRESHOLD=80
PERIOD=60
EVALUATION_PERIODS=5

# Create the CloudWatch alarm
aws cloudwatch put-metric-alarm \
    --alarm-name $ALARM_NAME \
    --alarm-description "Triggered when CPU usage exceeds $THRESHOLD% for five consecutive minutes" \
    --namespace $NAMESPACE \
    --metric-name $METRIC_NAME \
    --dimensions "Name=InstanceId,Value=$INSTANCE_ID" \
    --statistic Average \
    --period $PERIOD \
    --threshold $THRESHOLD \
    --comparison-operator GreaterThanThreshold \
    --evaluation-periods $EVALUATION_PERIODS \
    --alarm-actions "arn:aws:sns:us-east-1:176435306924:HighCpuAlarm"