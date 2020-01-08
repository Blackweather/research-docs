# Microsoft Azure Infrastructure and Deployment - Exam AZ-100 - Linux Academy

## Azure Terminology

**Subscription** - agreement with Microsoft to use Azure resources and incur charges based on cloud resource consumption. You can have multiple subscriptions tied to a single directory.

**Directory** - Azure AD to manage and authenticate users and groups within Azure. Global Administrators can access Azure AD to centrally manage all users, groups and applications within the organization. Tenants reside within a directory.

**Resource Group** - logical group of resources - instances of service or services. Each type of service, when instantiated, turns into a resource. A resource then must be placed into a resource group and deployed associated with your directory. All resource groups should share the same lifecycle.

**Virtual Network** - allows many Azure resources to securely communicate with each other, over the internet, or within an on-premises network. You can create many virtual networks within each directory in addition to subnets to further segregate traffic between resources.

**Network Security Group** - allows you to filter network traffic between resources within a virtual network. You can appliy security rules to allow or deny traffic to or from a resource. A network security group can be associated to a network interface, a subnet, or both.

**Azure Active Directory** - Microsoft's multi-tenant, cloud-based, directory, and identity management service. Azure AD helps you with giving access to team members working in Azure, and also allowing customers to access your Azure apps.

**Azure Resource Manager** (ARM) - allows you to group all of your resources together and form a template for quick and easy deployment(s) of these resources. A resource manager template is a JSON file that can be used in a template deployment scenario.

**Azure Storage Blob** - essentially buckets or containers for data. Location to store unstructured data. Blob storage can be scaled up or down, depending on the need, and can contain images, video, audio or documents for long term storage (archive), or short term retrieval needs.

**App Services** - collection of services for deploying applications in the application language of your choice. You can deploy web apps, mobile or web APIs. Azure's platform as a service offering.

## Regions, Zones & Sets

**Availability Sets** - virtual machines in redundant hardware groups to ensure high availability and fault tolerance against individual hardware failure

**Fault domains** - components that share the same rack within a data center

**Update domains** - protects VMs from restarting, because of a need to update the hypervisor (Azure will never restart more than 1 update domain at a time)
<br/><br/>

**Scale sets** - a group of identical virtual machines that increase or decrease capacity when needed according to a set of rules

## Subscriptions policies
Policies ensure that all of our resources are uniform with the company standards, keep billing consistent, and prevent shadow IT

- can be applied to existing resources as well as newly created resources
- for multiple subscriptions, the location must be the management group that contains the subscriptions you assign the policy to

### Policies examples
- enforce tags
- enforce SKUs
- enforce location
- enforce resource type
- enforce security
