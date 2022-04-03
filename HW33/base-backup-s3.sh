#!/bin/bash


aws rds start-export-task \
    --export-task-identifier hw33-export-snapshot1 \
    --source-arn arn:aws:rds:us-east-1a:273043149442:snapshot:snapshot1 \
    --s3-bucket-name hw33-bucket-for-db-backup \
    --iam-role-arn arn:aws:iam::273043149442:role/hw33-rds-s3-export-role \
    --kms-key-id arn:aws:kms:us-east-1a:123456789012:key/6d68e14e-ba10-4afd-a153-b3850e6e0b1c

