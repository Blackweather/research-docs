# Cloud Report magazine - 03/2019

## Google Cloud Build
- imports sources, builds them, creates container images, stores them (and deploys them)
- builds configured with YAML file
- builders provided by GCP, community or build your own
- build steps executed inside a container
    - ran inside a local Docker network `cloudbuild`
- can be triggered manually using `gcloud builds`~
    - or by hooks

### Cloud Build lifecycle
- create an application
- add Cloud Build config-file to the application
- build submitted to Cloud Build service
- build process executed inside Cloud Build
- container images pushed to container registry

