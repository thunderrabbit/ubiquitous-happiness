#!/bin/bash

AWS_CREDENTIALS_FILE=aws_keys

if [ ! -f $AWS_CREDENTIALS_FILE ];
then
   echo "File $AWS_CREDENTIALS_FILE does not exist."
   echo "This file must contain keys to connect to AWS."
   echo "Create new keys here: https://console.aws.amazon.com/iam/home#/users"
   echo "The user associated with these keys should have (at least) the following policies"
   echo
   echo "* AmazonEC2FullAccess"
   echo "* AmazonRDSReadOnlyAccess"
   echo "* AmazonElastiCacheReadOnlyAccess"
   echo
   echo "You can read more about Access Keys at"
   echo "http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html"
   echo
   read -p "Enter the Access key ID: " ACCESS_ID
   read -p "Enter the Secret access key: " SECRET_ID
   echo "export AWS_ACCESS_KEY_ID='$ACCESS_ID'" >> $AWS_CREDENTIALS_FILE
   echo "export AWS_SECRET_ACCESS_KEY='$SECRET_ID'" >> $AWS_CREDENTIALS_FILE
   source $AWS_CREDENTIALS_FILE
   echo "Keys have been saved and loaded into Environment vars so we can connect to AWS."
   echo "Testing connection with ~/ansible/ec2.py --refresh-cache"
   ~/ansible/ec2.py --refresh-cache
fi
