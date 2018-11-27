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
and connecting to a [kubernetes (k8s)](https://kubernetes.io/) cluster. In
general, bootcamp participants will not need to access the k8s cluster directly.

### Step 1. Verify server is reachable
Make sure you can ping the k8s servers with the following IPs:

- __SERVER1__: ```172.22.136.11``` (usually running as k8s slave)
    - 48x CPU cores, 512 GB memory, 2x GTX1080 and 2x [V100](https://www.nvidia.com/en-us/data-center/tesla-v100/) GPUs
- __SERVER2__: ```172.22.136.13``` (usually running as k8s master)
    - 48x CPU cores, 460 GB memory, 4x [GTX1080](https://www.nvidia.com/en-in/geforce/products/10series/geforce-gtx-1080/) GPUs

You can also try to ```ssh``` but you are not expected to have any valid accounts on
these machines. As already mentioned, __you are not expected to access these
servers directly__.

### Step 2. Verify your kubernetes account
[XXX] Each team will have __ONE__ account.
Your account configurations will be provided to you separately.
Each team should expect the following credentials related to their account.
Using these credentials, verify that the accounts are accessible by running the
following commands:
```
[XXX]
kubectl foo bar blah...
```

### Step 3. Make sure the KFLab repo is accessible
Ensure that the [MNIST example in the KFLab
repo](https://github.com/CiscoAI/KFLab/tree/master/tf-mnist) is accessible. Read
through the README.md in that repo so that you understand how the application is
structured.

__NOTE__: The example code is for running on GKE. Should not matter much since
all you need is a k8s cluster but it is important to note that the bootcamp will
be running on an in-house k8s cluster.

## Learning

### Kubernetes

### Kubeflow
An overview of Kubeflow can be found at the [official Kubeflow documentation](http://kubeflow.org/).
Here are [the slides from the presentation](./ml-bootcamp-kubeflow.pdf).

## Admin :lock:
This section is for the administrators of the bootcamp only. Information here is
not relevant to others and links from here will usually not be available to
anyone but administrators.

All admin related scripts are kept at https://github.com/CiscoAI/bootcamp-ops.

