# Welcome to the Cisco ML-BootCamp Pilot

- [Setup](#setup)
- [Learning](#learning)
- [Admin](#admin-lock)

## Setup
The following are the setup steps required.

### Step 0. Prerequisites
The following are the prerequisites:

1. Have completed the __Pre-Boot Camp Learning__ as suggested to you.
2. Have a __Cisco provided Mac laptop__ with all recommended software, especially __VPN__.
You will be primarily working on your laptops
and connecting to a [kubernetes (k8s)](https://kubernetes.io/) cluster runnin on
[Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/).
3. Have a gmail address.

### Step 1. Verify that you can access GKE

1. Each team will be given a service account.
2. Install [gcloud](https://cloud.google.com/sdk/docs/quickstart-macos) on your
   macbooks.
3. Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) on
   your macbooks.
4. Activate service account (```service-acc-name``` and ```json-file-name``` will be
   provided)
```
gcloud auth activate-service-account <service-acc-name> --key-file=<json-file-name> --project=ml-bootcamp-2018

Example (uses team-blr-1):
gcloud auth activate-service-account team-blr-1@ml-bootcamp-2018.iam.gserviceaccount.com --key-file=ml-bootcamp-2018-409e6b4a7257.json --project=ml-bootcamp-2018

```
5. Get kubeconfig for your cluster (```cluster-name``` and ```zone-name``` will
   be provided)
```
gcloud container clusters get-credentials <cluster-name> --zone <zone-name>

Example (uses team-blr-1):
gcloud container clusters get-credentials team-blr-1 --zone asia-south1-c
```
6. Enable admin cluster role binding (```your-user-cluster-admin-binding``` was
   retrieved in the previous step) (only 1 team member should run the below command)
```
kubectl create clusterrolebinding your-user-cluster-admin-binding --clusterrole=cluster-admin --user=<service-acc-name>

Example (uses team-blr-1):
kubectl create clusterrolebinding your-user-cluster-admin-binding --clusterrole=cluster-admin --user=team-blr-1@ml-bootcamp-2018.iam.gserviceaccount.com
```

### Step 2. Make sure the KFLab repo is accessible
Ensure that the [MNIST example in the KFLab
repo](https://github.com/CiscoAI/KFLab/tree/master/tf-mnist) is accessible. Read
through the README.md in that repo so that you understand how the application is
structured.

## Learning

- Kubernetes. A nice overview can be found at
  https://jvns.ca/blog/2017/06/04/learning-about-kubernetes/. Here are
  [the slides from the presentation](./brief_intro_to_k8s.pdf).

- Kubeflow. An overview of Kubeflow can be found at the [official Kubeflow documentation](http://kubeflow.org/).
Here are [the slides from the presentation](./ml_bootcamp_kubeflow.pdf).

## Admin :lock:
This section is for the administrators of the bootcamp only. Information here is
not relevant to others and links from here will usually not be available to
anyone but administrators.

All admin related scripts are kept at https://github.com/CiscoAI/bootcamp-ops.

