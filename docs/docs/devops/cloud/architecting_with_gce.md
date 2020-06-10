# Architecting with Google Compute Engine: Lecture Notes

## Course Intro
When you look at Google Cloud, you'll see that it's actually part of a much larger ecosystem. This ecosystem consists of open-source software, providers, partners, developers, third-party software, and other cloud providers. Google is actually a very strong supporter of open-source software.

Now Google Cloud consists of Chrome, Google Devices, Google Maps, Gmail, Google Analytics, G Suite, Google Search and the Google Cloud. Google Cloud itself is a computing solution platform that really encompasses three core features: infrastructure, platform, and software.


On a high level, Google Cloud consists of regions, points of presence or PoPs, a global private network.

Google Cloud's well-provisioned global network connects over 60 zones to over 130 points of presence through a global network of fiber optic cables. Google is continuously investing in this network, with new regions, points of presence, and subsea cable investments.

### Google Cloud is...
On top of this infrastructure, Google Cloud uses state-of-the-art software-defined networking and distributed systems technologies to host and deliver your services around the world. These technologies are represented by a suite of cloud-based products and services that is continuously expanding. Many of the products and services are represented by unique blue hexagonal logos.

Now, it's important to understand that there is usually more than one solution for a task or application in Google Cloud. To better understand this, let's look at a solution continuum.

### Solution continuum
Google Cloud spans from Infrastructure as a Service (or IaaS) to Software as a Service (or SaaS). You can really build applications on Google Cloud for the web or mobile that are global, autoscaling, and assistive, and that provide services where the infrastructure is completely invisible to the user. It is not just that Google has opened the infrastructure that powers applications like Search, Gmail, Google Maps, and G Suite. Google has opened all of the services that make these products possible and packaged them for your use.

Alternative solutions are possible. For example, you could start up your own VM in Google Compute Engine, install open source MySQL on it, and run it just like a MySQL database on your own computer in a data center.

Or you could use the Cloud SQL service, which provides a MySQL instance and handles operational work like backups and security patching for you, using the same services Google does to automate backups and patches.

You could even move to a noSQL database that is autoscaling and serverless so that growth no longer requires adding server instances or possibly changing the design to handle the new capacity.

This course focuses on the infrastructure. An IT infrastructure is like a "city infrastructure". The infrastructure is the basic underlying framework of fundamental facilities and systems such as transport, communications, power, water, fuel, and other essential services.

The people in the city are like "users", and the cars and bikes and building in the city are like "applications". Everything that goes into creating and supporting those applications for the users is the infrastructure.

### Google Cloud offers a range of compute services
Now, Google Cloud offers a range of compute services. The service that might be most familiar to newcomers is Compute Engine, which lets you run virtual machines on demand in the cloud. It's Google Cloud's Infrastructure-as-a-Service solution. It provides maximum flexibility for people who prefer to manage server instances themselves.

Google Kubernetes Engine lets you run containerized applications on a cloud environment that Google manages for you, under your administrative control. Think of containerization as a way to package code that's designed to be highly portable and to use resources very efficiently, and think of Kubernetes as a way to orchestrate code in containers.

App Engine is Google Cloud's fully managed Platform-as-a-Service framework. That means it's a way to run code in the cloud without having to worry about infrastructure. You just focus on your code, and let Google deal with all the provisioning and resource management.

Cloud Functions is a completely serverless execution environment, or Functions-as-a-service. It executes your code in response to events, whether those event occur once a day or many times per second. Google scales resources as required, but you only pay for the service while your code runs.

## Introduction to Google Cloud

### There are four ways to interact with Google Cloud
There are four ways to interact with Google Cloud, and we'll talk about each in turn.

There's the Cloud Console, Cloud Shell and the Cloud SDK, the APIs, and the Cloud Mobile App.

### Cloud Console, Cloud SDK and Cloud Shell
The Cloud Console provides a web-based graphical user interface that you access through console.cloud.google.com. For example, you can view your virtual machines and their details.

If you prefer to work in a terminal window, the Cloud SDK provides the gcloud command-line tool. For example, you can list your virtual machines and their details with the `gcloud compute instances list` command.

Google Cloud also provides Cloud Shell, which is a browser-based, interactive shell environment for Google Cloud that you can access from the Cloud Console. Cloud Shell is a temporary virtual machine with 5 GB of persistent disk storage that has the Cloud SDK pre-installed.

### API interfaces
In addition to the Cloud SDK, you can also use client libraries that enable you to easily create and manage resources. Google Cloud client libraries expose APIs for two main purposes:

- App APIs provide access to services, and they are optimized for supported languages, such as Node.js or Python
- Admin APIs offer functionality for resource management. For example, you can use admin APIs if you want to build your own automated tools.

### Cloud Mobile App
The Cloud Mobile App is another way to interact with Google Cloud. It allows you to manage Google Cloud services from your Android or iOS device. For example, you can start, stop, and SSH into Compute Engine instances and see logs from each instance. You can also set up customizable graphs showing key metrics such as CPU usage, network usage, requests per second, and server errors. The app even offers alerts and incident management and allows you to get up-to-date billing information for your projects and get billing alerts for projects that are going over budget.

### Which of the following tools allow you to interact with Google Cloud (select 2)?
- The Cloud Console which is a web-based, graphical user interface that you access through console.cloud.google.com
- Google Cloud SDK which is a command-line interface that can be installed locally or accessed through Cloud Shell

### What is the difference between the Cloud Console and Cloud Shell?
- Cloud Shell is a command-line tool, while the Cloud Console is a graphical user interface

## Virtual Networks
Google Cloud uses a software-defined network that is built on a global fiber infrastructure. This infrastructure makes Google Cloud one of the world's largest and fastest networks. Thinking about resources as services instead of as hardware will help you understand the options that are available, and their behavior.

This map represents Google Cloud. On a high level, Google Cloud consists of regions, points of presence or PoPs, a global private network, and services.

A region is a specific geographical location where you can run your resources. The number on each region represents the zones within that region. For example, in Iowa there is a region called us-central1 which has four zones: us-central1-a, us-central1-b, us-central1-c, and us-central1-d.

The PoPs are where Google's network is connected to the rest of the internet. Google Cloud can bring its traffic closer to its peers because it operates an extensive global network of interconnection points. This reduces costs and provides users with a better experience.

The network connects regions and PoPs and is composed of a global network of fiber optic cables with several submarine cable investments.

### VPC objects
With Google Cloud, you can provision your Google Cloud resources, connect them to each other, and isolate them from each other in a Virtual Private Cloud. You can also define fine-grained networking policies within Google Cloud, and between Google Cloud and on-premises or other public clouds. Essentially, VPC is a comprehensive set of Google-managed networking objects, which we will explore in detail throughout this module.

Let me give you a high-level overview of these objects:

- Projects are going to encompass every single service that you use, including networks
- Networks come in three different flavors: Default, auto mode, and custom mode
- Subnetworks allow you to divide or segregate your environment
- Regions and zones represent Google's data centers, and they provide continuous data protecion and high availability
- VPC provides IP addresses for internal and external use, along with granular IP address range selections
- as for virtual machines, in this module we will focus on configuring VM instances from a networking perspective

### Projects and networks
Projects are the key organizer of infrastructure resources in Google Cloud. A project associates objects and services with billing. Now, it's unique that projects actually contain entire networks. The default quota for each project is 5 networks, but you can simply request additional quota using the Cloud Console. These networks can be shared with other projects, or they can be peered with netwroks in other projects.

These networks do not have IP ranges, but are simply a construct of all of the individual IP addresses and services within that network. Google Cloud's networks are global, spanning all available regions across the world that we showed earlier. So, you can have one network that literally exists anywhere in the world - Asia, Europe, Americas - all simultaneously.
Inside a network, you can segregate your resources with regional subnetworks. We just mentioned that there are different types of networks: default, auto, and custom.

### 3 VPC network types
<table>
    <tr>
        <th>Default</th>
        <th>Auto Mode</th>
        <th>Custom mode</th>
    </tr>
    <tr>
        <td>Every project</td>
        <td>Default network</td>
        <td>No default subnets created</td>
    </tr>
    <tr>
        <td>One subnet per region</td>
        <td>One subnet per region</td>
        <td>Full control of IP ranges</td>
    </tr>
    <tr>
        <td>Default firewall rules</td>
        <td>Regional IP allocation</td>
        <td>Regional IP allocation</td>
    </tr>
    <tr>
        <td></td>
        <td>Fixed /20 subnetwork per region</td>
        <td>Expendable to any RFC 1918 size</td>
    </tr>
    <tr>
        <td></td>
        <td>Expandable up to /16</td>
        <td></td>
    </tr>
</table>

Every project is provided with a default VPC network with preset subnets and firewall rules. Specifically, a subnet is allocated for each region with non-overlapping CIDR blocks and firewall rules that allow infress traffic for ICMP, RDP, and SSH traffic from anywhere, as well as ingress traffic from within the default network network for all protocols and ports.

In an auto mode network, one subnet from each region is automatically created within it. The default network is actually an auto mode network. These automatically created subnets use a set of predefined IP ranges with a /20 mask that can be expanded to /16. All of these subnets fit within the 10.128.0.0/9 CIDR block. Therefore, as new Google Cloud regions become available, new subnets in those regions are automatically added to auto mode networks using an IP range from that block.

A custom mode network does not automatically create subnets. This type of network provides you with the complete control over its subnets and IP ranges. You decide which subnets to create, in regions you choose, and using IP ranges you specify within the RFC 1918 address space. These IP ranges cannot overlap between subnets of the same network.

Now, you can convert an auto mode network to a custom mode network to take advantage of the control that custom mode networks provide. However, this conversion is one way, meaning that custom mode networks cannot be changed to auto mode networks. So, carefully review the considerations for auto mode networks to help you decide which type of network meets your needs.

### Networks isolate systems
On this slide, we have an example of a project that contains 5 networks. All of these networks span multiple regions across the world.

Each network contains separate virtual machines: A, B, C, and D. Because VMs A and B are in the same network, network 1, they can communicate using their internal IP addresses, even though they are in different regions. Essentially, your virtual machines, even if they exist in different locations across the world, take advantage of Google's global fiber network. Those virtual machines appear as though they're sitting in the same rack when it comes to a network configuration protocol.

VMs C and D, however, are not in the same network. Therefore, by default, these VMs must communicate using their external IP addresses, even though they are in the same region. The traffic between VMs C and D isn't actually touching the public internet, but is going through the Google Edge routers. This has different billing and security ramifications.

### Google's VPC is global
Because VM instances within a VPC network can communicate privately on a global scale, a single VPN can securely connect your on-premises network to your Google Cloud network. Even though the two VM instances are in separate regions (us-west1 and us-east1), they leverage Google's private network to communicate between each other and to an on-premises network through a VPN gateway.
This reduces cost and network management complexity.

### Subnetworks cross zones
- VMs can be on the same subnet, but in different zones
- A single firewall rule can apply to both VMs

We mentioned that subnetworks work on a regional scale. Because a region contains several zones, subnetworks can cross zones.

This slide has a region, region 1, with two zones, zone A and B. Subnetworks can extend across these zones within the same region, such as, subnet-1. The subnet is simply and IP address range, and you can use IP addresses within that range. Notice that the first and second addresses in the range, .0 and .1, are reserved for the network and the subnet's gateway, respectively. This makes the first and second available addresses .2 and .3, which are assigned to the VM instances. The other reserved addresses in every subnet are the second-to-last address in the range and the last address, which is reserved as the "broadcast" address. To summarize, every subnet has four reserved IP addresses in its primary IP range.

Now, even though the two virtual machines in this example are in different zones, they can still communicate with each other using the same subnet IP address. This means that a single firewall rule can be applied to both VMs, even though they are in different zones.

### Expand subnets without re-creating instances
- cannot overlap with other subnets
- must be inside RFC 1918 address spaces
- can expand but not shrink
- auto mode can be expanded from /20 to /16
- avoid large subnets

Speaking of IP addresses of a subnet, Google Cloud VPCs let you increase the IP address space of any subnets without any workload shutdown or downtime. This diagram illustrates a network with subnets that have different subnet masks, allowing for more instances in some subnets than others. This gives you flexibility and growth options to meet your needs, but there are some things to remember:

- the new subnet must not overlap with other subnets in the same VPC network in any region
- also, the new subnet must stay inside the RFC 1918 address spaces
- the new network range must be larger than the original, which means the prefix length value must be a smaller number. In other words, you cannot undo an expansion.
- now, auto mode subnets start with a /20 IP range. They can be expanded to a /16 IP range, but no larger. Alternatively, you can convert the auto mode subnetwork to a custom mode subnetwork to increase the IP range further
- also, avoid creating large subnets. Overly large subnets are more likely to cause CIDR range collisions when using Multiple Network Interfaces and VPC Network Peering, or when configuring a VPN or other connections to an on-premises network. Therefore, do not scale your subnet beyond what you actually need.

### VMs can have internal and external IP addresses
#### Internal IP
- allocated from subnet range to VMs by DHCP
- DHCP lease is renewed every 24 hours
- VM name + IP is registered with network-scoped DNS

#### External IP
- assigned from pool (ephemeral)
- reserved (static)
- VM doesn't know external IP; it is mapped to the internal IP

In Google Cloud, each virtual machine can have two IP addresses assigned. One of them is an internal IP address, which is going to be assigned via DHCP internally. Every VM that starts up and any service that depends on virtual machines gets an internal IP address. Examples of sych services are App Engine and Google Kubernetes Engine.
When you create a VM in Google Cloud, its symbolic name is registered with an internal DNS service that translates the name to the internal IP address. DNS is scoped to the network, so it can translate web URLs and VM names of hosts in the same network, but it can't translate host names from VMs in a different network.

The other IP address is the external IP address but this one is optional. You can assign an external IP address, if your device or your machine is externally facing.
That external IP address can be assigned from a pool, making it ephemeral, or it can be assigned a reserved external IP address, making it static. If you reserve a static external IP address and do not assign it to a resource such as a VM instance or a forwarding rule, you are charged at a higher rate than for static and ephemeral external IP addresses that are in use.

### External IPs are mapped to internal IPs
Regardless of whether you use an ephemeral or static IP address, the external address is unknown to the OS of the VM. The external IP address is mapped to the VM's internal address transparently by VPC. We are illustrating this here by running ifconfig within a VM in Google Cloud, which only returns the internal IP address.

### DNS resolution for internal addresses
Each instance has a hostname that can be resolved to an internal IP address:

- the hostname is the same as the instance name
- FQDN is [hostname].[zone].c.[project-id].internal

Example: my-server.us-central1-a.c.guestbook-151617.internal

Name resolution is handled by internal DNS resolver:

- provided as part of Compute Engine (169.254.169.254)
- configured for use on instance via DHCP
- provides answer for internal and external addresses

Let's start with internal addresses.

Each instance has a hostname that can be resolved to an internal IP address. This hostname is the same as the instance name. There is also an internal fully qualified domain name, or FQDN, for an instance that uses the format shown on the slide. If you delete and recreate an instance, the internal IP address can change. This change can disrupt connections from other Compute Engine resources, which must obtain the new IP address before they can connect again. However, the DNS name always points to a specific instance, no matter what the internal IP address is.

Each instance has a metadata server that also acts as a DNS resolver for that instance. The metadata server handles all DNS queries for local network resources and routes all other queries to Google's public DNS servers for public name resolution. We previously mentioned that an instance is not aware of any external IP address assigned to it. Instead, the network stores a lookup table that matches external IP addresses with the internal IP addresses of the relevant instances.

- instances with external IP addresses can allow connections from hosts outside the project
    - users connect directly using external IP address
    - admins can also publish public DNS records pointing to the instance
        - public DNS records are not published automatically
- DNS records for external addresses can be published using existing DNS servers (outside of Google Cloud)
- DNS zones can be hosted using Cloud DNS

Now, let's look at external addresses.

Instance with external IP addresses can allow connections from hosts outside of the project. Users can do so directly using the external IP address. Public DNS records pointing to instances are not published automatically; however admins can publish these using existing DNS servers.

Domain name servers can be hosted on Google Cloud, using Cloud DNS. This is a managed service that is definately worth considering, so let's explore it in more detail.

### Host DNS zones using Cloud DNS
- Google's DNS service
- Translate domain names into IP address
- Low latency
- High availability (100% uptime SLA)
- Create and update millions of DNS records
- UI, command line, or API

Cloud DNS is a scalable, reliable, and managed authoritative Domain Name System, or DNS, service running on the same infrastructure as Google. Cloud DNS translates requests for domain names like google.com into IP addresses.

Cloud DNS uses Google's global network of Anycast name servers to serve your DNS zones from redundant locations around the world, providing lower latency and high availability for your users. High availability is very important because if you can't look up a domain name, the internet might as well be down. That's why Google Cloud offers a 100% uptime Service Level Agreement, or SLA, for domains configured in Cloud DNS.

Cloud DNS lets you create and update millions of DNS records without the burden of managing your own DNS servers and software. Instead, you use a simple user interface, command-line interface, or API.

### Assign a range of IP addresses as aliases to a VM's network interface using alias IP ranges
Another networking feature of Google Cloud is Alias IP Ranges.

Alias IP Ranges let you assign a range of internal IP addresses as an alias to a virtual machine's network interface. This is useful if you have multiple services running on a VM, and you want to assign a different IP address to each service.
In essence, you can configure multiple IP addresses, representing containers or applications hosted in a VM, without having to define a separate network interface. You just draw the alias IP range from the local subnet's primary or secondary CIDR ranges.

### A route is mapping of an IP range to a destination
Every network has:

- routes that let instances in a network send traffic directly to each other
- a default route that directs packets to destinations that are outside the network

Firewall rules must also allow the packet.

By default, every network has routes that let instances send traffic directly to each other, even across subnets. In addition, every network has a default route that directs packets to desinations that are outside the network. Although these routes cover most of your normal routing needs, you can also create special routes that override these routes.
Just creating a route does not ensure that your packets will be received by the specified next hop. Firewall rules must also allow the packet.
The default network has pre-configured firewall rules that allow all instances in the network to talk with each other. Manually created networks do not have such rules, so you must create them.

### Routes map traffic to destination networks
- apply to traffic egressing a VM
- forward traffic to most specific route
- are created when a subnet is created
- enable VMs on same network to communicate
- destination is in CIDR notation
- traffic is delivered only if it also matches a firewall rule

Routes match packets by destination IP address. However, no traffic will flow without also matching a firewall rule.
A route is created when a network is created, enabling traffic delivery from "anywhere". Also, a route is created when a subnet is created. This is what enables VMs on the same network to communicate.

### Instance routing tables
Each route in the Routes collection may apply to one or more instances. A route applies to an instance if the network and instance tags match. If the network matches and there are no instance tags specified, the route applies to all instances in that network. Compute Engine then uses the Routes collection to create individual read-only routing tables for each instance.

This diagram shows a massively scalable virtual router at the core of each network.
Every virtual machine instance in the network is directly connected to this router, and all packets leaving a virtual machine instance are first handled at this layer before they are forwarded to their next hop. The virtual network router selects the next hop for a packet by consulting the routing table for that instance.

### Firewall rules protect your VM instances from unapproved connections
- VPC network functions as a distributed firewall
- firewall rules are applied to the network as a whole
- connections are allowed or denied at the instance level
- firewall rules are stateful
- implied deny all ingress and allow all egress

Google Cloud firewall rules protect your virtual machine instances from unapproved connections, both inbound and outbound, known as ingress and egress, respectively.
Essentially, every VPC network functions as a distributed firewall.
Although firewall rules are applied to the network as a whole, connections are allowed or denied at the instance level. You can think of the firewall as existing not only between your instances and other networks, but between individual instances within the same network.

Google Cloud firewall rules are stateful. This means that if a connection is allowed between a source and a target or a target and a destination, all subsequent traffic in either direction will be allowed. In other words, firewall rules allow bidirectional communication once a session is established.
Also, if for some reason, all firewall rules in a network are deleted, there is still an implied "Deny all" ingress and an implied "Allow all" egress rule for the network.

### A firewall is composed of...
You can express your desired firewall configuration as a set of firewall rules. Conceptually, a firewall rule is composed of the following parameters:

- the **direction** of the rule. Inbound connections are matched against ingress rules only, and outbound connections are matched against egress rules only.
- the **source** of the connection for ingress packets, or the **destination** of the connection for egress packets
- the **protocol** and **port** of the connection, where any rule can be restricted to apply to specific protocols only or specific combinations of protocols and ports only
- the **action** of the rule, which is to allow or deny packets that match the direction, protocol, port and source or destination of the rule.
- the **priority** of the rule, which governs the order in which rules are evaluated. The first matching rule is applied.
- the **rule assignment**. By default, all rules are assigned to all instances, but you can assign certain rules to certain instances only.

### Google Cloud firewall use case: Egress
Conditions:

- destination CIDR ranges
- protocols
- ports

Actions:

- allow: permit the matching egress connection
- deny: block the matching egress connection

Egress firewall rules control outgoing connections originated inside your Google Cloud network. Egress **allow** rules allow outbound connections that match specific protocol, ports, and IP addresses. Egress **deny** rules prevent instances from initiating connections that match non-permittedc port, protocol, and IP range combinations.

For egress firewall rules, destinations to which a rule applies may be specified using IP CIDR ranges. Specifically, you can use destination ranges to protect from undesired connections initiated by a VM instance toward an external host, as shown on the left. You can also use destination ranges to prevent undesired connections from internal VM instances to a specific Google Cloud CIDR range. This is illustrated in the middle, where a VM in a specific subnet is shown attempting to connect inappropriately to another VM within the same network.

### Google Cloud firewall use case: ingress
Conditions:

- source CIDR ranges
- protocols
- ports

Actions:

- allow: permit the matching ingress connection
- deny: block the matching ingress connection

Ingress firewall rules protect against incoming connections to the instance from any source. Ingress **allow** rules allow specific protocol, ports, and IP addresses to connect in. The firewall prevents instances from receiving connections on non-permitted ports or protocols. Rules can be restricted to only affect particular sources.
Source CIDR ranges can be used to protect an instance from undesired connections coming either from external networks or from Google Cloud IP ranges.

This diagram illustrates a VM receiving a connection from an external address, and another VM receiving a connection from a VM within the same network. You can control ingress connections from a VM instance by constructing inbound connection conditions using source CIDR ranges, protocols, or ports.

### Network pricing (subject to change)
<table>
    <tr>
        <th>Traffic type</th>
        <th>Price</th>
    </tr>
    <tr>
        <td>Ingress</td>
        <td>No charge</td>
    </tr>
    <tr>
        <td>Egress to the same zone (Internal IP address)</td>
        <td>No charge</td>
    </tr>
    <tr>
        <td>Egress to Google products (YouTube, Maps, Drive)</td>
        <td>No charge</td>
    </tr>
    <tr>
        <td>Egress to a different Google Cloud service (within the same region; exceptions)</td>
        <td>No charge</td>
    </tr>
    <tr>
        <td>Egress between zones in the same region (per GB)</td>
        <td>$0.01</td>
    </tr>
    <tr>
        <td>Egress to the same zone (external IP address, per GB)</td>
        <td>$0.01</td>
    </tr>
    <tr>
        <td>Egress between regions within the US and Canada (per GB)</td>
        <td>$0.01</td>
    </tr>
    <tr>
        <td>Egress between regions, not including traffic between US regions</td>
        <td>Varies by region</td>
    </tr>
</table>

This table is from the Compute Engine documentation, and it lists the price of each traffic type.

First of all, ingress or traffic coming into Google Cloud's network is not charged, unless there is a resource such as a load balancer that is processing ingress traffic. Responses to requests count as egress and are charged.

The rest of this table lists egress or traffic leaving a virtual machine. Egress traffic to the same zone is not charged, as long as that egress is through the internal IP address of an instance. Also, egress traffic to Google products, like YouTube, Maps, Drive, or traffic to a different Google Cloud service within the same region is not charged for.
However, there is a charge for egress between zones in the same region, egress within a zone if the traffic is through the external IP address of an instance, and egress between regions.

As for the difference in egress traffic to the same zone, Compute Engine cannot determine the zone of a virtual machine through the external IP address. Therefore, this traffic is treated like egress between zones in the same region.

### External IP address pricing (us-central1)
<table>
    <tr>
        <th>Type</th>
        <th>Price/Hour (USD)</th>
    </tr>
    <tr>
        <td>Static IP address (assigned but unused)</td>
        <td>$0.010</td>
    </tr>
    <tr>
        <td>Static and ephemeral IP addresses in use on <b>standard</b> VM instances</td>
        <td>$0.004</td>
    </tr>
    <tr>
        <td>Static and ephemeral IP addresses in use on <b>preemptible</b> VM instances</td>
        <td>$0.002</td>
    </tr>
    <tr>
        <td>Static and ephemeral IP addresses attached to forwarding rules</td>
        <td>No charge</td>
    </tr>
</table>

Now, you are charged for static and ephemeral external IP addresses. This table represents the external IP pricing for us-central1 as of this recording.

You can see that if you reserve a static external IP address and do not assign it to a resource such as a VM instance or a forwarding rule, you are charged at a higher rate than for static and ephemeral external IP addresses that are in use. Also, external IP addresses on preemptible VMs have a lower charge than for standard VM instances.

### Estimate costs with the Google Cloud Pricing Calculator
We recommend using the Google Cloud pricing calculator to estimate the cost of a collection of resources, because each Google Cloud service has its own pricing model. The pricing calculator is a web-based tool that you use to specify the expected consumption of certain services and resources, and it then provides you with an estimated cost.

For example, you can specify a specific instance type in a specific region along with 100-GB of monthly egress traffic to Americas and EMEA. The pricing calculator then returns the total estimated cost. You can adjust the currency and time frame to meet your needs, and when you finish, you can email the estimate or save it to a specific URL for future reference.

### Increased availability with multiple zones
If your application needs increased availability, you can place two virtual machines into multiple zones, but within the same subnetwork, as shown on this slide. Using a single subnetwork allows you to create a firewall rule against the subnetwork 10.2.0.0/16.
Therefore, by allocating VMs on a single subnet to separate zones, you get improved availability without additional security complexity. A regional managed instance group contains instances from multiple zones across the same region, which provides increased availability.

### Globalization with multiple regions
Next, let's look at globalization.
In the previous design we placed resources in different zones in a single region, which provides isolation from many types of infrastructure, hardware, and software failures. Putting resources in different regions as shown on this slide provides an even higher degree of failure independence. This allows you to design robust systems with resources spread across different failure domains.
When using a global load balancer, like the HTTP load balancer, you can route traffic to the region that is closest to the user. This can result in better latency for users and lower network traffic costs for your project.

### Cloud NAT provides internet access to private instances
Now, as a general security best practice, we recommend assigning only internal IP addresses to your VM instances wherever possible.

Cloud NAT is Google's managed network address translation service. It lets you provision your application instances without public IP addresses, while also allowing them to access the internet in a controlled and efficient manner. This means your private instances can access the internet for updates, patching, configuration management, and more.

In this diagram, Cloud NAT enables two private instances to access an update server on the internet, which is referred to as outbound NAT. However, Cloud NAT does not implement inbound NAT. In other words, hosts outside your VPC network cannot directly access any of the private instances behind the Cloud NAT gateway. This helps you keep your VPC networks isolated and secure.

### Private Google Access to Google APIs and services
Similarly, you should enable Private Google Access to allow VM instances that only have internal IP addresses to reach the external IP addresses of Google APIs and services. For example, if your private VM instance needs to access a Cloud Storage bucket, you need to enable Private Google Access.

You enable Private Google Access on a subnet-by-subnet basis. As you can see in this diagram, subnet-a has Private Google Access enabled, and subnet-b has it disabled. This allows VM A1 to access Google APIs and services, even though it has no external IP address.

Private Google Access has no effect on instances that have external IP addresses. That's why VMs A2 and B2 can access Google APIs and services. The only VM that can't access those APIs and services is VM B1. This VM has no public IP address, and it is in a subnet where Google Private Access is disabled.

### In Google Cloud, what is the minimum number of IP addresses that a VM instance needs?
One: Only and internal IP address

### What are the three types of networks offered in the Google Cloud?
Default network, auto-mode network, and custom-mode network.

The three network types offered by Google Cloud are: default, auto and custom. Each project starts with a default network. The auto-type network uses the same subnet IP ranges as the default-type, with a network name other than default. A custom-type allows you to specify the IP ranges of subnets.

### What is one benefit of applying firewall rules by tag rather than by address?
When a VM is created with a matching tag, the firewall rules apply irrespective of the IP address it is assigned.

When a VM is created, the ephemeral external IP address is assigned from a pool. There is no way to predict which address will be assigned, so there is no way to write a rule that will match that VM's IP address before it is assigned. Tags allow a symbolic assignment that does not depend on order in the IP addresses. It makes for simpler, more general, and easier-to-maintain firewall rules.

### Review - Virtual Networks
In this module, we gave you an overview of Google's Virtual Private Cloud. We looked at the different objects within VPC, like projects, networks, IP addresses, routes, and firewall rules. We also provided a brief overview of how your network design choices can affect billing.