# Amazon Virtual Private Cloud (VPC)
Based on https://www.youtube.com/watch?v=fpxDGU2KdkA

### Amazon VPC Definition
"Amazon Virtual Private Cloud (Amazon VPC) enables you to launch Amazon Web Services (AWS) resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS."

### Subnet Definition
"A range of IP addresses in your VPC; you can launch AWS resources into a subnet that you select. Use a public subnet for resources that must be connected to the Internet and a private subnet for resources that won't be connected to the Internet"

### Internet Gateway Definition
"An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the Internet. It therefore imposes no availability risks or bandwidth constraints on your network traffic.

#### Internet Gateway Requirements
1. An Internet Gateway must be attached to your VPC
2. All instances in your subnet must have either a public IP address or an Elastic IP address
3. Your subnet's route table must point to the Internet gateway
4. All network access control and security group rules must be configured to allow the required traffic to and from your instance.

### Route Table Definition
"A route table contains a set of rules, called routes, which are used to determine where network traffic is directed.

Each subnet in your VPC must be associated with a route table; the table controls the routing for the subnet. A subnet can only be associated with one route table at a time, but you can associate multiple subnets with the same route table."

### Security Group Definition
"A security group acts as a virtual firewall that controls the traffic for one or more instances. You add rules to each security group that allow traffic to or from its associated instances."

#### Security groups rules
- by default, security groups allow all outbound traffic
- security group rules are always permissive
- security groups are stateful
- you can modify the rules of a security group at any time and the rules are applied immediately

### Network ACL Definition
"A network access control list (ACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets.

You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC."

#### Network ACL Rules
- Each subnet in your VPC must be associated with an ACL
- A subnet can only be associated with one ACL. However, an ACL can be associated with multiple subnets.
- An ACL contains a list of numbered rules which are evaluated in order, starting with the lowest.
- ACLs are stateless; responses to allowed inbound traffic are subject to the rules for outbound traffic.