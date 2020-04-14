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

### Most common use case - scaling based on CPU usage
- most useful for request-based systems that consume CPU proportionally to the numver of requests they are receiving, while using a relatively static amount of memory

There is no direct link between HPA and ReplicaSet.
It is a bad idea to combine both autoscaling and imperative/declarative management of the number of replicas (it may cause unexpected behavior).

ReplicaSets should be used for any Pod you care about, even if it is a single Pod.

## Deployments
- exist to manage the release of new versions
- represent deployed applications in a way that transcends any particular version
- enable you to easily move from one version of your code to the next
- rollout mechanics controlled by a deployment controller that runs in Kubernetes cluster
- to use deployments to reliably roll out software, you have to specify readiness health checks for the containers

- `kubectl rollout history` - get the history of rollouts associated with a particular deployment
    - given in oldest to newest order
    - `--revision={number}` - show details about a specific revision
- `kubectl rollout status` - obtain current status of a rollout

- changing the `kubernetes.io/change-cause` annotation value will trigger a new deployment
    - this shouldn't be change in case of simple scaling operations
- whenever a new deployment is rolled out the old ReplicaSet object is kept in case you want to roll back
- `kubectl rollout undo` - rollout in reverse
    - creates a new revision
    - switches back to the previous ReplicaSet object
    - `--to-revision={number}` - roll back to a specific version
        - `--to-revision=0` - roll back to previous version, equivalent to not using the flag

### Strategy object
- dictates the different ways in which a rollout of new software can proceed
- two different strategies supported
    - `Recreate`
    - `RollingUpdate`

#### Recreate strategy
- updates the ReplicaSet it manages to use the new image and terminates all the Pods associated with the Deployment
- ReplicaSet notices it no longer has any replicas and re-creates all Pods using the new image
- fast and simple
- results in downtime
- should be only used for test and not user-facing deployments

#### RollingUpdate strategy
- preferable for any user-facing service
- slower than Recreate
- no downtime
- updates a few Pods at a time, moving incrementally until all Pods are running the new version
- for a short period of time, both the new and old version of the service will be receiving requests and serving traffic
- backward and forward compatibility needs to maintained for reliable updates
- configurable
    - `maxUnvailable` - set the maximum number of Pods that can be unavailable during a rolling update (absolute number or percentage)
        - helps tune how quickly a rolling update proceeds
        - setting this to 100% is identical to using Recreate strategy
        - setting this to 0% and using `maxSurge` will ensure resources don't fall below 100% capacity
    - `maxSurge` - controls how many extra resources can be created to achieve a rollout
        - setting this to 100% is equivalent to a blue/green deployment
    - `minReadySeconds` - time the deployment must wait after seeing a Pod become healthy before moving on to updating the next Pod
    - `progressDeadlineSeconds` - allows to set a time out for deployment (might be useful whenever a service for example has a deadlock and never gets ready)

## DaemonSets
- ensures a copy of a Pod is running across a set of nodes in a Kubernetes cluster
- used to deploy system daemons such as log collectors and monitoring agents
- labels can be used to run DaemonSet Pods on specific nodes
    - for example run intrusion-detection software on exposed nodes
    - or workloads that require a GPU or access to fast storage available to a subset of nodes in your cluster
- can be used to install software on nodes
- useful in the contaxt of an autoscaled Kubernetes cluster

- to run a DaemonSet no a specific node use `nodeSelector` with a label existing on the target nodes
    - whenever a new node has this label added, new Pod will be scheduled
    - inverse is also true

## Jobs
- used for handling short-lived, one-off tasks
    - for example database migrations, batch jobs
- creates Pods that run until successful termination
    - if the Pod fails before a successful termination, the job controller will create a new Pod based on the Pod template in the job specification
- automatically picks a unique label to identify the Pods it creates

### Restart policy
- `restartPolicy: OnFailure` - whenever a Pod fails, it is recreated with the same name and args
- `restartPolicy: Never` - whenever a Pod fails, a new Pod is created
    - can create a lot of "Junk" in your cluster

### Job patterns
<table>
    <tr>
        <th>Type</th>
        <th>Use case</th>
        <th>Behavior</th>
        <th>Completions</th>
        <th>Parallelism</th>
    </tr>
    <tr>
        <td>One shot</td>
        <td>Database migrations</td>
        <td>A single Pod running once until successful termination</td>
        <td>1</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Parallel fixed completions</td>
        <td>Multiple Pods processing a set of work in parallel</td>
        <td>One or more Pods running one or more times until reaching a fixed completion count</td>
        <td>1+</td>
        <td>1+</td>
    </tr>
    <tr>
        <td>Work queue: parallel jobs</td>    
        <td>Multiple Pods processing from a centralized work queue</td>    
        <td>One or more Pods running once until successful termination</td>    
        <td>1</td>    
        <td>2+</td>    
    </tr>
</table>

#### One Shot jobs
- a single Pod fires up to complete a single task on its own
- after the job has completed, the Job object and related Pod are still around
    - allows for log inspection

#### Parallelism
- multiple Pods are fired up to achieve a single task
- `completions: {number}` - number of Pods that need to succeed for the job to be successful
- `parallelism: {number}` - number of Pods running at once