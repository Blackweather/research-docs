# Kubecon 2020 Day 1 (18.08)

## Autoscaling intro
### Horizontal pod autoscaler
- based on load-like metrics
    - CPU usage
    - custom metrics
- adds or removes replicas to keep per pod load close to the desired target value

### Utilization - definition
- ratio between the current value and the maximum value of a load-describing metric
- if pod requested 1 cpu and is using only 0.5 then the cpu utilisation is 50%
- if pod can handle 1000 qps but is processing only 200 then the utilisation is 20%

### How to enable HPA
- create HPA object pointing to your deployment
- use kubectl autoscale command when scaling based on CPU
- CPU usage is available out of the box, custom metrics require more work

### Setting HPA target
- 1-utilisation is your spike buffer
- too small spike buffer
    - may prevent scale ups
    - may overload your existing replicas before new one arrives
- too big buffer causes resource waste
- should accomodate traffic growth that may happen in ~2 minutes (or more if your app starts very slowly)

### Best practices for HPA
- handle pod shutdown (SIGTERM) correctly
    - finish all in-flight requests that are being currently processed
    - wait for requests that may arrive after the pod termination begins
- define readiness (and liveness) probes
- keep MetricsServer healthy
- enable Cluster Autoscaler

### Vertical Pod Autoscaler
- based on resource data
    - CPU usage
    - memory usage
    - out of memory events
- recommends pod sizes to keep real usage well within the requested pod capacity

### Why VPA?
Request too small

- out of memory errors
- workload eviction
- CPU starvation

Request too big

- resource waste

### VPA modes
- recommendation only - VPA publishes only recommended pod sizes, doesn't change anything
- initialization only - VPA resizes pods only when pods are created
- auto - VPA resizes pods that already exist

### When to use VPA
- tracking long-term usage patterns
- stateless and stateful workloads not suited for HPA
- applications with relatively flat usage over lifetime
- auto mode - your application can handle restarts, and you gained enough confidence with VPA running in recommendation-only mode

### Best practices for VPA
- start with recommendation-only mode, validate and consider switch to auto
- use Pod Disruption Budgets
- set minimum and maximum container sizes in VPA object
- from time to time update recommended container sizes in Deployment spec
- very significant changes may require new deployment, label selector and VPA object
- keep metrics provider healthy
- enable Cluster Autoscaler

### Mixing HPA and VPA
- don't do it or execute caution
- use VPA in recommendations only mode
- use custom metrics like RPS for HPA
- use absolute values for HPA target when scaling based on CPU
- make sure that you receive enough traffic (HPA is not at min replicas)

### Cluster autoscaler
- provides nodes for pods that don't have a place to run
- removes underutilised nodes
- uses scheduling simulations and declared pod requests

### When to use CA
- always
- if your cluster is bigger than just a couple nodes
- if your cluster changes in time

### Best practices for CA
- pick the one that is provided by your cloud provider
- if managing it manually use the version that matches your k8s cluster version
- define Pod Disruption budgets for your applications

## Flux deep dive
### GitOps Toolkit
The GitOps Toolkit is a set of composable APIs and specialized tools that can be used to build a Continuous Delivery platform on top of Kubernetes.

These tools are built with Kubernetes controller-runtime libraries and they can be dynamically configured with Kubernetes custom resources either by cluster admins or by other automated tools.

The GitOps Toolkit components interact with each other via Kubernetes events and are responsible for the reconciliation of their designated API objects

### tk: the GitOps Toolkit CLI
The GitOps toolkit CLI utility allows cluster admins to configure the toolkit and assemble CD pipelines without having to write tomes of YAML

- seamlessly integrates with Git providers like GitHub and GitLab
- deploy keys provisioning for Git sources (SSH and token based auth)
- install/upgrade/check/uninstall operations for the toolkit components
- scaffolding and CRUD operations for the toolkit custom resources

### Toolkit component driven "Flux v2"
Flux v1 is a monolithic do-it-all operator, the GitOps Toolkit separates the functionalities into specialized  controllers.

Flux v2 will be a curated set of configuration for the GitOps Toolkit which you can simply consume using the *tk* command. Limiting the use of features and/or adding extensions on top of Flux has never been this easy.

### Source controller
The main role of the **source management** component is to provide a common interface for artifacts acquisition. The source API defines a set of Kubernetes objects that cluster admins and various automated operators can interact with to offload the Git and Helm repositories operations to a dedicated controller.

Operations:

- authentication and authenticity validation
- event-based and on-a-schedule policy driven artifacts acquisition
- produce immutable artifacts from sources

### Reconciliation of Resources from Git
#### Flux v1
- limited to reconciling resources from a single Git repository
- "declarative Git configuration" via arguments in the Flux deployment, cloned and fetched by fluxd
- only supports following the HEAD of Git branches
- reconciliation can be suspended by downscaling the Flux deployment
- credentials config via arguments and/or secrets volume mounts in the Flux pod

#### Toolkit component driven "Flux v2"
- can reconcile resources from multiple Git repositories
- declarative configuration through a **GitRepository CR**, producing an artifact to be reconciled by other controllers
- supports **Git branches**, **pinning on commits and tags**, and **following SemVer tag ranges**
- reconciliation can be paused per resource by suspending the GitRepository
- **Credentials config per GitRepository resource** (SSH private key, HTTP/s username/password/token, OpenPGP public keys)

### Kustomize Controller
The *kustomize-controller* is a Kubernetes operator, specialized in running continuous delivery pipelines for infrastructure and workloads defined with Kubernetes manifests and assembled with Kustomize.

- reconciles the cluster state from multiple sources
- generates manifests with Kustomize from plain yamls or overlays
- validates manifests against Kubernetes API
- impersonates service accounts (multi-tenancy RBAC)
- health assessment of the deployed workloads
- runs pipelines in a specific order (depends-on relationship)
- prunes objects removed from source (garbage collection)
- reports cluster changes

### Helm Controller
The *helm-controller* is the GitOps Toolkit's component driven "Flux v2" Helm Operator, and performs Helm actions for *HelmRelease* resources using the HelmChart artifacts produced by the *source-controller*.

- complete rewrite from scratch
- offloaded Helm repository and chart reconciliation
- improved *HelmRelease* API design
- simplified operations model
- Helm storage drift detection without performing dry-run comparisons

### Integration with Helm
#### Helm Operator v1
- declarative configuration in a single **HelmRelease** CR
- chart synchronization embedded in the operator
- support for fixed SemVer versions from Helm repositories
- Git repository synchronization on a global interval
- limited observability via the status object of the HelmRelease resource
- resource heavy, relatively slow

#### Toolkit component driven helm-controller
- declarative configuration through **HelmRepository**, **HelmChart** and **HelmRelease** CRs
- extensive release configuration options, and a reconcilation interval per source
- support for **SemVer ranges** for HelmChart resources
- planned support for charts from **GitRepository** sources
- better observability via the HelmRelease status object, Kubernetes events, and notifications
- better performance

### Notification Controller
The *notification-controller* is specialized in handling inbound and outbound events.

The controller handles:

- events coming from external systems (GitHub, GitLab, Bitbucket, Harbour, Jenkins, etc) and notifies the GitOps Toolkit controllers about source changes
- events emitted by the GitOps Toolkit controllers, that are dispatched to external systems (Slack, Microsoft Teams, Discord, Rocket) based on event severity and involved objects

### Advanced Deployment Strategies
Given the extensible nature of the GitOps Toolkit, we can **reduce the risk** of introducing a new software version in production by leveraging Flagger's progressive delivery strategies:

- canary release (progressive traffic shifting)
    - applications that expose HTTP or gRPC APIs
- A/B testing (HTTP headers and cookies traffic routing)
    - user-facing applications that need session affinity
- blue/green (traffic mirroring)
    - idempotent APIs
- blue/green (traffic switch)
    - stateful applications
    - legacy applications


## Jaeger intro
### Why is tracing important?
- Deep scaling
- modern architectures are deep systems

Jaeger does not provide instrumentation.
There is for example OpenTracing/Jaeger SDK.
Jaeger supports Zipkin format

### Why do we sample
- tracing data is rich
- large storage costs

### Types of sampling
#### Head-based sampling
- decision is made at the start of the trace propagated in the trace context
- minimal performance overhead
- can easily miss rare anomalies

Remote sampling - sampling configuration comes from the backend
configuration can be done per service or endpoint

#### Tail-based sampling
- sampling decision is made at the end of trace
- requires temporary storage of all traces
- performance overhead for traces that may be later discarded

- supported by opentelemetry collector
- not yet available for multinode solutions

#TODO: watch 8 talks