# Kubernetes essentials Linux Academy Course

## Kubernetes Architecture and Components

### Control plane - necessary to control the cluster
- **etcd** - provides distributed, synchronized data storage for the cluster state (what objects are in cluster), ensures synchronization across the nodes
- **kube-apiserver** - serves the Kubernetes API, the primary interface for the cluster - simple Web-based REST API (used by `kubectl`)
- **kube-controller-manager** - bundles several components into one package, does "behind the scenes" work of controlling the cluster
- **kube-scheduler** - determines when to run pods and on which nodes to run them

### Other components - part of each individual node
- **kubelet** - agent that executes containers on each node, communicates directly with docker runtime, runs as a service on each node
- **kube-proxy** - each node needs its own pod with kube-proxy, handles network communication between different nodes by adding firewall routing rules

## Kubernetes deployments
- automate the management of a group of pods
- let's you specify the desired state
- **scaling**: posibility to specify the number of replicas you want for particular application
    - you can also specify to have the pods across different nodes for high availability
- **rolling updates** - with the deployment of new version, the old version will be gradually replaced by new pods
- **self-healing** - if a pod is destroyed, the deployment will create a new one to replace it

## Kubernetes services
- allow dynamic access to a group of replica pods
- provide load balanced usage of access to a set of replica pods
- creates an abstraction layer on top of a set of replica pods