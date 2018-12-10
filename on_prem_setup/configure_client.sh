#!/bin/sh
# Configure Kubernetes client in kubeconfig

CLUSTER=cisco-ai-bootcamp

usage() {
  echo "Usage: $0 --server SERVER --user USERNAME --cert CERTIFICATE --key KEY"
}

server=
username=
certificate=
key=

arg_count=0
while [ "$1" != "" ]; do
  case $1 in
    -s | --server )
      shift
      if [ "$1" != "" ]; then server=$1; arg_count=$(($arg_count + 1)); fi
      ;;
    -u | --user )
      shift
      if [ "$1" != "" ]; then username=$1; arg_count=$(($arg_count + 1)); fi
      ;;
    -c | --cert )
      shift
      if [ "$1" != "" ]; then certificate=$1; arg_count=$(($arg_count + 1)); fi
      ;;
    -k | --key )
      shift
      if [ "$1" != "" ]; then key=$1; arg_count=$(($arg_count + 1)); fi
      ;;
    -h | --help )
      usage
      exit
      ;;
    * )
      usage
      exit 1
  esac
  shift
done
if [ $arg_count -ne 4 ]; then
  usage
  exit 1
fi

namespace=${username}
context=${username}-context

kubectl config set-cluster ${CLUSTER} --server=${server} --insecure-skip-tls-verify=true
kubectl config set-credentials ${username} --client-certificate=${certificate}  --client-key=${key}
kubectl config set-context ${context} --cluster=${CLUSTER} --namespace=${namespace} --user=${username}
kubectl config use-context ${context}
