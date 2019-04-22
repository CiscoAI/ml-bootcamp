#!/usr/bin/env bash

set -x         # prints out whatever it is executing
set -o nounset # does not allow unset variables to be used

ARGS=1        # Number of arguments expected.
E_BADARGS=65  # Exit value if incorrect number of args passed.

test $# -ne $ARGS && echo -e "\033[1mUsage: $0 [username]\033[0m" && exit $E_BADARGS

sa_name=$1
role="Bootcamp User"

# Get the location of the script no matter where you ran it from
SCRIPT_PATH=$(cd `dirname ${0}`; pwd)

# activate appropriate configuration.
# Configuration should look like this:
#
# gcloud config list
# [compute]
# region = asia-southeast1
# zone = asia-southeast1-a
# [core]
# account = amsaha@gmail.com
# disable_usage_reporting = True
# project = ml-bootcamp-2018
#
#Your active configuration is: [ml-bootcamp]

gcloud config configurations activate ml-bootcamp

# Create service account
gcloud iam service-accounts create ${sa_name} --display-name "${sa_name}"

# List the created account and get the email
list=`gcloud iam service-accounts list | grep ${sa_name}`
echo $list
email=`echo $list | awk '{print $2}'`
echo "email: $email"

#XXX TODO: Attach service account to role

# Create keys for the service account
mkdir -p ~/bootcamp-keys/
gcloud iam service-accounts keys create ~/bootcamp-keys/${sa_name}-key.json --iam-account ${email}
