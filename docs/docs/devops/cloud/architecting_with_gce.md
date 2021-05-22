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

## Virtual Machines
VMs are the most common infrastructure components, and in Google Cloud, they're provided by Compute Engine. A VM is similar, but not identical, to a hardware computer. VMs consist of a virtual CPU, some amount of memory, disk storage, and an IP address. Compute Engine is Google Cloud's service to create VMs; it is very flexible and offers many options, including some that can't exist in physical hardware. For example, a micro VM shares a CPU with other virtual machines, so you can get VM with less capacity at a lower cost. Another example of a function that can't exist in hardware is that some VMs offer vurst capability, meaning that the virtual CPU will run above its rated capacity for a brief period, using the available shared physical CPU. The main VM options are CPUs, memory, disks, and networking.

### Google Cloud compute and processing options
<table>
    <tr>
        <th></th>
        <th>Compute Engine</th>
        <th>Kubernetes Engine</th>
        <th>App Engine Standard</th>
        <th>App Engine Flexible</th>
        <th>Cloud Functions</th>
    </tr>
    <tr>
        <td>Language support</td>
        <td>Any</td>
        <td>Any</td>
        <td>Python, Node.js, Go, Java, PHP</td>
        <td>Python, Node.js, Go, Java, PHP, Ruby, .NET, Custom Runtimes</td>
        <td>Python, Node.js, Go</td>
    </tr>
    <tr>
        <td>Usage model</td>
        <td>IaaS</td>
        <td>IaaS, PaaS</td>
        <td>PaaS</td>
        <td>PaaS</td>
        <td>Microservices Architecture</td>
    </tr>
    <tr>
        <td>Scaling</td>
        <td>Server Autoscaling</td>
        <td>Cluster</td>
        <td>Autoscaling managed servers</td>
        <td>Autoscaling managed servers</td>
        <td>Serverless</td>
    </tr>
    <tr>
        <td>Primary use case</td>
        <td>General Workloads</td>
        <td>Container workloads</td>
        <td>Scalable web applications, Mobile backend applications</td>
        <td>Scalable web applications, Mobile backend applications</td>
        <td>Lightweight Event Actions</td>
    </tr>
</table>

As mentioned in the introduction to the course, there is a spectrum of different options in Google Cloud for compute and processing. We will focus on the traditional virtual machine instances.
Now the difference is, Compute Engine gives you the utmost in flexibility: run whatever language you want - it's your virtual machine. This is purely and infrastructure as a service or IaaS model.
You have a VM and an operating system, and you can choose how to manage it and how to handle aspects, such as autoscaling, where you'll configure the rules about adding more virtual machines in specific situations. Autoscaling will be covered later in the course.
The primary work case of Compute Engine is any general workload, especially an enterprise application that was designed to run on a server infrastructure. This makes Compute Engine very portable and easy to run in the cloud. Other services, like Google Kubernetes Engine, which consists of containerized workloads, may not be as easily transferable as what you're used to from on-premises.

### Compute Engine
Infrastructure as a Service (IaaS)

Predefined or custom machine types:

- vCPUs (cores) and memory (RAM)
- persistent disks: HDD, SSD, and Local SSD
- networking
- Linux or Windows

So what is Compute Engine? At its heart, it's a physical server that you're used to, running inside the Google Cloud environment, with a number of different configurations.
Both predefined and custom machine types allows you to choose how much memory and how much CPU you want. You choose the type of disk you want, whether you want to just use standard hard drives, SSDs, local SSDs, or a mix. You can even configure the networking interfaces and run a combination of Linux and Windows machines.

### Compute
Several machine types

- network throughput scales 2 Gbps per vCPU (small exceptions)
- theoretical max of 32 Gbps with 16 vCPU or 100 Gbps with T4 or V100 GPUs

A vCPU is equal to 1 hardware hyper-thread.

Let's start by looking at the compute options.
Compute Engine provides several different machine types. If those machines don't meet your needs, you can also customize your own machine.
Your choice of CPU will affect your network throughput. Specifically, your network will scale at 2 Gbits per second for each CPU core, except for instances with 2 or 4 CPUs which receive up to 10 Gbps per second of bandwidth.

As of this recording there is a theoretical maximum throughput of 32 Gbits per second for an instance with 16 or more CPUs and a 100 Gbits per second maximum throughput for specific instances that have T4 or V100 GPUs attached.

When you're migrating from an on-premises setup, you're used to physical cores, which have hyperthreading. On Compute Engine, each virtual CPU (or vCPU) is implemented as a single hardware hyper-thread on one of the available CPU Platforms.

### Storage
Disks

- standard, SSD, or Local SSD
- standard and SSD PDs scale in performance for each GB of space allocated

Resize disks or migrate instances with no downtime

After you pick your compute options, you want to choose your disk. You have three options: Standard, SSD, or local SSD. So basically, do you want the standard spinning hard drives (HDDs), or flash memory solid-state drives (SSDs)? Both of these options provide the same amount of capacity in terms of disk size when choosing a persistent disk. Therefore, the question really is about performance versus cost, because there's a different pricing structure.
Basically, SSDs are designed to give you a higher number of IOPS per dollar versus standard disks, which will give you a higher amount of capacity for your dollar.
Local SSDs have even higher throughput and lower latency than SSD persistent disks, because they are attached to the physical hardware. However, the data that you store on local SSDs persists only until you stop or delete the instance. Typically, a local SSD is used as a swap disk, just like you would do if you want to create a ramdisk, but if you need more capacity, you can store those on a local SSD. You can create instances with up to eight separate 375-GB local SSD partitions for a total of 3 TB of local SSD space for each instance.
Standard and non-local SSD disks can be sized up to 257 TB for each instance. The performance of these disks scales with each GB of space allocated.

### Networking
Robust networking features

- default, custom networks
- inbound/outbound firewall rules
    - IP based
    - instance/group tags
- regional HTTPS load balancing
- network load balancing
    - does not require pre-warming
- global and multi-regional subnetworks

You'll also notice that you can do regional HTTPS load balancing and network load balancing. This doesn't require any pre-warming because a load balancer isn't a hardware device that needs to analyze your traffic. A load balancer is essentially a set of traffic engineering rules that are coming into the Google network, and VPC is applying your rules destined for your IP address subnet range.

### VM access
Linux: SSH

- SSH from Cloud Console or CloudShell via Cloud SDK
- SSH from computer or third-party client and generate key pair
- requires firewall rule to allow tcp:22

Windows: RDP
- RDP clients
- powershell terminal
- requires setting the windows password
- requires firewall rule to allow tcp:3389

For accessing a VM, the creator of an instance has full root privileges on that instance.

On a Linux instance, the creator has SSH capability and can use the Cloud Console to grant SSH capability to other users.

On a Windows instance, the creator can use the Cloud Console to generate a username and password. After that, anyone who knows the username, and password can connect to the instance using a Remote Desktop Protocol, or RDP, client.

### VM lifecycle
The lifecycle of VM is represented by different statuses. We will cover this lifecycle on a high level, but we recommend returning to this diagram as a reference.

When you define all the properties of an instance and click Create, the instance enters the provisioning state. Here the resources such as CPU, memory, and disks are being reserved for the instance, but the instance itself isn't running yet. Next, the instance moves to the staging state where resources have been acquired and the instance is prepared for launch. Specifically, in this state Compute Engine is adding IP addresses, booting up the system image, and booting up the system.

After the instance starts running, it will go through pre-configured startup scripts and enable SSH or RDP access. Now, you can do several things while your instance is running. For example, you can live migrate your virtual machine to another host in the same zone instead of requiring your instance to be rebooted. This allows Google Cloud to perform maintenance that is integral to keeping the infrastructure protected and reliable, without interrupting any of your VMs. While your instance is running, you can also move your VM to a different zone, take a snapshot of the VM's persistent disk, export the system image, or reconfigure metadata. 

Some actions require you to stop your virtual machine; for example, if you want to upgrade your machine by adding more CPU. When the instance enters this state, it will go through pre-configured shutdown scripts and end in the terminated state. From this state, you can choose to either restart the instance, which would bring it back to its provisioning state, or delete it.

You also have the option to reset a VM, which is similar to pressing the reset button on your computer. This action wipes the memory contents of the machine and resets the virtual machine to its initial state. The instance remains in the running state through the reset.

### Changing VM state from running
There are different ways you can change a VM state from running. Some methods involve the Cloud Console and the gcloud command, while others are performed from the OS, such as for reboot and shutdown.
It's important to know that if you are restarting, rebooting, stopping, or even deleting an instance, the shutdown process will take about 90 sec. For a preemptible VM, if the instance does not stop after 30 seconds, Compute Engine sends an ACPI G3 Mechanical Off signal to the operating system. Remember that when writing shutdown scripts for preemptible VMs.

### Availability policy: Automatic changes
Called "scheduling options" in SDK/API

#### Automatic restart
- automatic VM restart due to crash or maintenance event
    - not preemptiona or a user-initiated terminate

#### On host maintenance
- determines whether host is live-migrated or terminated due to maintenance event. Live migration is the default.

#### Live migration
- during maintenance event, VM is migrated to different hardware without interruption
- metadata indicates occurrence of live migration

As we mentioned previously, Compute Engine can live migrate your virtual machines to another host due to maintenance event to prevent your applications from experiencing disruptions. A VM's availability policy determines how the instance behaves in such an event.
The default maintenance behavior for instances is to live migrate, but you can change the behavior to terminate your instance during maintenance events instead. If your VM is terminated due to a crash or other maintenance event, your instance automatically restarts by default, but this can also be changed.
These availability policies can be configured both during the instance creation and while an instance is running by configuring the Automatic restart and On host maintenance options.

### Stopped (Terminated VM)
No charge for stopped VM

- charged for attached disks and IPs

Actions

- change the machine type
- add or remove attached disks; change auto-delete settings
- modify instance tags
- modify custom VM or project-wide metadata
- remove or set a new static IP
- modify VM availability policy
- can't change the image of a stopped VM

When a VM is terminated, you do not pay for memory and CPU resources. However, you are charged for any attached disks and reserved IP addresses. In the terminated state, you can perform any of the actions listed here, such as changing the machine type, but you cannot change the image of a stopped VM.
Also, not all of the actions listed here require you to stop a virtual machine. For example, VM availability policies can be changed while the VM is running, as discussed previously.

### Creating a VM
You have three options for creating and configuring a VM. You can use the Cloud Console as you did in the previous lab, the Cloud Shell command line, or the RESTful API. If you'd like to automate and process very complex configurations, you might want to programmatically configure these through the RESTful API by defining all the different options for your environment.
If you plan on using the command line or RESTful API, we recommend that you first configure the instance through the Cloud Console and then ask Compute Engine for the equivalent REST request or command line. This way you avoid any typos and get dropdown lists of all the available CPU and memory options.

### Machine types
A machine type specifies a particular collection of virtualized hardware resources available to a VM instance, including the system memory size, vCPU count, and maximum persistent disk capability. Google Cloud offers several machine types that can be grouped into 2 categories:

- predefined machine types: these have a fixed collection of resources, are managed by Compute Engine and are available in multiple different classes. Each class has a predefined ratio of GB of memory per vCPU. These are the:
    - standard machine types
    - high-memory machine types
    - high-cpu machine types
    - memory-optimized machine types
    - compute-optimized machine types
    - shared-core machine types
- custom machine types: these let you specify the number of vCPUs and the amount of memory for your instance

Let's explore each of these machine types, but remember that these machine types and their available options can change.

### Standard machine types
Standard machine types are suitable for tasks that have a balance of CPU and memory needs. Standard machine types have 3.75 GB of memory per vCPU. The vCPU configurations come in different intervals from 1 vCPU all the way to 96 vCPUs. Each of these machines supports a maximum of 128 persistent disks with a total persistent disk size of 257 TB, which is also the case for the high-memory, high-cpu, memory-optimized, and compute-optimized machine types

### High-memory machine types
High-memory machine types are ideal for tasks that require more memory relative to vCPUs. High-memory machine types have 6.50 GB of system memory per vCPU. Similarly to the standard machine types, the vCPU configurations come in different intervals from 2 vCPUs all the way to 96 vCPUs, as shown on this table.

### High-CPU machine types
High-CPU machine types are ideal for tasks that require more vCPUs relative to memory. High-CPU machine types have 0.90 GB of memory per vCPU.

### Memory-optimized machine types
Memory-optimized machine types are ideal for tasks that require intensive use of memory, with higher memory to vCPU ratios than high-memory machine types. These machine types are perfectly suited for in-memory databases and in-memory analytics, such as SAP HANA and business warehousing workloads, genomics analysis, and SQL analysis services. Memory-optimized machine types have more than 14 GB of memory per vCPU.

These machines come in 4 configurations as shown in this table, with only the m1-megamem-96 currently supporting a local SSD.

### Compute-optimized machine types
Compute-optimized machine types are ideal for compute-intensive workloads. These machine types offer the highest performance per core on Compute Engine. Built on the latest generation Intel Scalable Processors (the Cascade Lake), C2 machine types offer up to 3.8 Ghz sustained all-core turbo and provide full transparency into the architecture of the underlying server platforms, enabling advanced performance tuning. C2 machine types offer much more computing power, run on a newer platform, and are generally more robust for compute-intensive workloads than the N1 high-CPU machine types.

### Shared-core machine types
Shared-core machine types provide one vCPU that is allowed to run for a portion of the time on a single hardware hyper-thread on the host CPU running your instance. Shared-core instances can be more cost-effective for running small, non-resource-intensive applications than other machine types. There are only two shared-core machine types to choose from:

- f1-micro
- g1-small

f1-micro machine types offer bursting capabilities that allow instances to use additional physical CPU for short periods of time. Bursting happens automatically when your instance requires more physical CPU than originally allocated. During these spikes, your instance will opportunistically take advantage of available physical CPU in bursts. Note that bursts are not permament and are only possible periodically.

### Creating custom machine types
When to select custom:

- requirements fit between the predefined types
- need more memory or more CPU

Customize the amount of memory and vCPU for your machine:

- either 1 vCPU or even number of vCPU
- 0.9 GB per vCPU, up to 6.5 GB per vCPU (default)
- total memory must be multiple of 256 MB

If none of the predefined machine types match your needs, you can independently specify the number of vCPUs and the amount of memory for your instance. Custom machine types are ideal for the following scenarios:

- when you have workloads that are not a good fit for the predefined machine types that are available to you
- or when you have workloads that require more processing power or more memory, but don't need all of the upgrades that are provided by the next larger predefined machine type.

It costs slightly more to use a custom machine type than an equivalent predefined machine type, and there are still limitations in the amount of memory and vCPUs you can select:

- only machine types with 1vCPU or an even number of vCPUs can be created
- memory must be between 0.9 GB and 6.5 GB per vCPU (by default)
- the total memory of the instance must be multiple of 256 MB

By default, a custom machine can have up to 6.5 GB of memory per vCPU. However, this might not be enough memory for your workload. At an additional cost, you can get more memory per vCPU beyond the 6.5 GB limit. This is referred to as extended memory.

### Choosing region and zone
The first thing you want to consider when choosing a region and zone is the geographical location in which you want to run your resources. 

Each zone supports a combination of Ivy Bridge, Sandy Bridge, Haswell, Broadwell, and Skylake platforms. When you create an instance in the zone, your instance will use the default processor supported in that zone. For example, if you create an instance in the us-central1-a zone, your instance will use a Sandy Bridge processor.

### Pricing
- per-second billing, with minimum of 1 minute
    - vCPUs, GPUs, and GB of memory
- resource-based pricing
    - each vCPU and each GB of memory is billed separately
- discounts
    - sustained use
    - commited use
    - preemptible VM instances
- recommendation engine
    - notifies you of underutilized instances
- free usage limits

Google Cloud offers a variety of different options to keep the prices low for Compute Engine resources:

All vCPUs, GPUs, and GB of memory are charged a minimum of 1 minute. For example, if you run your virtual machine for 30 seconds, you will be billed for 1 minute of usage. After 1 minute, instances are charged in 1-second increments.

Compute Engine uses a resource-based pricing model, where each vCPU and each GB of memory on Compute Engine is billed separately, rather than as part of a single machine type. You still creeate iknstances using predefined machine types, but your bill reports them as individual vCPUs and memory used.

There are several discounts available but the discount types cannot be combined:

- resource-based pricing allows Compute Engine to apply sustained use discounts to all of your predefined machine type usage in a region collectively rather than to individual machine types
- if your workload is stable and predictable, you can purchase a specific amount of vCPUs and memory for a discount off of normal prices in return for committing to a usage term of 1 year or 3 years. The discount is up to 57% for most machine types or custom machine types. The discount is up to 70% for memory-optimized machine types.
- a preemptible VM is an instance that you can create and run at a much lower price than normal instances. However, Compute Engine might terminate (or preempt) these instances if it requires access to those resources for other tasks. Preemptible instances are excess Compute Engine capacity so their availability varies with usage.

The ability to customize the amount of memory and CPU through custom machine types allows for further pricing customization. Speaking of sizing your machine, Compute Engine provides VM sizing recommendations to help you optimize the resource use of your virtual machine instances. When you create a new instance, recommendations for the new instance will appear 24 hours after the instance has been created.

### Sustained use discounts
Sustained use discounts are automatic discounts that you get for running specific Compute Engine resources (vCPUs, memory, GPU devices) for a significant portion of the billing month. For example, when you run one of these resources for more than 25% of the month. Compute Engine automatically gives you a discount for every incremental minute you use for that instance. The discount increases with usage, and you can get up to a 30% net discount for instances that run the entire month.

This table shown on the slide describes the discount you get at each usage level of a VM instance. To take advantage of the full 30% discount, create your VM instances on the first day of the month, because discounts reset at the beginning of each month.

The graph on this slide demonstrates how your effective discount increases with use. For example, if you use a virtual machine for 50% of the month, you get an effective discount of 20%. If you use it for 100% of the month, you get an effective discount of 30%.

Compute Engine calculates sustained use discounts based on vCPU and memory usage across each region and separately for each of the following categories:

- predefined machine types
- custom machine type

### Sustained use discounts (example)
Let's go through an example where you have two instances that are in the same region but have different machine types and run at different times of the month. Compute Engine breaks down the number of vCPUs and amount of memory used across all instances that use predefined machine types and combines the resources to qualify for the largest sustained usage discounts possible. As shown on this slide, you run the following two instances in the us-central1 region during a month:

- for the first half of the month, you run an n1-standard-4 instance with 4 vCPUs and 15 GB of memory
- for the second half of the month, you run a larger n1-standard-16 instance with 16 vCPUs and 60 GB of memory

In this scenario, Compute Engine reorganizes these machine types into individual vCPUs and memory resources and combines their usage to create the following resources, as shown on the bottom:

- 4 vCPUs and 15 GB of memory for a full month
- 12 vCPUs and 45 GB of memory for half of the month

### Preemptible
- lower price for interrupted service (up to 80%)
- VM might be terminated at any time
    - no charge if terminated in the first 10 minutes
    - 24 hours max
    - 30-second terminate warning, but not guaranteed
        - time for a shutdown script
- no live migrate: no auto restart
- you can request that CPU quota for a region be split between regular and preemption
    - default: preemptible VMs count against region CPU quota

As we mentioned earlier, a preemptible VM is an instance that you can create and run at a much lower price than normal instances. See whether you can make your application function completely on preemptible VMs, because an 80-percent discount is a significant investment in your application.

Now, just to reiterate, these VMs might be preempted at any time, and there is no charge if that happens within the first 10 minutes. Also, preemptible VMs are only going to live for up to 24 hours, and you only get a 30-second notification before the machine is preempted. It's also worth noting that there are no live migrations nor automatic restarts in preemptible VMs, but something that we will highlight is that you can actually create monitoring and load balancers that can start up new preemptible VMs in case of a failure. In other words, there are external ways to keep restarting preemptible VMs if you need to.

One major use case for preemptible VMs is running a batch processing job. If some of those instances terminate during processing, the job slows but does not completely stop. Therefore, preemptible instances complete your batch processing tasks without placing additional workload on your existing instances, and without requiring you to pay full price for additional normal instances.

### Sole-tenant nodes physically isolate workloads
If you have workloads that require physical isolation from other workloads or virtual machines in order to meet compliance requirements, you want to consider sole-tenant nodes.

A sole-tenant node is a physical Compute Engine server that is dedicated to hosting VM instances only for your specific project. Use sole-tenant nodes to keep your instances physically separated from instances in other projects, or to group your instances together on the same host hardware, for example if you have a payment processing workload that needs to be isolated to meet compliance requirements.

The diagram on the left shows a normal host with multiple VM instances from multiple customers. A sole tenant node as shown on the right also has multiple VM instances, but they all belong to the same project. Currently, the only available node type can accommodate VM instances up to 96 vCPUs and 624 GB of memory. You can also fill the node with multiple smaller VM instances of various sizes, including custom machine types and instances with extended memory. Also, if you have existing operating system licenses, you can bring them to Compute Engine using sole-tenant nodes while minimizing physical core usage with the in-place restart feature.

### Shielded VMs offer verifiable integrity
- secure boot
- virtual trusted platform module (vTPM)
- integrity monitoring

Another compute option is to create shielded VMs. Shielded VMs offer verifiable integrity of your VM instances, so you can be confident that your instances haven't been compromised by boot- or kernel-level malware or rootkits. Shielded VM's verifiable integrity is achieved through the use of Secure Boot, virtual trusted platform module or vTPM-enabled Measured Boot, and integrity monitoring.

Shielded VMs is the first offering in the Shielded Cloud initiative. The Shielded Cloud initiative is meant to provide an even more secure foundation for all of Google Cloud by providing verifiable integrity and offering features, like vTPM shielding or sealing, that help prevent data exfiltration.

In order to use these shielded VM features, you need to select a shielded image.

### What's an image
When creating a virtual image, you can choose the boot disk image. This image includes the boot loader, the operating system, the file system structure, any pre-configured software, and any other customizations.

### Images
- public base images
    - Google, third-party vendors, and community: Premium images (p)
    - Linux
        - CentOS, CoreOS, Debian, RHEL(p), Ubuntu, openSUSE, and FreeBSD
    - Windows
        - Windows Server 2019(p), 2016(p), 2012-r2(p)
        - SQL Server pre-installed on Windows(p)
- custom images
    - create new image from VM: pre-configured and installed SW
    - import from on-prem, workstation, or another cloud
    - management features: image sharing, image family, deprecation

You can select either a public or custom image.
As you saw in the previous lab, you can choose from both Linux and Windows images. Some of these images are premium images, as indicated in parentheses with a p. These images will have per-second charges after a 1-minute minimum, with the exception of SQL Server images, which are charged per minute after a 10-minute minimum. Premium image prices vary with the machine type. However, these prices are global and do not vary by region or zone.

You can also use custom images. For example, you can create and use a custom image by pre-installing software that's been authorized for your particular organization.
You also have the option of importing images from your own premises or workstation, or from another cloud provider. This is a no-cost service that is as simple as installing an agent, and we highly recommend that you look at it. You can also share custom images with anybody in your project or among other projects, too.

### Boot disk
- VM comes with a single root persistent disk
- image is loaded onto root disk during first boot:
    - bootable: you can attach to a VM and boot from it
    - durable: can survive VM terminate
- some OS images are customized for Compute Engine
- can survive VM deletion if "Delete boot disk when instance is deleted" is disabled

Every single VM comes with a single root persistent disk, because you're choosing a base image to have that loaded on.
This image is bootable in that you can attach it to a VM and boot from it, and it is durable in that it can survive if the VM terminates. To have a boot disk survive a VM deletion, you need to disable the "Delete boot disk when instance is deleted" option in the instance's properties.
As we discussed earlier, there are different types of disks. Let's explore these in more detail.

### Persistent disks
Network storage appearing as block device

- attached to a VM through the network interface
- durable storage: can survive VM termination
- bootable: you can attach to a VM and boot from it
- snapshots: incremental backups
- performance: scales with size

Features

- HDD (magnetic) or SSD (faster, solid-state) options
- disk resizing: even running and attached
- can be attached in read-only mode to multiple VMs
- encryption keys:
    - Google-managed
    - Customer-managed
    - Customer-supplied

The first disk that we create is what we call a persistent disk. That means it's going to be attached to the VM through the network interface. Even though it's persistent, it's not physically attached to the machine. This separation of disk and compute allows the disk to survive if the VM terminates. You can also perform snapshots of these disks, which are incremental backups that we'll discuss later.
The choice between HDD and SSD disks comes down to cost and performance. 

Another cool feature of persistent disks is that you can dynamically resize them, even while they are running and attached to a VM. 
You can also attach a disk in read-only mode to multiple VMs. This allows you to share static data between multiple instances, which is cheaper than replicating your data to unique disks for individual instances.

By default, Compute Engine encrypts all data at rest. Google Cloud handles and manages this encryption for your without any additional actions on your part. However, if you wanted to control and manage this encryption yourself, you can either use Cloud Key Management Service to create and manage key encryption keys (which is known as customer-managed encryption keys) or create and manage your own encryption keys (known as customer-supplied encryption keys).

### Local SSD disks are physically attached to a VM
- more IOPS, lower latency, and higher throughput than persistent disk
- 375-GB disk up to eight, total of 3 TB
- data survives a reset, but not a VM stop or terminate
- VM-specific: cannot be reattached to a different VM

Now, local SSDs are different from persistent disks in that they are physically attached to the virtual machine. Therefore, these disks are ephemeral but provide very high IOPS.

Currently, you can attach up to 8 disks with 375 GB each, resulting in a total of 3 TB.
Data on these disks will survive a reset but no a VM stop or terminate, because these disks can't be reattached to a different VM.

### RAM disk
- tmpfs
- faster than local disk, slower than memory
    - use when your application expects a file system structure and cannot directly store its data in memory
    - fast scratch disk, or fast cache
- very volatile; erase on stop or restart
- may need a larger machine type if RAM was sized for the application
- consider using a persistent disk to back up RAM disk data

You also have the option of using a RAM disk.
You can simply use tmpfs if you want to store data in memory. This will be the fastest type of performance available if you need small data structures. We recommend a high-memory virtual machine if you need to take advantage of such features, along with a persistent disk to back up the RAM disk data.

### Summary of disk options
<table>
    <tr>
        <th></th>
        <th>Persistent disk HDD</th>
        <th>Persistent disk SSD</th>
        <th>Local SSD disk</th>
        <th>RAM disk</th>
    </tr>
    <tr>
        <th>Data redundancy</th>
        <td>Yes</td>
        <td>Yes</td>
        <td>No</td>
        <td>No</td>
    </tr>
    <tr>
        <th>Encryption at rest</th>
        <td>Yes</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>N/A</td>
    </tr>
    <tr>
        <th>Snapshotting</th>
        <td>Yes</td>
        <td>Yes</td>
        <td>No</td>
        <td>No</td>
    </tr>
    <tr>
        <th>Bootable</th>
        <td>Yes</td>
        <td>Yes</td>
        <td>No</td>
        <td>Not</td>
    </tr>
    <tr>
        <th>Use case</th>
        <td>General, bulk file storage</td>
        <td>Very random IOPS</td>
        <td>High IOPS and low latency</td>
        <td>low latency and risk of data loss</td>
    </tr>
</table>

In summary, you have several different disk options. Persistent disks can be rebooted and snapshotted, but local SSDs and RAM disks are ephemeral.
We recommend chossing a persistent HDD disk when you don't need performance but just need capacity. If you have high performance needs, start looking at the SSD options. The persistent disks offer data redundancy because the data on each persistent disk is distributed across several physical disks.
Local SSDs provide even higher performance, but without the data redundancy.
Finally, RAM disks are very volatile, but they provide the highest performance.

### Maximum persistent disks
Now, just as there is a limit on how many Local SSDs you can attach to a VM, there is also a limit on how many persistent disks you can attach to a VM. This limit depends on the machine type. For the Shared-core machine type, you can attach up to 16 disks. For the Standard, High Memory, High-CPU, Memory-optimized, and Compute-optimized machine types, you can attach up to 128 disks. So you can create massive amounts of capacity for a single host.

Now remember that little nuance when we told you about how throughput is limited by the number of cores that you have? That throughput also shares the same bandwidth with Disk IO. So if you plan on having a large amount of Disk IO throughput, it will also compete with any network egress or ingress throughput. So remember that, especially if you will be increasing the number of drives attached to a virtual machine.

### Persistent disk management differences
Cloud Persistent Disk

- single file system is best
- resize (grow) disks
- resize file system
- built-in snapshot service
- automatic encryption

Computer Hardware Disk

- partitioning
- repartition disk
- reformat
- redundant disk arrays
- subvolume management and snapshots
- encrypt files before write to disk

There are many differences between a physical hard disk in a computer and a persistent disk, which is essentially a virtual networked device.
First of all, if you remember with normal computer hardware disks, you have to partition them. Essentially, you have a drive and you're carving up a section for the operating system to get its own capacity. If you want to grow it, you have to repartition, and if you want to make changes you might even have to reformat. If you want redundancy, you might create a redundant disk array, and if you want encryption, you need to encrypt files before writing them to the disk.
With cloud persistent disks, things are vewry different because all that management is handled for you on the backend. You can simply grow disks and resize the file system, because disks are virtual networked devices. Redundancy and snapshot services are built in and disks are automatically encrypted. You can even use your own keys, and that will ensure that no party can get to the data except you.

### Metadata and scripts
Every VM instance stores its metadata on a metadata server. The metadata server is particularly useful in combination with startup and shutdown scripts, because you can use the metadata server to programmatically get unique information about an instance, without additional authorization. For example, you can write a startup script that gets the metadata key/value pair for an instance's external IP address and use that IP address in your script to set up a database. Because the default metadata keys are the same on every instance, you can reuse your script without having to update it for each instance. This helps you create less brittle code for your applications.

Storing and retrieving instance metadata is a very common Compute Engine action.
We recommend storing the startup and shutdown scripts in Cloud Storage.

### Move an instance to a new zone
Another common action is to move an instance to a new zone. For example, you might do so for geographical reasons or because a zone is being deprecated.

- Automated process (moving within region):
    - `gcloud compute instances move`
    - update references to VM; not automatic
- manual process (moving between region)
    - snapshot all persistent disks on the source VM
    - create new persistent disks in destination zone restored from snapshots
    - create new VM in the destination zone and attach new persistent disks
    - assign static IP to new VM
    - update references to VM
    - delete the snapshots, original disks, and original VM

If you move your instance within the same region, you can automate the move by using the `gcloud compute instances move` command.
If you move your instance to a different region, you need to manually do so by following the process outlined here. This involves making a snapshot of all persistent disks and creating new disks in the destination zone from that snapshot. Next, you create the new VM in the destination zone and attach the new persistent disks, assign a static IP, and update any references to the VM. Finally, you delete the original VM, its disks, and the snapshot.

### Snapshot: back up critical data
Snapshots have many use cases. For example, they can be used to back up critical data into a durable storage solution to meet application, availability, and recovery requirements. These snapshots are stored in Cloud Storage.

### Snapshot: Migrate data between zones
Snapshots can also be used to migrate between zones. We just discussed this when going over the manual process of moving an instance between two regions, but this can also be used to simply transfer data from one zone to another. For example, you might want to minimize latency by migrating data to a drive that can be locally attached in the zone where it is used.

### Snapshot: Transfer to SSD to improve performance
Which brings me to another snapshot use case of transferring data to a different disk type. For example, if you want to improve disk performance, you could use a snapshot to transfer data from a standard HDD persistent disk to a SSD persistent disk.

### Persistent disk snapshots
- snapshot is not available for local SSD
- creates an incremental backup to Cloud Storage.
    - not visible in your buckets; managed by the snapshot service
    - consider cron jobs for periodic incremental backup
- snapshots can be restored to a new persistent disk
    - new disk can be in another region or zone in the same project
    - basis of VM migration: "moving" a VM to a new zone
        - snapshot doesn't back up VM metadata, tags, etc.

Now that I've covered some of the snapshot use cases, let's explore the concept of a disk snapshot.

First of all, this slide is titled persistent disk snapshots, because snapshots are available only to persistent disks and not to local SSDs.
Snapshots are different from public images and custom images, which are used primarilty to create instances or configure instance templates, in that snapshots are useful for periodic backup of the data on your persistent disks.

Snapshots are incremental and automatically compressed, so you can create regular snapshots on a persistent disk faster and at a much lower cost than if your regularly created a full image of the disk.
As we saw with the previous examples, snapshots can be restored to a new persistent disk, allowing for a move to a new zone.

### Resize persistent disk
Another common Compute Engine action is to resize your persistent disk. The added benefit of increasing storage capacity is to improve I/O performance. This can be achieved while the disk is attached to a running VM without having to create a snapshot.
Now, while you can grow disks in size, you can never shrink them, so keep this in mind.

### Which statement is true of virtual machine instances in Compute Engine?
- In Compute Engine, a VM is a networked service that simulates the features of a computer

VMs in Compute Engine are a collection of networked services. This includes disks (persistent disks) which are network-attached. In some cases, the Google Cloud VM behaves unlike hardware or other kinds of virtual machines; for example, when a multi-tenant virtual CPU "bursts", using excess capacity beyond the VM spec.

### What are sustained use discounts?
- automatic discounts that you get for running specific Compute Engine resources for a significant portion of the billing month.

Sustained use discounts are automatic discounts that you get for running specific Compute Engine resources (vCPUs, memory, GPU devices) for a significant portion of the billing month. To take advantage of the full 30% discount, create your VM instances on the first day of the month, because discounts reset at the beginning of each month.

### Which statement is true of persistent disks?
- persistent disks are encrypted by default

Physical Disks are not physical disks, they are a virtual-networked service. Each persistent disk remains  encrypted either with system-defined keys or with customer-supplied keys.

### Review - Virtual Machines
In this module, we covered the different compute, image, and disk options within Compute Engine, along with some common actions.

Remember that there are many compute options to choose from. If a predefined machine type does not meet your needs, you can customize your own VM and you can even create a sole-tenant node. You can also install different public and custom images on the boot disks of your instances and you can attach more disks if needed.

## Cloud IAM
In this module, we cover Cloud Identity and Access Management (or Cloud IAM)

Cloud IAM is a sophisticated system built on top of email-like address names, job-type roles, and granular permissions. If you're familiar with IAM from other implementations, look for the differences that Google has implemented to make IAM easier to administer and more secure.

### Identity and Access Management
So what is identity access management? It is a way of identifying who can do what on which resource.

The who can be a person, group, or application. The what refers to specific privileges or actions, and the resource could be any Google Cloud service.

For example, we could give you the privilege or role of Compute Viewer. This provides you with read-only access to get and list Compute Engine resources, without being able to read the data stored on them.

### Cloud IAM objects
- orgazniation
- folders
- projects
- resources
- roles
- members

Cloud IAM is composed of different objects as shown on this slide. We are going to cover each of these in this module. To get a better understanding of where these fit in, let's look at the Cloud IAM resource hierarchy.

### Cloud IAM resource hierarchy
Google Cloud resources are organized hierarchically, as shown in this tree structure.
The Organization node is the root node in this hierarchy, folders are the children of the organization, projects are the children of the folders, and the individual resources are the children of projects. Each resource has exactly one parent.

Cloud IAM allows you to set policies at all of these level, where a policy contains a set of roles and role members. Let me go through each of the levels from top to bottom, because resources inherit policies from their parent.

The organization resource represents your company. Cloud IAM roles granted at this level are inherited by all resources under the organization.

The folder resource could represent your department. Cloud IAM roles granted at this level are inherited by all resources that the folder contains.

Projects represent a trust boundary within your company. Services within the same project have a default level of trust.

The Cloud IAM policy hierarchy always follows the same path as the Google Cloud resource hierarchy, which means that if you change the resource hierarchy, the policy hierarchy also changes. For example, moving a project into a different organization will update the project's Cloud IAM policy to inherit from the new organization's Cloud IAM policy.

Also, child policies cannot restrict access granted at the parent level. For example, if we grant you the Editor role for Department X, and we grant you the Viewer role at the bookshelf project level, you still have the Editor role for that project. Therefore, it is a best practice to follow the principle of least privilege. The principle applies to identities, roles, and resources. Always select the smallest scope that's necessary for the task in order to reduce your exposure to risk.

### Organization node
- an organization node is a root node for Google Cloud resources
- organization roles:
    - organization admin: control over all cloud resources; useful for auditing
    - project creator: controls project creation; control over who can create projects

As we mentioned earlier, the organization resource is the root node in the Google Cloud resource hierarchy. This node has many roles, like the Organization Admin. The Organization Admin provides a user like Bob with access to administer all resources belonging to his organization, which is useful for auditing. 
There is also a Project Creator role, which allows a user like Alice to create projects within her organization. We are showing the project creator role here because it can also be applied at the organization level, which would then be inherited by all the projects within the organization.

### Creating and managing organizations
