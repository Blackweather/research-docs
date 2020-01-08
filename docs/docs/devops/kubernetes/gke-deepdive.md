# Google Kubernetes Engine Deep Dive - Linux Academy

## Kubernetes nodes
- default is 1 CPU, 4 GB RAM
    - GKE takes 0.1 of first CPU and about 25% of RAM to run stuff
        - docker runtime
        - `kubelet` - communicates with master node and starts Docker containers
        - special containers for intra-cluster communication and logging
- image options:
    - container-optimized OS (recommended)
    - Ubuntu
- `node pools` supported
    - subset of nodes in same cluster
    - share configuration
    - grouped together
    - new node pools run the latest version of Kubernetes

## Kubernetes Engine Costs
- primary charge based on number of nodes
- pricing based on Compute Engine VM instances
    - billed until deleted
    - billed per-second (1 minute minimum)
    - only worker nodes charged (master is free)
- limits
    - per project
    - maximum: 50 clusters per zone, 5000 nodes per cluster
    - maximum: 100 pods per node, 300000 containers overall

## Upgrading Kubernetes Nodes
- Kubernetes Engine allows automatic and manual upgrading
- upgrading/downgrading process
    - master node stops scheduling
    - pods are drained and deleted one at a time
    - deleted pods are recreated with new version
- both master and worker nodes can be upgraded
- master cannot be downgraded
- master must be upgraded separetely
- one minor version at a time
- data stored in `hostpath` and `emptyDir` volumes erased during upgrade

## Kubernetes Engine Pre-defined Roles
### Kubernetes Engine Admin
- `container.admin`
- Full access to clusters and their GKE resources

### Kubernetes Engine Developer
- `container.developer`
- Full access to running GKE cluster resources

### Kubernetes Engine Viewer
- `container.viewer`
- Read-only access to clusters and their GKE resources

### Kubernetes Engine Cluster Admin
- `container.clusterAdmin`
- access to manage clusters but not resources
- must be paired with Service Account User role

### Kubernetes Engine Cluster Viewer
- `container.clusterViewer`
- read-only access to Kubernetes clusters

### Kubernetes Engine Host Service Agent User
- `container.hostServiceAgentUser`
- manage network resources
- only for shared VPC
- for service accounts, not users

## GKE Role Based Access Control (RBAC)
- provides finer degree of control for GKE access
- part of Kubernetes specification
- works with Cloud IAM - focuses more on authroization rather than authentication
-  two types of permissions:
    - namespace-specific, targeting resources in a given namespace, across pods or nodes
    - cluster-wide, can be used for controlling API access
- defined by `kubectl` commands or programatically
- `kubectl` commands create `roles` and `rolebindings`
    - `role` - a collection of permission rules
    - `rolebinding` - connects user and `role`
- rules are additive; there is no deny option

## Pod Security Policy Fundamentals
- cluster-level resource managing access to create and update pods
- policy is a set of conditions that have to be met
- allows administrator
    - run privileged containers (ones that have linux capabilities like accessing devices and manipulating the network stack)
    - use host namespaces, networking, filesystem, etc.
- development steps (the order is critical)
    - create policy for new and updated pods initially
    - enable `PodSecurityController` admission controller
- possible to have multiple policies, first that validates is accepted
- policies are evaluated in alphabetical order

## Cluster Master Node IP Rotation Basics
- master node IP address is static and vulnerable
- rotating IP address is minimally invasive
- when begun, master node serves old and new IPs
- each API client must be updated with new address
- when process completed, send complete command to notify GKE
- master stops serving old IP address
- if initiated, but not finished, completes in 7 days

## Kubernetes Credentials Rotation Basics
- credentials authenticate worker node workloads and the master node control plane
- process also creates new IP address for master node
- upgrades all node pools to closest supported version
- more impactful on cluster in terms of downtime
- similar process to IP rotation:
    - once initiated, two IP addresses used
    - nodes get updated credentials and are recreated
    - automatically completed in 7 days if not finished

## Kubernetes Additional Security Basics
- numerous options, particularly for legacy services
- if enabled, disable Kubernetes dashboard (older projects)
- disable Attribute Based Access Control (ABAC) - older projects, precedessor to RBAC
- add network policy for pod-to-pod communication
- create new service account for nodes:
    - default nodes use Compute Engine service account
    - many non-essential permissions available
    - can be reduced to 3 monitoring roles (`monitoring.viewer`, `monitoring.metricWriter`, `logging.logWriter`)
    - other needs handled with new service accounts

## Kubernetes External Load Balancing
- distributes public network traffic across servers
- external load balancer added when deploying
- map ports as needed, including target port
- additional port mappings optional
- TCP and UDP supported
- options for exposing deployment:
    - **load balancing** - external IP for public access
    - **Cluster IP** - uses internal IP in the cluster
    - **Node port** - uses same port on every node

## Kubernetes Internal Load Balancing
- allows cluster access by services on the same network
- replaces external load balancer, firewall rules, and network routes
- created with YAML configuration file and `kubectl`
- restrictions:
    - Kubernetes 1.7.2 or higher
    - services must use the same network and region
    - same protocol type (TCP or UDP) must be used

## Kubernetes Network Policy Basics
- specifies how groups of pods communicate:
    - with each other
    - with services
- essentially creates pod-level firewall rules
- allows defense in depth for multi-level applications (also refered as castle approach)
- offer secure multi-tenancy by isolating namespaces
- uses additional node resources (~128 MB RAM)
- limitations:
    - at least 2 `n1-standard-1` type nodes; 3 preferred
    - `f1-micro` and `g1-small` nodes not supported

## Kubernetes Private Cluster Basics
- private cluster's master node is publicly inaccessible
- available to Google Cloud services
- relies on VPC native (alias IP) range
- custom subnets supported:
    - create subnet first, then apply to private cluster
    - secondary IP ranges supported for services and pods
- private clusters must use Container Registry images

## Kubernetes Engine Stateful Apps
- by default, GKE apps are stateless
- stateful apps require persistent disk storage
    - persistent storage can be dynamically provisioned
    - configured with a `StorageClass` (pre-installed)
    - persistent disks are a zonal resource (unless zone is specified, it is picked at random, pods that use it are scheduled for the same zone)
- GKE uses the `StatefulSet` controller for stateful apps
    - pods in `StatefulSet` controllers require unique IDs
    - storage requested with `PersistentVolumeClaim`
    - included `volumeClaimTemplates` array allows `PersistentVolumeClaim` to be generated
    - can be inspected and updated by console or `kubectl`

## Integrating other GCP services
- most GCP services use service accounts and secrets
    - via Cloud APIs
    - assign appropriate role to service account
- for custom services running on GCE VMs use internal load balancers
- Cloud SQL requires Cloud SQL Proxy docker image as a sidecar