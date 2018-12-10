# User Scripts

## Configure K8s Client

Please [install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl) before running the script.

This script will add cluster, user, and context to the default kubeconfig file, and will set current context to the newly created one.

```
configure_client.sh --server SERVER --user USERNAME --cert CERTIFICATE --key KEY
```

where `SERVER` is the server endpoint, e.g. `https://127.0.0.1:6443` (replace IP with actual value), `USERNAME` is the user name, `CERTIFICATE` is the user's certificate file, `KEY` is the user's private key file.

## Reset

This script will remove context, user, and cluster from the default kubeconfig file. You will need to manually set current context afterwards if your current context is the one being deleted.

```
reset_client.sh --user USERNAME
```

## Switch context for different environments

If you have setup kubectl configs for different k8s clusters (e.g. 1 cluster in gcloud and 1 cluster on-prem), you can use "context" to easily switch the cluster to interact with.

List available contexts:

```
kubectl config get-contexts
```

Switch to a specific context:

```
kubectl config use-context CONTEXT_NAME
```
