# Kubernetes Up And Running - Notes

## Cluster Components

### Kubernetes proxy
- responsible for routing network traffic to load-balanced services in the cluster
- must be present on every node in the cluster
    - can be a `DaemonSet`

### Kubernetes DNS
- provides naming and discovery for services defined in cluster
- runs as a replicated service

## Kubernetes Volumes Use Cases
- **Communication/Synchronization** - two containers in a pod can use a shared volume called `emptyDir`
- **Cache** - valuable for performance, for example for storing thumbnails of pictures, so they don't have to be recreated every time the pod is restarted
- **Persistent data** - data independent of the lifespan of a particular pod
- **Mounting the host filesystem** - for example for pods that may need access to host filesystem

## Service Discovery
- help solving the problem of finding which processes are listenging at which address for which services
- a good service discovery system will enable users to resolve this quickly and reliably
    - it is also low latency
    - can store a richer definition of what the service is (for example associated ports)
- DNS - trafitional service discovery system on the internet

## HTTP Load Balancing with Ingress
### Virtual hosting
- hosting many HTTP sites on a single IP address. Typically the us
- typically the user uses a load balancer or reverse proxy to accept incoming connections on HTTP and HTTPS ports. The program then parses the HTTP connection and, based on the *Host* header and the URI path that is requested, proxies the HTTP call to some other program.

*Ingress* - cloud-native way to implement "virtual hosting" pattern.

### Typical implementation
- Ingress controller - a software system exposed outside the cluster using a service of type: *LoadBalancer*
- proxies requests to "upstream" servers
    - the configuration for how it does this is the result of reading and monitoring Ingress objects

### Ingress Spec Versus Ingress Controllers
- split into a common resource specification and a controller implementation
- no "standard" Ingress controller built into Kubernetes

### Running multiple Ingress Controllers
- specify which Ingress object is meant for which Ingress controller using `kubernetes.io/ingress.class` annotation
    - value should be a string which specifies which Ingress controller should look at this object
- if the annotation is missing, behavior is undefined

### Ingress and Namespaces
- Ingress object can only refer to an upstream service in the same namespace
- multiple Ingress objects in different namespaces can specify subpaths for the same hosts (the objects are merged up for controller configuration)

## Autoscaling ReplicaSets
HPA requires the presence of the **metrics-server** Pod on your cluster.
**metrics-server** keeps track of metrics and provides an API for consuming metrcis that HPA uses when making scaling decisions.

- vertical pod autoscaling is not currently implemented in Kubernetes
- many solutions also enable cluster autoscaling