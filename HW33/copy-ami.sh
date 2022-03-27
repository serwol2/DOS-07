#!/bin/bash

# $1 - source region
# $2 - target region

nom=$(aws ec2 describe-images --region "$1" --owners self --output json 2>/dev/null | jq '.Images[].Name'| sed -e "s/^.//;s/.$//" | nl | wc -l)

if [ $nom -ne 0 ]
 then
   aws ec2 describe-images --region "$1" --owners self --output json | jq '.Images[].Name'| sed -e "s/^.//;s/.$//" | nl
   echo -n "Choose an AMI number:"
   read -r nami
   nami=$(( nami-1 ))
       
   namiid=$(aws ec2 describe-images --region "$1" --owners self --output json | jq '.Images['$nami'].ImageId'| sed -e "s/^.//;s/.$//")  
   naminame=$(aws ec2 describe-images --region "$1" --owners self --output json | jq '.Images['$nami'].Name'| sed -e "s/^.//;s/.$//")

   aws ec2 copy-image --region "$2" --source-region "$1" --source-image-id "$namiid" --name "$naminame" --description "This is my copied image from ""$1"". "
       
 else
   echo "No AMI in this region or the region is incorrect"
 fi