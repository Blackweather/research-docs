# Intro: Network Service Mesh (NSM)

## Cloud Native Definition (by CNCF)
Cloud native technologies empower organizations to build and run scalable applications in modren, dynamic environments such as pulic, private, and hybrid clouds. Containers, service meshes, microservices, **immutable infrastructure**, and declarative APIs exemplify this approach.

These techniques enable **loosely coupled** systems that are resilient, manageable, and observable. Combined with robust automation, they allow engineers to make high-impact changes frequently and predictably with **minimal toil**.

The Cloud Native Computing Foundation seeks to drive adoption of this paradigm by fostering an ecosystem of open source, vendor-neutral projects. We democratize state-of-the-art patterns to make these innovations accessible for everyone.

## Minimal toil networking
- minimal conceptual toil
    - no interfaces/routes/subnets as concepts
    - conceptualize as 'Network Services'
        - intersection of Connectivity/Security/Load Balancing/NAT/etc
- minimal consumption toil
    - ask for what you want by name
        - secure-intranet-connectivity
        - manufacturing-partner-network
        - marshas-app-connectivity

### Minimal toil networking - k8s example
- k8s network conceptually:
    - connectivity - L3 between all pods
    - security - network policies
    - load balancing - services/endpoints
    - mostly intra-cluster
- consumption
    - it's just there
    - network policies/services are easy

## Loose Coupling in K8s
- k8s API loosely coupled to implementation
    - many CNI plugins
- strongly coupled to cluster
    - usually one CNI plugin per cluster
- single edge for entire cluster
    - or possibly multiple clusters
- coarse granularity
    - realistically all workloads in cluster or none

## What is NSM
- network service definition
- gRPC API to descrive, publish and consume Network Service(s)
- a distribtuted control plane with minimum shared state
- concrete Kubernetes based implementation
    - runtime interface injection/removal for Pods. Orthogonal to CNI
    - leverage etcd as a central shared storage through CRDs
    - use kubernetes 'DaemonSet' to provision local node agents
    - VPP as a base forwarding component