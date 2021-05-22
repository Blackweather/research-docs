# Microsoft Azure Virtual Training Day - Fundamentals
VM SLA - 99.9%
- only with premium storage and managed storage

- if you delete a resource group, it deletes everything in it

- tenants - Azure AD lives in it, you log onto the tenant to gain access to subscriptions

storage account - name has to be globally unique

# AZ-900 Microsoft Courses
## Key Cloud Concepts
- **High availability** - the ability to keep services up and running for long periods of time, with very little downtime, depending on the service in question
- **Scalability** - the ability to increase or decrease resources for any given workload. 
- **Elasticity** - the ability to automatically or dynamically increase or decrease resources as needed. A distinction between scalability and elasticity is that elasticity is done automatically
- **Agility** - the ability to react quickly. Cloud services can allocate and deallocate resources quickly
- **Fault Tolerance** - the abillity to remain up and running even in the event of a component (or service) no longer functioning
- **Disaster recovery** - the ability to recover from an event which has taken down a cloud service
- **global reach** - the ability to reach audiences around the globe.
- **Customer latency capabilities** - if customers are experiencing slowness with a particular cloud service, they are said to be experiencing some latency. Cloud services have the ability to deploy resources in datacenters around the globe, which addresses any customer latency issues.
- **Predictive cost considerations** - the ability for users to predict the costs they will incur for a particular cloud service.
- **Technical skill requirements and considerations** - cloud services can provide and manage hardware and software for workloads. Getting a workload up and running with cloud services demands less technical resources than having IT teams build and maintain a physical infrastructure for handling the same workload.
- **Increased productivity** - on-site datacenters typically require a lot of hardware setup, software patching, and other time-consuming IT management chores. Cloud computing eliminates the need for many of these tasks.
- **Security** - cloud providers offer a broad set of policies, technologies, controls, and expert technology skills that can provide better security than most organizations can otherwise achieve.

## Economies of scale
- the ability to reduce costs and gain efficiency when operating at a larger scale in comparison to operating at a smaller scale

## CapEx vs OpEx
- **Capital Expenditure (CapEx)** - up front spending of money on physical infrastructure, and then deducting that up front expense over time. The up front cost from CapEx has a value that reduces over time
- **Operational Expenditure (OpEx)** - spending money on services or products now and being billed for them now. You can deduct this expense in the same year you spend it. There is no up front cost, as you pay for a service or product as you use it.

### CapEx computing costs
- **Server costs** - includes all hardware components and the cost of supporting them. When purchasing servers, make sure to design fault tolerance and redundancy, such as server clustering, redundant power supplies, and uninterruptible power supplies. When a serves needs to be replaced or added to a datacenter, you need to pay for the computer. This can affect your immediate cash flow because you must pay for the server up front.
- **Storage costs** - this area includes all storage hardware components and the cost of supporting it. Based on the application and level of fault tolerance, centralized storage can be expensive. For larger organizations, you can create tiers of storage where more expensive fault-tolerant storage is used for critical applications, and lower expense storage is used for lower priority data.
- **Network costs** - networking costs include all on-premises hardware components, including cabling, switches, access points, and routers. This also includes WAN and Internet connections.
- **Backup and archive costs** - this is the cost to back up, copy, or archive data. Options might include setting up a backup to or from the cloud. There's an upfront cost for the hardware and additional costs for backup maintenance and consumables, like tapes.
- **Organization continuity and disaster recovery costs** - along with server fault tolerance and redundancy, you need to plan for how to recover from a disaster and continue operating. Your plan should consist of creating a data recovery site. It could also include backup generators. Most of these are upfront costs, especially if you build a data recovery site, but these's an additional ongoing cost for the infrastructure and its maintenance.
- **Datacenter infrastructure costs** - these are costs for construction and building equipment, as well as future renovation and remodeling costs that may arise as demands grow. Additionally, this infastructure incurs operational expenses for electricity, floor space, cooling, and building maintenance.
- **Technical personnel** - while not a capital expenditure, the personnel required to work on your infrastructure are specific to on-premises datacenters. You will need the technical expertise and workforce to install, deploy and manage the systems in the datacenter and at the data recovery site.

### OpEx cloud computing costs
With cloud computing, many of the costs associated with an on-premises datacenter are shifted to the service provider. Instead of thinking about physical hardware and datacenter costs, cloud computing has a different set of costs. For accounting purposes, all these costs are operational expenses:

- **Leasing software and customized features** - using a pay-per-use model requires actively managing your subscriptions to ensure users do not misuse the services, and that provisioned accounts are being utilized and not wasted. As soon as the provider provisions resources, the billing starts. It is your responsibility to de-provision the resources when they aren't in use so that you can minimize costs.
- **Scaling charges based on usage/demand instead of fixed hardware or capacity** - cloud computing can bill in various ways, such as the number of users or CPU usage time. However, billing categories can also include allocated RAM, I/O operations per second (IOPS), and storage space. Plan for backup traffic and data recovery traffic to determine the bandwidth needed.
- **Billing at the user or organization level** - the subscription (pay-per-use) model is a computing billing method that is designed for both organizations and users. The organization or user is billed for the services used, and typically on a recurring basis. You can scale, customize, and provision computing resources, including software, storage, and development platforms. For example, when using a dedicated cloud service, you could pay based on server hardware and usage.

### Benefits of CapEx
With capital expenditures, you plan your expenses at the start of a project or budget period. Your costs are fixed, meaning you know exactly how much is being spent. This is appealing when you need to predict the expenses before a project starts due to a limited budget.

### Benefits of OpEx
Demand and growth can be unpredictable and can outpace expectation, which is a challenge for the CapEx model. With the OpEx model, companies wanting to try a new product or service don't need to invest in equipment. Instead, they pay as much or as little for the infrastructure as required.
OpEx is particularly appealing if the demand fluctuates or is unknown.

## Consumpion-based models
Cloud service providers operate on a **consumption-based model**, which means that end users only pay for the resources that they use. Whatever they use is what they pay for.

### Benefits
- no upfront costs
- no need to purchase and manage costly infrastructure that they may or may not use to its fullest
- the ability to pay for additional resources when they are needed
- the ability to stop paying for resources that are no longer needed

Consumption-based models also allow for better cost prediction. Prices for individual resources and services are provided so you can predict how much you will spend in a given billing period based on your expected usage. You can also perform analysis based on future growth using historical usage data tracked by your cloud provider.

## Public cloud definition
A public cloud is owned by the cloud services provider (also known as a hosting provider). It provides resources and services to multiple organizations and users, who connect to the cloud service via a secure network connection, typically over the internet.

### Public cloud characteristics
- **ownership** - refers to the resources that an organization or end user uses. Resources do not belong to the organization that is utilizing them, but rather they are owned and operated by a third party, such as the cloud service provider.
- **multiple end users** - resources available to multiple organizations
- **public access** - public cloud allows the public to access the desired cloud services
- **availability** - public cloud is the most common cloud-type deployment model
- **connectivity** - users and organizations are typically connected to the public cloud over the internet using a web browres
- **skills** - public clouds do not require deep technical knowledge to set up and use its resources

A common use case scenario is deploying a web application or a blog site on hardware and resources that are owned by a cloud provider. Using a public cloud in this scenario allows users to get their website/blog up and running quickly, and then focus on maintaining the site without having to worry about purchasing, managing, or maintaining the hardware on which it runs.

## Private cloud definition
A private cloud is owned and operated by the organization that uses the resources from that cloud. They creat a cloud environment in their own datacenter and provide self-service access to compute resources to users within their organization. The organization remains the owner, entirely responsible for the operation of the services they provide.

### Private cloud characteristics
- **ownership** - the owner and user of the cloud services are the same
- **hardware** - the owner is entirely responsible for the purchase, maintenance, and management of the cloud hardware
- **users** - a private cloud operates only within one organization and cloud computing resources are used exclusively by a single business or organization
- **connectivity** - a connection to a private cloud is typically made over a private network that is highly secure
- **public access** - does not provide access to the public
- **skills** - requires deep technical knowledge to set up, manage, and maintain

A use case scenario for a private cloud would be when an organization has data that cannot be put in the public cloud, perhaps for legal reasons. For example, they may have medical data that cannot be exposed publicly.
Another scenario may be where government policy requires specific data to be kept in-country or privately.
A private cloud can provide cloud functionality to external customers as well, or to specific internal departments such as Accounting or Human Resources.

## Hybrid cloud definition
A hybrid cloud combines both public and private clouds, allowing you to run your applications in the most appropriate location.

### Hybrid cloud models characteristics
- **resource location** - specific resources run or are used in a public cloud, and others run or are used in a private cloud
- **cost and efficiency** - hybrid cloud models allow an organization to leverage some of the benefits of cost, efficiency, and scale that are available with a public cloud model
- **control** - organization retain management control in private clouds
- **skills** - technical skills are required to maintain the private cloud and ensure both cloud models can operate together

An example of a hybrid cloud usage scenario would be hosting a website in the public cloud and linking it to a highly secure database hosted in a private cloud.
Hybrid cloud solutions can be useful when organizations have some things that cannot be put in a public cloud, possibly for legal reasons. For example, you may have medical data that cannot be exposed publicly.
Another example is one or more applications that run on old hardware that can't be updated. In this case, you can keep the old system running locally in your private cloud and connect it to the public cloud for authorization or storage.

## Shared responsibility model
Cloud providers offer considerable advantages for security and compliance efforts, but these advantages do not absolve the customer from protecting their users, applications, and service offerings.

The shared responsibility model ensures cloud workloads are run securely in a well-managed way. Depending on the service you are using, the cloud provider is responsible for some aspects of the workload management, and the customer or end user is responsible for other aspects of the workload management, and in some cases both share a responsibility.

- IaaS requires the most user management of all the cloud services. The user is responsible for managing the operating systems, data, and applications
- PaaS requires less user management. The cloud provider manages the operating systems and the user is responsible for the applications and data they run and store.
- SaaS requires the least amount of management. The cloud provider is responsible for managing everything, and the end user just uses the software.

### IaaS
Infastructure as a Service (IaaS) is the most basic category of cloud computing services. With IaaS, you rent IT infrastructure servers and virtual machines (VMs), storage, networks, and operating systems from a cloud provider on a pay-as-you-go basis. It's an instant computing infrastructure, provisioned and managed over the internet.

#### IaaS characteristics
- IaaS has no upfront costs. Users pay only for what they consume.
- **User ownership** - the user is responsible for the purchase, installation, configuration, and management of their own software operating systems, middleware, and applications
- **Cloud provider ownership** - the cloud provider is responsible for ensuring that the underlying cloud infrastructure is available for the user

#### IaaS usage scenarios
- **migrating workloads** - typically, IaaS facilities are managed in a similar way as on-premises infrastructure and provide an easy migration path for moving existing applications to the cloud
- **test and development** - teams can quickly set up and dismantle test and development environments, bringing new applications to market faster. IaaS makes scaling development testing environments up and down fast and economical.
- **website hosting** - running websites using IaaS can be less expensive than traditional web hosting
- **storage, backup and recovery** - organizations avoid the capital outlay and complexity of storage management, which typically requires a skilled staff to manage data and meet legal and compliance requirements. IaaS is useful for managing unpredictable demand and steadily growing storage needs. It can also simplify the planning and management of backup and recovery systems.

### PaaS
Platform as a Service (PaaS) provides an environment for building, testing, and deploying software applications. The goal of PaaS is to help create an application as quickly as possible without having to worry about managing the underlying infrastructure. For example, when deploying a web application using PaaS, you don't have to install an operating system, web server, or even system updates. PaaS is a complete development and deployment environment in the cloud, with resources that enable organizations to deliver everything from simple cloud-based apps to sophisticated cloud-enabled enterprise applications.
Resources are purchased from a cloud service provider on a pay-as-you-go basis and accessed over a secure Internet connection.

#### PaaS characteristics
- there are no upfront costs and users pay only for what they consume
- **user ownership** - the user is responsible for the development of their own applications. However, they are not responsible for managing the server or infrastructure. This allows the use to focus on the application or workload they want to run.
- **cloud provider ownership** - the cloud provider is responsible for operating system management, and network and service configuration. Cloud providers are typically responsible for everything apart from the application that a user wants to run. They provide a complete managed platform on which to run an application.

#### PaaS usage scenarios
- **Development framework** - PaaS provides a framework that developers can build upon to develop or customize cloud-based applications. Similar to the way you create a Microsoft Excel macro, PaaS lets developers create applications using built-in software components. Cloud features such as scalability, high-availability, and multi-tenant capability are included, reducing the amount of coding that developers must do
- **Analytics or business intelligence** - tools provided as a service with PaaS allow organizations to analyze and mine their data. They can find insights and patterns, and predict outcomes to improve business decisions such as forecasting, product design, and investment returns.

### SaaS
Software as a Service (SaaS) is software that is centrally hosted and managed for the end customer. It allows users to connect to and use cloud-based apps over the internet. Common examples are email, calendars, and office tools such as Microsoft 365.
SaaS is typically licensed through a monthly or annual subscription, and Microsoft 365 is an example of SaaS software.

#### SaaS characteristics
- users have no upfront costs; they pay a subscription, typically on a monthly or annual basis
- **User ownership** - users just use the application software; they are not responsible for any maintenance or managemeng of that software
- **Cloud provider ownership** - the cloud provider is responsible for the provision, management, and maintenance of the application software.

#### SaaS usage scenarios
- examples of Microsoft SaaS services include Microsoft 365, Skype, and Microsoft Dynamics CRM Online

### Regions
A region is a geographical area on the planet containing at least one, but potentially multiple datacenters that are in close proximity and networked together with a low-latency network.

- regions provide customers the flexibility and scale needed to bring applications closer to their users
- regions preserve data residency and offer comprehensive compliance and resiliency options for customers

Some services or virtual machine features are only available in certain regions, such as specific virtual machine sizes or storage types. There are also some global services that do not require you to select a particular region, such as Microsoft Azure Active Directory, Microsoft Azure Traffic Manager, and Azure DNS

#### Special Azure regions
Azure has specialized regions that you might want to use when building out your applications for compliance or legal purposes. These include:

- US DoD Central, US Gov Virginia, Texas and Arizona and more: these are physical and logical network-isolated instances of Azure for US government agencies and partners. These datacenters are operated by screened US persons and include additional compliance certifications
- China East, China North and more: these regions are available through a unique partnership between Microsoft and 21Vianet, whereby Microsoft does not directly maintain the datacenters.

### Region Pairs
It's possible that a large enough disaster could cause an outage large enough to affect even two datacenters. That's why Azure creates region pairs. Each Azure region is paired with another region within the same geography at least 300 miles away, which together make a region pair.

- **Physical isolation** - when possible, Azure prefers at least 300 miles of separation between datacenters in a regional pair, although this isn't practical or possible in all geographies. Physical datacenter separation reduces the likelihood of natural disasters, civil unrest, power outages, or physical network outages affecting both regions at once.
- **Platform-provided replication** - some services such as geo-redundant storage provide automatic replication to the paired region
- **Region recovery order** - in the event of a broad outage, recovery of one region is prioritized out of every pair. Applications that are deployed across paired regions are guaranteed to have one of the regions recovered with priority.
- **Sequential updates** - planned Azure system updates are rolled out to paired regions sequentially (not at the same time) to minimize downtime, the effect of bugs, and logical failures in the rare event of a bad update

### Geographies
Geography is a discrete market typically containing two or more regions that preserves data residency and compliance boundaries.

Geographies are broken up into the following areas

- Americas
- Europe
- Asia Pacific
- Middle East and Africa

### Availability options
- a single virtual machine with premium storage has an SLA of 99.9%. You can quickly migrate existing virtual machines to Azure through "lift and shift". Lift and shift is a no-code option where each application is migrated as-is, providing the benefits of the cloud without the risks or costs of making code changes
- by placing virtual machines in an availability set, you can protect against datacenter failures and increases the SLA to 99.95%
- adding virtual machines to availability zones protects from entire failures and increases the SLA to 99.99% which is highest level of protection that is provided
- for multi-region disaster recovery, region pairs protect and provide data residency boundaries

### Availability sets
Availability sets are a way for you to ensure your application remains online if a high-impact maintenance event is required, or if a hardware failure occurs.
Availability sets are made up of Update domains (UD) and Fault domains (FD)

- **Update domains** - when a maintenance event occurs (such as performance update or critical security patch applied to the host), the update is sequenced through update domains. Sequencing updates using update domains ensures that the entire datacenter isn't unavailable during platform updates and patching. Update domains are a logical section of the datacenter, and they are implemented with software and logic.
- **Fault domains** - provide for the physical separation of your workload across different hardware in the datacenter. This includes power, cooling, and network hardware that supports the physical servers located in server racks. In the event the hardware that supports a server rack becomes unavailable, only that rack of servers would be affected by the outage.

### Availability Zones
You want to ensure your services and data are redundant so you can protect your information in case of failure. When you are hosting your infrastructure, this requires creating duplicate hardware environments. Azure can help make your app highly available through Availability Zones.
Availability Zones are physically separate locations within an Azure region that use availability sets to provide additional fault tolerance.

#### Availability zone features
- each availability zone is an isolation boundary containing one or more datacenters equipped with independent power, cooling and networking
- if one availability zone goes down, the other continues working
- the availability zones are typically connected to each other through very fast, private fiber-optic networks
- availability zones allow customers to run mission-critical applications with high availability and low-latency replication
- availability zones are offered as a service within Azure, and to ensure resiliency, there's a minimum of three separate zones in all enabled regions

### Resource groups
A resource group is a unit of management for your resources in Azure. You can think of your resource group as a container that allows you to aggregate and manage all the resources required for your application in a single manageable unit. This allows you to manage the application collectively over its lifecycle, rather than manage components individually.

#### Considerations
- each resource must exist in one, and only one, resource group
- a resource group can contain resources that reside in different regions
- resources for an application do not need to exist in the same resource group. However, it is recommended that you keep them in the same resource group for ease of management

#### Life cycle
If you delete a resource group, all resources contained within are also deleted. Organizing resources by life cycle can be useful in non-production environments, where you might try an experiment, but then dispose of it when done. Resource groups make it easy to remove a set of resources at once.

#### Authorization
Resource groups are also a scope for applying RBAC permissions. By applying RBAC permissions to a resource group, you can ease administration and limit access to allow only what is needed.

### Azure Resource Manager 
Azure Resource Manager is a management layer in which resource groups and all the resources within it are created, configured, managed, and deleted. It provides a consistent management layer which allows you to automate the deployment and configuration of resources using different automation and scripting tools.
With Azure Resource Manager, you can:

- **deploy application resources**. update, manage, and delete all the resources for your solution in a single, coordinated operation
- **organize resources**. Manage your infrastructure through declarative templates rather than scripts. You can view which resources are linked by a dependency, and you can apply tags to resources to categorize them for management tasks, such as billing.
- **control access and resources**. You can control who in your organization can perform actions on the resources. You manage permissions by defining roles, adding users or groups to the roles, and applying policies at resource group level. Examples of elements you may wish to control are: enforcing naming convention on resources, limiting which types and instances of resources can be deployed, or limiting which regions can host a type of resource.

### Virtual machine scale sets
Virtual machine scale sets are an Azure compute resource that you can use to deploy and manage a set of identical VMs. With all VMs configured the same, virtual machine scale sets are designed to suppors true autoscale; no pre-provisioning of VMs is required; and as such makes it easier to build large-scale services targeting big compute, big data, and containerized workloads,

### Azure Virtual Network
Azure Virtual Network enables many types of Azure resources such as Azure VMs to securely communicate with each other, the internet, and on-premises networks. A virtual network is scoped to a single region, however, multiple virtual networks from different regions can be connected using virtual network peering. With Azure Virtual Network you can provide isolation, segmentation, communication with on-premises and cloud resources, routing and filtering of network traffic.

### Azure Load Balancer
Azure Load Balancer can provide scale for your applications and create high availability for your services. Load Balancer supports inbound and outbound scenarios and provides low latency and high throughput, and scales up to millions of flows for all TCP and UDP applications. You can use Load Balancer with incoming internet traffic, internal traffic across Azure services, port forwarding for specific traffic, or outbound connectivity for VMs in your virtual network.

### VPN gateway
A VPN gateway is a specific type of virtual network gateway that is used to send encrypted traffic between an Azure Virtual Network and an on-premises location over the public internet. It provides a more secure connection from on-premises to Azure over the internet.

### Azure Application Gateway
Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications. It is the connection through which users connect to your application. With Application Gateway you can route traffic based on source IP address and port to a destination IP address and port. You also can help protect a web application with a web application firewall, redirection, session affinity to keep a user on the same server, and many more configuration options.

### Content Delivery Network
A CDN is a distributed network of servers that can efficiently deliver web content to users. It is a way to get content to users in their local region to minimize latency. CDN can be hosted in Azure or any other location. You can cache content at strategically placed physical nodes across the world and provide better performance to end users. Typical usage scenarios include web applications containing multimedia content, a product launch event in a region, or any event where you expect a high bandwidth requirement in a region.

### Data categories in Azure
#### Structured data
- adheres to a schema, so all the data has the same fields or properties
- can be stored in a database table with rows and columns
- relies on keys to indicate how one row in a table relates to data in another row of another table
- also known as relational data, the data's schema defines the table of data, the fields in the table, and the clear relationship between the two
- easy to enter, query, and analyze because all the data follows the same format
- examples - sensor data, financial data

#### Semi-structured data
- less organized than structured data
- not stored in a relational format, meaning the fields do not neatly fit into tables, rows, and columns
- contains tags that make the organization and hierarchy of the data apparent
- also known as non-relational or NoSQL data
- examples - books, blogs, HTML documents

#### Unstructured data
- no designated structure
- can hold any kind of data
- becoming more prominent as businesses try to tap into new data sources
- examples - PDF document, JPG image, JSON file, video content

### Azure Storage
Azure Storage is a service that you can use to store files, messages, tables, and other types of information. You can use Azure Storage on its own, but developers also often use it as a store for working data. Such stores can be used by websites, mobile apps, desktop applications, and many other types of custom solutions.

Some of the most common storage service types in Azure are disks, files, objects, queues, and tables.

#### Disk storage
Disk storage provides disks for virtual machines, applications, and other services to access and use as they need, similar to how they would in on-premises scenarios. Disk storage allows data to be persistently stored and accessed from an attached virtual hard disk. The disks can be managed or unmanaged by Azure, and therefore managed and configured by the user. Typical scenarios for using disk storage are if you want to lift and shift applications that read and write data to persistent disks, or if you are storing data that is not required to be accessed from outside the virtual machine to which the disk is attached.

Disks come in many different sizes and performance levels, from the SSDs to HDDs, with varying performance abilities.

#### Containers (Blobs)
Azure Blob storage is Microsoft's object storage solution for the cloud. Blob storage is optimized for storing massive amounts of unstructured data, such as text or binary data.

Blob storage is ideal for:

- serving images or documents directly to a browser
- storing files for distributed access
- streaming video and audio
- storing data for backup and restore, disaster recovery, and archiving
- storing data for analysis by an on-premises or Azure-hosted service

#### Files
Azure Files enables you to set up highly available network file shares that can be accessed by using the standard SMB protocol. That means that multiple VMs can share the same files with both read and write access. You can also read the files using the REST interface or the storage client libraries.

One thing that distinguishes Azure Files from files on a corporate file share is that you can access the files from anywhere in the world using a URL that points to the file and includes a shared access signature (SAS) token. You can generate SAS tokens; they allow specific access to a private asset for a specific amount of time.

File shares can be used for many common scenarios:

- many on-premises applications use file shares. This feature makes it easier to migrate those applications that share data to Azure. If you mount the file share to the same drive letter that the on-premises application uses, the part of your application that accesses the file share should work with minimal, if any, changes
- configuration files can be stored on a file share and accessed from multiple VMs. Tools and utilitis used by multiple developers in a group can be stored on a file share, ensuring that everybody can find them, and that they use the same version
- diagnostic logs, metrics, and crash dumps are just three examples of data that can be written to a file share and processed or analyzed later.

#### Queues
The Azure Queue service is used to store and retrieve messages. Queue messages can be up to 64 KB in size, and a queue can contain millions of messages. Queues are generally used to store lists of messages to be processed asynchronously.

For example, say you want your customers to be able to upload pictures, and you want to create thumbnails for each picture. You could have your customer wait for you to create the thumbnails while uploading the pictures. An alternative would be to use a queue. When the customer finishes their upload, write a message to the queue. Then have an Azure Function retrieve the message from the queue and create the thumbnails. Each of the parts of this processing can be scaled separately, giving you more control when tuning it for your usage.

#### Tables
Azure Table storage stores large amounts of structured data. The service is a NoSQL datastore which accepts authenticated calls from inside and outside the Azure cloud. Azure tables are ideal for storing structured, non-relational data. Common uses of Table storage include:

- storing TBs of structured data capable of serving web scale applications
- storing datasets that don't require complex joins, foreign keys, or stored procedures and can be denormalized for fast access
- quickly querying data using a clustered index

### Azure Database Services
Azure database services are fully managed PaaS database services that free up valuable time you'd otherwise spend managing your database. Enterprise-grade performance with built-in high availability means you can scale quickly and reach global distribution without worrying about costly downtime. Developers can take advantage of industry-leading innovations such as built-in security with automatic monitoring and threat detection, automatic tuning for improved performance, and turnkey global distribution.

#### Azure Cosmos DB
Globally distributed database service that enables you to elastically scale throughput and storage across any number of Azure's geographic regions. It supports schema-less data that lets you build highly responsive and Always On applications to support constantly changing data. You can use Cosmos DB to store data that is updated and maintained by users around the world. It makes it easy to build scalable, highly responsive applications at global scale.

#### Azure SQL Database
Relational database as a service (DaaS) based on the latest stable version of Microsoft SQL Server database engine. SQL Database is a high-performance, reliable, fully managed and secure database that you can use to build data-driven applications and websites in the programming language of your choice without needing to manage infrastructure.

#### Azure Database Migration
Fully managed service designed to enable seamless migrations from multiple database sources to Azure data platforms with minimal downtime (online migrations). The service uses the Microsoft Data Migration Assistant to generate assessment reports that provide recommendations to help guide you through required changes prior to performing a migration. Once you assess and perform any remediation required, you're ready to begin the migration process. The Azure Database Migration Service performs all of the required steps.

### IoT services
#### IoT Central
Fully managed global IoT software as a service solution that makes it easy to connect, monitor, and manage your IoT assets at scale. No cloud expertise is required to use IoT Central. As a result, you can bring your connected products to market faster while staying focused on your customers.

#### Azure IoT Hub
Managed service hosted in the cloud that acts as a central message hub for bi-directional communication between your IoT application and the devices it manages. You can use Azure IoT Hub to build IoT solutions with reliable and secure communications between millions of IoT devices and a cloud-based solution backend. You can connect virtually any device to your IoT Hub.
IoT Hub supports communications both from the device to the cloud and from the cloud to the device. It also supports multiple messaging patterns such as device-to-cloud telemetry, file upload from devices, and request-reply methods to control your devices from the cloud. IoT Hub monitoring helps you maintain the health of your solution by tracking events such as device creation, device failures, and device connections.
IoT Hub's capabilities help you build scalable, full-featured IoT solutions such as managing industrial equipment used in manufacturing, tracking valuable assets in healthcare, and monitoring office building usage.

### Big data services
#### Azure Synapse Analytics
Formerly known as Azure SQL Data Warehouse, is a limitless analytics service that brings together enterprise data warehousing and big data analytics.

#### Azure HDInsight
Fully managed, open-source analytics service for enterprises. It is a cloud service that makes it easier, faster, and more cost-effective to process massive amounts of data. HDInsight allows you to run popular open-source frameworks and create cluster types such as Apache Spark, Apache Hadoop, Apache Kafka, Apache HBase, Apache Storm, Machine Learning Services. HDInsight also supports a broad range of scenarios such as extraction, transformation, and loading (ETL); data warehousing; machine learning; and IoT.

#### Azure Data Lake Analytics
On-demand analytics job service that simplifies big data. Instead of deploying, configuring, and tuning hardware, you write queries to transform your data and extract valuable insights. The analytics service can handle jobs of any scale instantly by setting the dial for how much power you need. You only pay for your job when it is running, making it more cost-effective.

### AI services
#### Azure Cognitive Services
Cognitive services are a collection of domain-specific pre-trained AI models that can be customized with your data. They are categorized broadly into vision, speech, language, and search.

#### Azure Machine Learning Service
Provides a cloud-based environment you can use to develop, train, test, deploy, manage, and track machine learning models. It fully supports open-source technologies, so you can use tens of thousands of open-source Python packages with machine learning components such as TensorFlow and scikit-learn. Rich tools, such as Jupyter Notebooks or the Visual Studio Code Tools for AI, make it easy to interactively explore data, transform it, and then develop, and test models. Azure Machine Learning service also includes features that automate model generation and tuning to help you create models with ease, efficiency, and accuracy.

The Azure Machine Learning service can auto-generate a model and auto-tune it for you. It will let you start training on your local machine, and then scale out to the cloud. When you have the right model, you can easily deploy it in a container such as Docker in Azure. Use Machine Learning service if you work in a Python environment, you want more control over your machine learning algorithms, or you want to use open-source machine learning libraries.

### Serverless services
#### Azure Functions
Ideal when you're only concerned with the code running your service and not the underlying platform or infrastructure. Azure Functions are commonly used when you need to perform work in response to an event - often via a REST request, timer, or message from another Azure service - and when that work can be completed quickly, within seconds or less.

Azure functions scale automatically, and charges accrue only when a function is triggered, so they're a solid choice when demand is variable. For example, you may be receiving messages from an IoT solution that monitors a fleet of delivery vehicles. You'll likely have more data arriving during business hours. Azure Functions can scale out to accommodate these busier times.

Furthermore, Azure Functions are stateless; they behave as if they're restarted every time they respond to an event. This is ideal for processing incoming data. And if state is required, they can be connected to an Azure storage service.

#### Azure Logic Apps
Helps you automate and orchestrate tasks, business processes, and workflows when you need to integrate apps, data, systems, and services across enterprises or organizations. Logic apps simplifies how you design and build scalable solutions - whether in the cloud, on premises, or both - for app integration, data integration, system integration, enterprise application integration (EAI), and business-to-business (B2B) integration.

Logic apps are designed in a web-based designer and can execute logic triggered by Azure services without writing any code. To build enterprise integration solutions with Azure Logic Apps, you can choose from a growing gallery of over 200 connectors. These include services suce as Salesforce, SAP, Oracle DB, and file shares.

#### Azure Event Grid
Allows you to easily build applications with event-based architectures. It's a fully managed, intelligent event routing service that uses a publish-subscribe model for uniform event consumption. Event Grid has built-in support for events coming from Azure services, such as storage blobs and resource groups. You can use Event Grid to support your own non-Azure-based events in near-real time, using custom topics. You can use filters to route specific events to different endpoints, and ensure your events are reliably delivered.

### Defense in depth
A strategy that employs a series of mechanisms to slow the advance of an attack aimed at acquiring unauthorized access to data. The objective of defense in depth is to protect and prevent information from being stolen by individuals not authorized to access it. The common principles used to define a security posture are **confidentiality, integrity, and availability**, known collectively as CIA.

Confidentiality - the principle of least privilege restricts access to information only to individuals explicitly granted access. This includes protection of user passwords, remote access certificates, and email content.

Integrity - the prevention of unauthorized changes to information at rest or in transit. A common approach used in data transmission is for the sender to create a unique fingerprint of the data using a one-way hashing algorithm. The hash is sent to the receiver along the data. The data's hash is recalculated and compared to the original by the receiver to ensure the data wasn't lost or modified in transit.

Availability - ensure services are available to authorized users. Denial of service attacks are a prevalent cause of loss of availability to users.

Defense in depth can be visualized as a set of layers, with the Data to be secured at the center. Each layer provides protection so that if one layer is breached, a subsequent layer is already in place to prevent further exposure. This approach removes reliance on any single layer of protection and acts to slow down an attack and provide alert telemetry that can be acted upon, either automatically or manually.

- **Physical security** is the first line of defense to protect computing hardware in the datacenter
- **Identity & access** controls access to infrastructure and change control
- **Perimeter** layer uses DDoS protection to filter large-scale attacks before they can cause a denial of service for end users
- **Networking** layer limits communication between resources through segmentation and access controls
- **Compute** layer secures access to virtual machines
- **Application** layer ensures applications are secure and free of vulnerabilities

**Data**
In almost all cases, attackers are after data:

- stored in a database 
- stored on disk inside virtual machines
- stored on a SaaS application such as Microsoft 365
- stored in cloud storage

It's the responsibility of those storing and controlling access to data to ensure that it's properly secured. Often, there are regulatory requirements that dictate the controls and processes that must be in place to ensure the confidentiality, integrity, and availability of the data.

**Application**

- ensure applications are secure and free of vulnerabilities
- store sensitive application secrets in a secure storage medium
- make security a design requirement for all application development

Integrating security into the application development life cycle will help reduce the number of vulnerabilities introduced in code. We encourage all development teams to ensure their applications are secure by default, and that they're making security requirements non-negotiable.

**Compute**

- secure access to virtual machines
- implement endpoint protection and keep systems patched and current

Malware, unpatched systems, and improperly secured systems open your environment to attacks. The focus in this layer is on making sure your compute resources are secure, and that you have the proper controls in place to minimize security issues.

**Networking**

- limit communications between resources
- deny by default
- restrict inbound internet access and limit outbound, where appropriate
- implement secure connectivity to on-premises networks

At this layer, the focus is on limiting the network connectivity across all your resources to allow only what is required. By limiting this communication, you reduce the risk of lateral movement throughout your network.

**Perimeter**

- use DDoS protection to filter large-scale attacks before they can cause a denial of service for end users
- use perimeter firewalls to identify and alert on malicious attacks against your network

At the network perimeter, it's about protecting from network-based attacks against your resources. Identifying these attacks, eliminating their impact, and alerting you when they happen are important ways to keep your network secure.

**Identity and access**

- control access to infrastructure and change control
- use single sign-on and multi-factor authentication
- audit events and changes

The identity and access layer is all about ensuring identities are secure, access granted is only what is needed and changes are logged

**Physical security**

- physical security and controlling access to computing hardware within the data center is the first line of defense

With physical security, the intent is to provide physical safeguards against access to assets. These safeguards ensure that other layers can't be bypassed and loss or theft is handled appropriately.

### Azure firewall
A firewall is a service that grants server access based on the originating IP address of each request. You create firewall rules that specify ranges of IP addresses. Only clients from these granted IP addresses will be allowed to access the server. Firewall rules also include specific network protocol and port information.

Azure Firewall is a managed, cloud-based, network security service that protects your Azure Virtual Network resources. It is a fully statefui firewall as a service with built-in high availability and unrestricted cloud scalability.

You can create, enforce, and log, application and network connectivity policies across subscriptions, and virtual networks, centrally. Azure Firewall uses a static public IP address for your virtual network resources, which allows outside firewalls to identify traffic originating from your virtual network. The service is fully integrated with Azure Monitor for logging and analytics.

Azure Firewall provides many features, including:

- built-in high availability
- unrestricted cloud scalability
- inbound and outbound filtering rules
- azure monitor logging

**Common usage scenarios**
You typically deploy Azure Firewall on a central virtual network to control general network access. With Azure Firewall you can configure:

- application rules that define FQDNs that can be accessed from a subnet
- network rules that define source address, protocol, destination port, and destination address

### Azure DDoS protection
DDoS attacks attempt to overwhelm and exhaust an application's resources, making the application slow or unresponsive to legitimate users. DDoS attacks can be targeted at any endpoint that is publicly reachable through the internet. Thus, any resource exposed to the internet, such as a website, is potentially at risk from a DDoS attack.

When you combine Azure DDoS protection with application design best practices, you help provide defense against DDoS attacks. DDoS protection leverages the scale and elasticity of Microsoft's global network to bring DDoS mitigation capacity to every Azure region. The Azure DDoS Protection service protects your Azure applications by scrubbing traffic at the Azure network edge before it can impact your service's availability.

#### Service tiers
- **Basic** - automatically enabled as part of the Azure platform. Always-on traffic monitoring and real-time mitigation of common network-level attacks provide the same defenses that Microsoft's online services use. Azure's global network is used to distribute and mitigate attack traffic across regions
- **Standard** - provides additional mitigation capabilities that are tuned specifically to Microsoft Azure Virtual Network resources. DDoS Protection Standard is simple to enable and requires no application changes. Protection policies are tuned through dedicated traffic monitoring and machine learning algorithms. Policies are applied to public IP addresses which are associated with resources deployed in virtual networks, such as Azure Load Balancer and Application Gateway.

#### DDoS standard protection
DDoS standard protection can mitigate the following types of attacks:

- **Volumetric attacks.** The attack's goal is to flood the network layer with a substantial amount of seemingly legitimate traffic
- **Protocol attacks.** These attacks render a target inaccessible, by exploiting a weakness in the layer 3 and layer 4 protocol stack
- **Resource (application) layer attacks** These attacks target web application packets to disrupt the transmission of data between hosts.

### Network Security Groups
Allow you to filter traffic to and from Azure resources in an Azure virtual network. An NSG can contain multiple inbound and outbound security rules that enable you to filter traffic to and from resources by source and destination IP address, port, and protocol.

### Application Security Groups
Enable you to configure network security as a natural extension of an application's structure, allowing you to group virtual machines and define network security policies based on those groups.
This feature allows you to reuse your security policy at scale without manual maintenance of explicit IP addresses. The platform handles the complexity of explicit IP addresses and multiple rule sets, allowing you to focus on your business logic.

An Application Security Group enables you to group servers with similar port filtering requirements, and group together servers with similar functions, such as web servers.

Application Security Groups help you simplify how you can filter and control network traffic coming into your organization and how that network traffic is allowed to move. They allow you to isolate multiple workloads and provide additional levels of protection for your virtual network in a more easily manageable way.

### Choose Azure network security solutions
**Perimeter layer**
The network perimeter layer is about protecting organizations from network-based attacks against your resources. Identifying these attacks, alerting, and eliminating their impact is important to keep your network secure. To do this:

- use Azure DDoS protection to filter large-scale attacks before they can cause a denial of service for end users
- use perimeter firewalls with Azure Firewall to identify and alert on malicious attacks against your network

**Network layer**
At this layer, the focus is on limiting network connectivity across all your resources to only allow what is required. Segment your resources and use network-level controls to restrict communication to only what is needed. By restricting connectivity, you reduce the risk of lateral movement throughout your network from an attack. Use NSGs to create rules about inbound and outbound communication at this layer. As best practices:

- limit communication between resources through segmenting your network and configuring access controls
- deny by default
- restrict inbound internet access and limit outbound where appropriate
- implement secure connectivity to on-premises networks

**Combine services**
You can also combine multiple Azure networking and security services to manage your network security and provide increased layered protection.

- **Network security groups and Azure Firewall**. Azure Firewall complements network security group functionality. Together, they provide better defense-in-depth network security. Network security groups provide distributed network layer traffic filtering to limit traffic to resources within virtual networks in each subscription. Azure Firewall is a fully stateful, centralized network firewall-as-a-service, which provides network and application-level protection across different subscriptions and virtual networks.
- **Application Gateway WAF and Azure Firewall**. WAF is a feature of Application Gateway that provides your web applications with centralized, inbound protection against common exploits and vulnerabilities. Azure Firewall provides inbound protection for non-HTTP/S protocols (for example RDP, SSH, FTP), outbound network-level protection for all ports and protocols, and application-level protection for outbound HTTP/S. Combining both provides additional layers of protection.