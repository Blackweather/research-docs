# Kubecon 2020 Day 0 (17.08)

## From Minikube to Production
- KubeProxy by default uses iptables which can degrade network performance as the cluster grows
    - switching to IPVS helps
    - IPVS is based on hash tables (shorter time to evaluate rules)
- networking is complicated

### Storage
- from the beginning kubernetes was meant for stateless workloads
- many things to consider
- most CSI (container storage interfaces) assume perfect sync between Kubernetes and storage backend

### etcd
- by default is installed in a single instance

### Kubernetes security best practices
- disable anonymous auth
- close all the access you don't need
- use RBAC
- use security policies
- keep up to date

## Container security fundamentals
### Workload security - containers
- assume that you will be owned
- use a distroless base image
- make sure containers are easy to rebuild and redeploy
- trust containers with signatures
    - for example images pushed from CI/CD can be signed and a force pushed image won't be
    - kubernetes only admits images with proper signatures

### Workload security - pods
- don't use hostPath (it mounts host filesystem)
- don't use hostNetwork (shares the same port range)
- be conscious of the pod's service account
    - every pod is bound to a service account (default if none specified)
    - bind a different service account
    - or put the pod in a different namespace
    - or set `automountServiceAccountToken` to false

### Cluster security
- keep cluster up to date
- isolate your cluster from the internet
    - ideally in a private network
    - devs/bots access through VPN
    - users access through load balancer/reverse proxy
- use Secrets

### User security
- use RBAC and groups
- use a policy agent
    - typically AdmissionController
    - can enforce best practices
    - can audit existing resources

## Understanding Kubernetes Networking
#TODO: watch this

## Service mesh presentation
#TODO: watch this