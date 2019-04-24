#!/usr/bin/env bash

set -x         # prints out whatever it is executing
set -o nounset # does not allow unset variables to be used

ARGS=4        # Number of arguments expected.
E_BADARGS=65  # Exit value if incorrect number of args passed.

test $# -ne $ARGS && \
    echo -e "\033[1mUsage: $0 [username] [num-nodes] [zone] [machine-type]\033[0m" && \
    echo -e "\033[1mexample: $0 amisaha 3 asia-south1-c n1-standard-2\033[0m" && \
    exit $E_BADARGS

sa_name=$1
#num_nodes=3
#zone="asia-south1-c"
#machine_type="n1-standard-2"
num_nodes=$2
zone=$3
machine_type=$4

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

# List the created account and get the email
list=`gcloud iam service-accounts list | grep ${sa_name}`
echo $list
email=`echo $list | awk '{print $2}'`
echo "email: $email"

# Create a cluster
gcloud container clusters create ${sa_name} --zone ${zone} --num-nodes ${num_nodes} --machine-type ${machine_type}
