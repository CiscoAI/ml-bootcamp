# Welcome to the Cisco ML-BootCamp Pilot

## Setup
The following is the schematic of the overall setup.

### Step 0. Prerequisites
Have a Cisco provided Mac laptop. You will be primarily working on your laptops
and connecting to a [kubernetes (k8s)](https://kubernetes.io/) cluster. In
general, bootcamp participants will not need to access the k8s cluster directly.

### Step 1. Verify server is reachable
Make sure you can ping the k8s servers with the following IPs:

- __SERVER1__: 172.22.136.11 (usually running as k8s slave)
    - 48x CPU cores, 512 GB memory, 2x GTX1080 and 2x [V100](https://www.nvidia.com/en-us/data-center/tesla-v100/) GPUs
- __SERVER2__: 172.22.136.13 (usually running as k8s master)
    - 48x CPU cores, 460 GB memory, 4x [GTX1080](https://www.nvidia.com/en-in/geforce/products/10series/geforce-gtx-1080/) GPUs

You can also try to SSH but you are not expected to have any valid accounts on
these machines.

### Step 2. Verify your kubernetes account
[TBD] Each team will have __ONE__ account.
Your account configurations will be provided to you separately.
Each team should expect the following credentials related to their account.
Using these credentials, verify that the accounts are accessible by running the
following commands
```
kubectl foo bar blah...
```

## Admin
This section is for the administrators of the bootcamp only. Information here is
not relevant to others and links from here will usually not be available to
anyone but administrators.

All admin related scripts are kept at https://github.com/CiscoAI/bootcamp-ops.

