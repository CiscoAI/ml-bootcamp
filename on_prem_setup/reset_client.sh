#!/bin/sh
# Restore kubeconfig

CLUSTER=cisco-ai-bootcamp

usage() {
  echo "Usage: $0 --user USERNAME"
}

username=

arg_count=0
while [ "$1" != "" ]; do
  case $1 in
    -u | --user )
      shift
      if [ "$1" != "" ]; then username=$1; arg_count=$(($arg_count + 1)); fi
      ;;
    * )
      usage
      exit 1
  esac
  shift
done
if [ $arg_count -ne 1 ]; then
  usage
  exit 1
fi

context=${username}-context

kubectl config delete-context ${context}
kubectl config unset users.${username}
kubectl config delete-cluster ${CLUSTER}
