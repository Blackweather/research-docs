# Google Cloud Essentials - Linux Academy Course

### App Engine
- Platform as a Service
    - not as customizable as a VM
- automatic scaling and load-balancing
- **standard environment**
    - limited languages and access
    - faster instance spin-up
    - less expensive
- **flex environment**
    - standarized on docker
    - broader language/version use
    - slower instance spin-up
    - more expensive

### Compute Engine
- Infrastructure as a Service
- run publiic disk images or private images
- optionally works with containers
- VPC support
- default and custom firewalls
- routing support

### Kubernetes Engine
- managed, orchestrated environment for containerized applications
- uses Compute Engine VMs to form a cluster
- only Docker supported
- load-balancing
- automatic scaling
- automating upgrades
- automatic repair based on health reports
- automatic logging and monitoring with Stackdriver

### Cloud Functions
- serverless environment for executing code and connecting cloud services
- fully managed
- triggers:
    - HTTP request
    - Cloud Storage event
    - Pub/Sub event
- use cases:
    - Webhooks - Respond to any HTTP request
    - data and image processing
    - mobile backend - react to storage, authentication or data events
    - IoT - respond to Pub/Sub messages from devices

### Cloud Identity
- Identity as a Service
- Originally G-Suite based with separate Google Admin
- Integrated into Google Cloud
- Manage resources hierarchically
- assign unmanaged accounts to project
- allow single sign-on

### Cloud IAM
- unified resource access management system
- 3 main resources: policies, roles, resources
- identities:
    - Google account, unmanaged account
    - service account
    - Google group, G-Suite domain, Cloud Identity Domain
- resources:
    - projects and folders
    - cloud services
    - aspects of cloud services (instances, buckets, topics, etc.)

### Cloud KMS
- Cryptographic key management system
- keys are used to encrypt/decrypt files
- hierarchical
- project-based
- key ring - a collection of keys in a specified location for a specific project
- individual keys inherit permissions from key ring
- different key versions have different encryption/decryption values
- key version states: enabled, disabled, scheduled for destruction, destroyed
- key versions can be rotated regularly and automatically or manually

### Cloud Identity-Aware Proxy (IAP)
- Application-level authorization service
- based on internal Google enterprise security model, BeyondCorp
- supplements network-level firewalls
- ideal for line of business apps
- no VPN needed:
    - straight-forward implementation for administrators
    - simple to use for remote workers
- no additional charge

### Cloud Storage
- BLOB storage
- automatic data encryption at rest and decryption on delivery
- primary container - buckets
    - project-based
    - divided into classes
        - multi-regional - highest availability, most frequently accessed
        - regional - routinely accessed, best for analytics
        - nearline - infrequently accessed, used for archival and data backup
        - coldline - least accessed, lowest cost, typically for disaster recovery

### Cloud Datastore
- NoSQL database
- ACID transactions
- SQL-like language, GQL
- structure - schemaless:
    - kinds - like tables
    - entity - like row, but can have different properties
    - property - like field, but multiple properties possible
    - key - like primary index
    - supports optional ancestors and children
- uses: product catalogs, user profiles, ACID transactions, etc.

### Cloud SQL
- managed relational database service
- supports PostgreSQL, MySQL
- scalable
- automatic replication and backup
- data automatically encrypted
- default firewalls for each instance
- storage can be increased but not decreased

### Cloud Bigtable
- fully managed, massively scalable NoSQL database service for big data
- used for Gmail, Google Search, Maps & Analytics as well as eBay and Spotify
- different from Cloud Datastore
    - wide column database
    - No SQL-like language available
    - single key per row
- capable of holding hundreds of petabytes of information
- columns wide enough for entire web pages or satellite imagery
- consistent low latency and high throughput
- dynamically change cluster size without stopping and restarting
- use cases: graph data, financial data, IoT data, marketing data, etc.

### Cloud Spanner
- fully managed, enterprise-grade, relational database service
- is to Cloud SQL as Cloud Bigtable is to Cloud Datastore
- scales horizontally like NoSQL databases
- high availability (99.999% uptime) with strong consistency
- industry standard SQL support
- supports data definition language (DDL)
- client libraries
- use cases: call centers, financial trading, telecom, transportation, etc.

### Cloud MemoryStore
- fully managed, in-memory datastore service
- redis protocol compatible
- extremely low latency: sub-milisecond
- as-needed scaling, up to 300 GB instance
- connect with App Engine, Compute Engine, or Kubernetes Engine
- service tiers:
    - basic - default, for basic caching
    - standard - for highly available Redis instance
- use cases: caching layer in gaming & analytical pipelines, stream processing

### BigQuery
- fully managed data warehouse for big data
- near real-time interactive analysis of massive datasets
- standard SQL supported
- storage and computing handled and billed separately
- external services queries: Cloud Storage, Cloud Bigtable & Google Drive
- automatic data replication
- modify data with Data Definition Language
- use cases: real-time inventory, predictive digital marketing, analytical events

### Cloud Dataflow
- fully managed service for creating pipelines to process data
- based on apache beam
- processes data on multiple machines in parallel
- handles both streaming (live) and batch (archived) data
- no instances or clusters to establish: serverless
- easy replication of services with templates:
    - no need to recompile code before processing pipeline
    - execute pipeline without dev environment and its dependencies
    - can customize execution with template parameters
    - can be executed via the console or gcloud command
- best option if no current implementation with Apache Hadoop or Spark
- use cases: analytical dashboards, forecasting sales trends, ETL operations

### Cloud Dataproc
- fully managed cluster data processing service
- compatible with Apache Hadoop, Spark, and Hive
- move existing projects or pipelines without redevelopment
- boasts fast cluster creation - 90 seconds vs. 5-30 minutes
- can scale clusters up and down without stopping the job
- can switch to different versions of Hadoop, Spark, and others
- workflow templates
    - create template, add job, and instantiate template
        - workflow 1: creates cluster, runs jobs, and deletes cluster
        - workflow 2: works with existing cluster and runs jobs
- similar to cloud dataflow
    - both data process
    - both handle batch and streaming data

### Pub/Sub
- Fully managed messaging middleware service
- Allows secure and highly available messages between independent apps
- works with both Google Cloud and external services
- full range of communication:
    - one to many
    - many to one
    - many to many
- both push and pull options
- messages encrypted and HIPAA compliant 
- use cases: streaming data, event notifications, asynchronous workflows, etc.

### Cloud Datalab
- interactive data analysis and machine learning environment
- packaged as a container and runs in a VM instance
- based on Jupyter notebooks
- notebooks:
    - contain code, docs in markdown, and code results
    - code results can be text, image, JavaScript, or HTML
    - can be shared with team members
    - collection of cells containing code or markdown

### Cloud Data Studio
- interactive report and big data visualizer
- creates dashboards, charts, and tables
- connect to BigQuery, Cloud Spanner, Cloud SQL & Cloud Storage
- stores shareable files on Google Drive
- Basic process is three steps:
    - connect to data source
    - visualize data in report
    - share report

### Cloud VPC
- private network within Google Cloud network infrastructure
- adds network to Compute Engine, Kubernetes Engine, and App Engine (Flex)
- global resource consisting of regional subnets, connected by WAN
- Cloud VPC includes:
    - firewalls
    - routes
    - forwarding rules
    - configuration of IP addresses, external or internal
- two types of VPC creation: auto mode and custom mode
- additional services include Shared VPC and Network Peering

### Cloud Load Balancing
- fully managed incoming traffic service
- distributes traffic across several VM instances
- benefits:
    - autoscaling (by policy, CPU utilization, or serving capacity)
    - supports heavy traffic
    - route traffic to closest instances
    - detect and remove unhealthy instances
- types of load balancing supported:
    - global external - HTTP/S, SSL, and TCP
    - regional external - TCP/UDP within a region
    - regional internal - between groups of instances in a region

### Cloud CDN
- accelerates delivery from Compute Engine and Cloud Storage
- lowers network legacy, offloads origin servers, and reduces serving costs
- features include:
    - offers SSL at no additional cost
    - supports HTTP/1.0, HTTP/1.1, and HTTP/2
    - supports cache invalidation
    - cache-to-cache filling supported
- general availability caches to 10 GB, Large Object Caching (Beta) to 5 TB
- caching considerations
    - caching is reactive
    - caches cannot be pre-loaded
    - once enabled, caching is automatic
    - HTTP(S) load balancer is required

### Cloud VPN
- provides secure connection between on-premises and Cloud VPC
- utilizes IPsec VPN gateways with encrypted/decrypted traffic
- features include:
    - site-to-site VPN via simple topology or with redundancy
    - supports Internet Key Exchange (IKE) v1 and v2 with shared secret
    - uses ESP in Tunnel mode with authentication for encryption
- routing methods supported:
    - dynamic gateways using Border Gateway Protocol
    - policy-based routing
    - route-based VPN
- best for low/medium traffic: 3 Gbps with direct peering; 1.5 Gbps without

### Cloud Interconnect
- provides higher-capacity connections between on-prem and Cloud VPC
- dedicated interconnect
    - direct physical connections with Google network
    - 69 colocations facilities in 17 regions
    - highest bandwidth: 10 GB/sec per circuit (8 circuits max)
    - routing equipment in colocation facility required
- partner interconnect
    - connect to 3rd party service provider
    - many more connection possibilities
    - bandwidth from 50 MB/sec to 10 GB/sec
    - routing equipment not required
- public internet bypassed
- VPN tunnels or NAT devices not needed
- not encrypted - use app level encryption or own VPN

### Cloud AI
- collection of services and APIs designed to faciliate machine learning
- includes hardware accelerators: TPUs (TensorFlow Processing Units)
- primary service: Cloud Machine Learning Engine (ML Engine)
    - training
        - trains computer models to recognize patterns in data
        - supports TensorFlow, scikit-learn, and XGBoost
    - prediction
        - online
            - real-time processing with fully managed ML Engines
            - no docker container required & supports multiple frameworks
        - batch
            - for asynchronous operations
            - scales to terabytes of data
- data must be stored in accessible location, e.g. Cloud Storage

### Cloud IoT Core
- fully managed service for connecting and managing IoT devices
- devices must be registered
- works with both telemetry (event data) & device state data
- receives data and sends to Cloud Pub/Sub topic
- supports HTTP and MQTT protocols for communication
- highly secure:
    - each device uses JSON Web Tokens for public/private keys
    - supports RSA or Eliptic Curve algorithms to verify signatures
    - key rotation support
    - access to IoT core controlled by Cloud IAM roles and permissions
- part of an IoT eco-system with Android Things and Google Beacon

### Cloud Data Transfer
- range of options available for transferring data to Google Cloud
- online transfer
    - tools available: console upload, JSON REST API, gsutil
- storage transfer service
    - imports online data to Cloud Storage
    - supports transfer of objects from AWS S3
- transfer appliance
    - physical device loaded on-prem and shipped to Google data center
    - single device can hold petabyte of data
    - far faster than online transfer for large amounts of data