# Kubernights #1 - 30.01.2020

## Kubectl with multiple clusters
Alternative kube config 

- `export KUBECONFIG=abc.cfg`
- can be used with multiple config files

## Flux
- git as a single point of truth

Operator pattern

- applications that observe CRDs and apply changes

If we delete something from yaml in repo, flux won't register any changes.

SOPS - a tool for secrets from Mozilla

## Canary Release with Flagger
Service Level Indicator - metric, for example number of HTTP responses other than 500 to the number of requests

Service Level Objective - f.ex. SLI > 97.5%
    - error budget = 1 - SLO

Service Level Agreement - formal agreement

### Flagger
Kubernetes operator used for automatic analysis, testing, promotion and roll back of applications.
Uses service mesh or ingress controller for routing.