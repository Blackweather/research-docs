# OpenStack Essentials - Linux Academy

## Keystone
### What is Keystone?
- common authentication system across the cloud
- supports token-based authorization and user-service authorization
- the identity service generates authentication tokens that permit access to the OpenStack services REST APIs
- provides authentication not only to users, but also to OpenStack services
- provides identity, token, catalog, and policy services using OpenStack Identity API
- protects its APIs by defining policy rules based on an RBAC approach, stored in a `.json` policy file
- each identity API call has a line in the policy file that dictates which level of governance of access applies
- keystone is a foundation service and should be the first service installed

### Keystone architecture
- uses Python-based library and daemon(s) to receive service and admin API requests
- pluggable backend architeture helps Keystone to integrate with heterogeneous environments such as:
    - **Pluggable Authentication Module** - uses local system's PAM service to authenticate
    - **LDAP** - connects via LDAP to AD to authenticate users and obtain role information
    - **Key Value Store** (KVS) - in-memory
    - **memcached** - distributed memory caching system
    - **SQL** - Sqlite, MySQL, MariaDB
- keystone tracks which OpenStack services are installed and where to locate them on the network

### Keystone concepts
- **User** - a digital representation of a person, system, or service who uses OpenStack services and has associated information such as username, password and (optional) email
- **Tenants/Projects** - a container used to group or isolate resources
    - tenant must be specified to make requests to OpenStack services
    - may map to a customer, account, or organization
    - users can be directly assigned to a particular tenant or project
- **Role** - a role includes a set of rights and privileges that specfies what operations a user is permitted to perform in a given tenant/project they are part of
- **Token** - a random bit of text used to access resources
    - each token has a scope, which describes the resources accessible with it
- **Service** - provides one or more endpoints through which users can access resources and perform operations
    - each service is identified by an ID number, name, service type, and description
    - services are associated with Public, Internal and Admin endpoint URLs
        - **PublicURL** - accessible over the public internet
        - **InternalURL** - communication between services
        - **AdminURL** - administrative management of OpenStack services
    - the service catalog is a list of services and their respective endpoints
- **Endpoint** - a network-accessible address, usually a URL, from where you can access an OpenStack service. URLs are available for all projects/tenants by default.

### Keystone authentication process
- when an incoming functional call arises, Keystone confirms if it is from an authorized user via credentials (username, password, authURL)
- once identity is confirmed, a token is provided. Tokens are a string of ASCII characters representing a successful authentication request.
- the token includes a list of the user's projects/tenants and roles. Users can now submit tokens instead of re-authenticating on each request.
- token expiration time, validity, and life span is customizable (default is 1 hour)

## Horizon
### Horizon Overview
- Horizon is a Django-based project aimed at providing a complete OpenStack dashboard, along with an extensible framework for building new dashboards from reusable components
- can be used to access, provision, and automate deployment of cloud-based resources
- design allows for third-party products and services
- can be customized and rebranded by service providers and commercial vendors using custom `.css` files

### Horizon Architecture
- core support: out-of-the-box support for all core OpenStack projects
- provided through 3 central dashboards:
    - user dashboard
    - system dashboard
    - settings dashboard
- the dashboards cover the core OpenStack applications and deliver core support
- extensible: anyone can add a new components as a "first-class" citizen
    - a horizon dashboard application is based around the dashboard class that provides a consistent API and a set of capabilities for both core OpenStack dashboard apps shipped with Horizon and equally for third-party applications
- the dashboard class is treated as a top-level navigation item.
    - should a developer wish to provide functionality within an existing dashboard, the simple registration pattern makes it possible to write an app that hooks into other dashboards just as easily as creating a new dashboard by importing the dashboard you wish to modify
- manageable: the core codebase should be simple and easy to navigate
    - there is a simple method for registering a panel (sub-navigation items) within the application
- each panel contains the neccessary logic (*views, forms, tests, etc.) for that interface
    - this granular breakdown prevents files (such as api.py) from becoming thousands of lines long and makes code easy to find by correlating it directly to the navigation
- consistent: visual and interaction paradigms are maintained
    - horizon maintains consistency by providing the necessary core classes to build from, as well as a solid set of reusable templates and additional tools such as base form classes, base widget classes, template tags, and class-based views
- stable: a reliable API with an emphasis on backwards-compatibility
    - by architecting around these core classes and reusable components, Horizon developers have created an implicit contract that changes to these components will be made in the most backwards-compatible ways whenever possible
- usable: provides an inteface that people want to use

## Nova
### What is Nova?
- OpenStack Compute (Nova) is an open source software designed to provision and manage large networks of virtual machines, creating a redundant and scalable cloud computing platform
- provides software, control panels, and APIs required to orchestrate a cloud
    - running instances, managing networks, and controlling access through users and projects
- strives to be both hardware and hypervisor agnostic; currently supporting a variety of standard hardware configurations and seven major hypervisors

### Detailed Feature List
- **Multi-Tenancy** - all facets of the platform are multi-tenant including billing, logging, auditing, and end-user control panels
- **Massive Scalability** - compute architecture is designed to scale horizontally on standard hardware, with no proprietary hardware or software requirements. Compute nodes can be scaled into the thousands.
- **Multiple Network Models** - supports a number of plugable backend networking drivers, such as:
    - VLAN
    - FlatDHCP
    - Flat
- **Pluggable Authentication** - makes it possible to integrate an existing authentication system. Currently implemented backends:
    - **Local Auth** - standalone internat authentication system
    - **LDAP** - an example authentication module that integrates with an LDAP backend
- **Block Storage Support** - offers a variety of options as a supplementary volume.
    - **AOE** - ATA over Ethernet
    - **IET iSCSI** - provisions IET iSCSI volumes from a configurable source
    - **LVM volume RBD**- Rados Block device, a network block device backed by objects in a Ceph distributed object store
    - **Sheepdog** - a distributed storage system for KVM using commodity hardware
    - **Solaris iSCSI** - iSCSI target running on Solaris/ZFS
    - **HP SAN** - HP StorageWorks P4000 SAN target
- **Control Panel** - suitable for rebranding. Can be used as a customer-facing control panel or as a sample integration with existing control panels
- **Android & iOS Clients**
- **Language Bindings**

### Hypervisor Support
- Nova can use many different hypervisors as a backend virtualization target for an OpenStack Compute cluster

### Nova Architecture
- **nova-conductor**
    - mediates interactions between nova-compute and the database eliminating direct access to the database made by nova-compute
- **nova-compute**
    - a worker daemon that manages instance lifecycles through API
- **nova-X-proxy**
    - browser-based proxy for access to running instances

#### VNC Proxy Types
- **Nova-novncproxy**
    - provides access through a VNC connection. Supports browser-based novnc clients.
- **Nova-spicehtml5proxy**
    - provides access through SPICE. Supports browser-based HTML5 clients
- **Nova-xvpvncproxy**
    - provides access through a VNC connection. Supports an OpenStack-specific Java client

## Neutron
### What is Neutron?
- project focused on delivering Networking as a Service (NaaS) between interface devices managed by other OpenStack services
- provides an API that allows the user to:
    - set up and define network connectivity and addressing in the cloud
    - configure and manage a variety of network services, ranging from L3 forwarding and NAT to load balancing, edge firewalls, and IPsec VPN
- networking relies on the Identity service for the authentication and authorization of all API requests
- Compute interacts with Networking through calls to its standard API. As part of creating a VM, the **nova-compute** service communicates with the Networking API to plug each virtual NIC on the VM into a particular network
- Horizon dashboard integrates with the Networking API, enabling administrators and project users to create and manage network services through a web-based GUI

### Networking Components
- Neutron plug-in agents run on each hypervisor to perform local vSwitch configuration. The agent that runs depends on the plug-in you use. The following agents interact with the main neutron process through RPC or through the standard networking API.
    - **neutron-server** is the main service in OpenStack networking. The neutron-server daemon exposes the networking API and passes tenant requests to a suite of plug-ins for additional processing.
    - **neutron-dhcp-agent** provides DHCP services to project/tenant networks. This agent is the same across all plug-ins and is responsible for maintaining DHCP configuration.
    - **neutron-l3-agent** provides L3/NAT forwarding to provide external network access for VMs on project/tenant networks.
    - **neutron-metering-agent** provides L3 traffic metering for project networks
    - **Neutron plugin agent** (neutron-X-agent) runs on each Compute node to manage local vSwitch configuration. The plugin that you use determines which agents run.
        - like the **neutron-dhcp-agent** and **neutron-l3-agent**, **neutron-X-agent** requires message queue access and depends on the plugin used.
- **Network provider services** provide additional networking services to tenant networks.
    - these SDN services may interact with **neutron-server**, **neutron-plugin**, and plug-in agents through communication channels such as REST APIs.

#### Neutron-server
- OpenStack Networkin consists of the neutron-server daemon, a database for persistent storage, and any number of plugin agents, which provide other services such as interfacing with native Linux networking mechanisms, external devices, and SDN controllers
    - the networking server uses the neutron-server daemon to expose the networking API and enable administration of the configured networking plug-in
- similar to other OpenStack services, the Networking plugin typically requires access to the database for persistent storage

#### Neutron plugin
- pluggable Python classes that are invoked while responding to API requests
- Neutron relies on plugins to support a wide variety of networking technologies
- plugins included in the main Neutron distribution and supported by the Neutron community include:
    - Open vSwitch
    - Linux Bridge agent
    - Modular Layer 2 (ML2) - supports a wide variety of L2 technologies and allows multiple vendor technologies to coexist
    - Brocade Neutron plugin

### Network Types
- **Management Network** - used for internal communication between OpenStack components. The IP addresses on this network should be reachable only from within the datacenter
- **Guest Network** - used for VM data communication within the cloud deployment. The IP addressing requirements of this network depend on the OpenStack Networking plugin used and the network configuration choices of the virtual networks made by the tenant.
- **External Network** - used to provide VMs with internet access. The IP addresses on this network should be reachable by anyone on the internet.
- **API Network** - exposes all OpenStack APIs, including the OpenStack Networking API to tenants. The IP addresses on this network should be reachable by anyone on the internet.

## Glance
### What is Glance?
- the OpenStack image service is central to IaaS
- accepts API requests for disk or server images, and metadata definitions from end users or OpenStack Compute components
- supports the storage of disk or server images on various repository types, including OpenStack Object Storage (Swift)
- allows administrators to create base templates from which their users can start new compute instances
- allows users to choose from available images or create their own from existing servers
- snapshots can be stored in Glance so that VMs can be backed up quickly
- Nova relies on an external image service to store virtual machine images and maintain a catalog of available images
- by default, Compute is configured to use the Glance image service, which is currently (as of Newton release) the only supported image service
- the Glance project provides a service that allows users to upload and discover data assets, including images and metadata definitions, meant to be used with other services.
- Glance image services include discovering, registering, and retrieving virtual machine images
- has a RESTful API that allows querying of VM image metadata, as well as retrieval of the actual image
- Virtual images made available by the Image service can be stored in a variety of locations, from simple file systems to object-storage systems like OpenStack Object Storage (Swift)

### Virtual Disk Images
- A Virtual Disk Image (VDI) is a file (or group of files) representing the complete contents of a physical hard drive or optical disk.
- These images come in different formats depending on contents and origin. Common image formats include:
    - `.iso`
    - `.vhd`
    - Microsoft HyperV
- images can be created through a number of virtualization applications as well as specialized utilities such as Citrix XenConvert or Libvirt Virt-install

### Glance Architecture
- **glance-api** - accepts image API calls for image discovery, retrieval and storage
    - User-facing API - accessible over the public internet
    - Registry API - for internal requests; requires access to the database
- **glance-registry** - stores, processes, and retrieves metadata about images. Metadata includes items such as size and type
    - the registry is a private internal service meant for use by OpenStack Image service and should not be exposed to users
- **Database** - the database (can be MySQL or SQLite, depending on preference) stores image metadata
- **Storage repository for image files** - various repository types are supported, including:
    - Normal file systems (or any filesystem mounted on the glance-api controller node)
    - Object storage (Swift)
    - RADOS block devices
    - VMware data stores
    - HTTP
- **Metadata definition service** - a common API for vendors, administrators, services, and users to meaningfully define their own custom metadata. A definition includes the new property's key, description, constraints, and the resource types it can be associated with.

## Swift
### What is Swift
- the OpenStack Object Store project known as Swift is a highly available, distributed, eventually consistent object store that can be used to store lots of data efficiently, safely, and cheaply.
- objects and files are written to multiple disk drives spread over multiple servers in a datacenter, with OpenStack software responsible for ensuring data replication and integrity across the cluster
- clusters can be scaled horizontally simply by adding additional servers

### Object Storage API
- store an unlimited number of objects as large as 5GB each (default). Maximum object size can be adjusted
- upload and store objects of any size with large object creation
- use cross-origin resource sharing to manage object security
- compress files using content-encoding metadata
- override browser behavior for an object using content-disposition metadata
- schedule objects for deletion
- bulk-delete up to 10000 objects in a single request
- auto-extract archive files
- generate a URL that provides time-limited GET access to an object
- upload objects directly to the Object Storage system from a browser by using the form POST middleware

### Swift Architecture
- **Account** - represents the top-level of the hierarchy. Your account (created by the service provider) defines a namespace for containers. In the OpenStack environment, account is synonymous with a project/tenant
- **Container** - defines a namespace for objects. An object with the same name in two different containers represents two different objects. Any number of containers can be created within an account.
- **Object** - stores data content such as documents, images, etc. Objects can also store custom metadata. The object storage API can:
    - store an unlimited number of objects as large as 5GB each (default). Maximum object size can be adjusted. 

## Cinder
### Cinder Overview
- OpenStack Block Storage (Cinder) is designed to present storage resources to end users that can be consumed by the OpenStack Compute project (Nova).
- this is done through the use of either a reference implementation or plugin drivers for other storage
- Cinder manages the creation, attachment and detachment of block storage devices to servers
- fully integrated with OpenStack compute and Horizon, Cinder allows users to quickly and easily manage their own storage needs.
- Cinder block storage is intended to run on one or more nodes
- in short, Cinder virtualizes the management of block storage devices and provides end users with a self-service API to request and consume said resources without requiring any knowledge of where their storage is actualy deployed or on what type of device

### Cinder Architecture
- **cinder-api**
    - component that receives HTTP requests, converts commands and communicates with cinder-scheduler (creation) and cinder-volumen (management) via AMQP or HTTP
- **cinder-scheduler**
    - in charge of host placement for newly created volumes. Forwards request to cinder-volume
- **cinder-volume**
    - manages dynamically-attachable block devices. Receives volume management requests from cinder-api and cinder-scheduler and rotates them to storage backends using vendor-supplied drivers

### Cinder Backend support
- a Cinder backend is the configuration object that represents a single provider of block storage upon which provisioning requests may be fulfilled. A Cinder backend communicates with the storage system through a Cinder driver
- the default OpenStack Block Storage service implementation is an iSCSI solution that uses LVM for Linux
- multi-backend support
    - allows a single instance of cinder-volume to manage all storage pools with a single configuration file
    - preferred method to run Cinder, as it concentrates configuration into one file and uses less resources

## Additional Services
- **OpenStack Trove** - database as a service
    - allows users to quickly and easily utilize features for both relational and non-relational database engines without the burden of handling complex administrative tasks
    - allows cloud users and administrators to provision and manage multiple database instances as needed
    - **trove-api** - provides a RESTful API that supports JSON and XML to provision and manage Trove instances
    - **trove-taskmanager** - manages lifecycle of instances and preforms operations on the database instance
    - **trove-guestagent** - a service that runs within the gues instance, responsible for managing and performing operations on the database itself. The gues agent listens for RPC messages through the message bus and performs the requested operation
- **OpenStack Ironic** - baremetal for OpenStack
    - aims to provision bare metal instances instead of virtual machines, forked from a bare metal driver
    - it is best thought of as a bare metal hypervisor API and a set of plugins which interact with the bare metal hypervisors
    - components:
        - hypervisor API
        - a conductor service, which does the bulk of the work. Functionality is exposed through the API. The Conductor and API services communicate via RPC.
        - various drivers that support heterogeneous hardware
        - a message queue (RabbitMQ, ZeroMQ, etc)
        - a database for storing resource information details such as state of the conductors, nodes, and drivers.
- **OpenStack Magnum** - multi-tenant Containers-as-a-Service combining the best of infrastructure software with the best of container software
    - created to make current container technology and tools work with OpenStack. Allows cloud operators to offer CaaS as a hosting service.
    - primarly focused on container infrastructure, while other services are used for container management
- **OpenStack Telemetry** - provides a single point of contact for billing systems, providing counters to establish customer billing across all current and future OpenStack components
    - **Aodh** - an alarm service. Enables the ability to trigger actions based on defined rules against sample or event data collected by Celiometer.
    - **Celiometer** - a data collection service that efficiently collects, normalizes, and transforms data produced by OpenStack services. The data collected is intended to be used to create different views and help solve various telemetry use cases. Aodh and Gnocchi are two examples of services extending Celiometer data.
    - **Gnocchi** - a time-series database and resource indexing service which enables users to capture OpenStack resources and the metrics associated with them. Using rolling agregation set by user-defined archival policies, its aim is to provide a scalable means of storing both short and long-term data and provide a statistical view based on the input data (i.e. Celiometer)
    - **Panko** - an event and metadata indexing service which enables users to capture the state information of OpenStack resources at a given time
- **OpenStack Sahara** - Elastic Map Reduce, a component to easily and rapidly provision Hadoop clusters
- **OpenStack Designate** - a multi-tenant REST API for DNS management
    - provides DNSaaS and is compatible with many backend technologies, including PowerDNS and BIND
    - was created to interface with existing DNS servers to manage DNS zones on a per-tenant basis and does not provide a DNS service