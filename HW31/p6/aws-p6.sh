#!/bin/bash

mypolicy="$HOME/DOS-07/HW31/p6/bucket_policy.json"
mynamebucket="my1serwol-b"

echo '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'$mynamebucket'/*"
        }
    ]
}' > "$mypolicy"

aws s3api create-bucket --bucket $mynamebucket  --create-bucket-configuration LocationConstraint=eu-central-1 --region eu-central-1 \
  && aws s3api put-bucket-policy --bucket $mynamebucket --policy file://$mypolicy \
  && aws s3 sync /home/tomas/folder-where-you-keep-your-projects/happy-bunny s3://happy-bunny/  --profile equivalent \
  && aws s3 website s3://happy-bunny/ --index-document index.html --error-document error.html --profile equivalent