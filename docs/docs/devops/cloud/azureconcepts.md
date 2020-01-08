# Azure Concepts - Linux Academy

## Fault Tolerance
A system's ability to continue operating properly when one or more of its components fail,

### Proactive
- regularly back up data/apps/resources
- deploy to multiple availability zones or regions
- load balance across multiple availability zones or regions
- monitor health of data/apps/resources

### Reactive
- restore data/apps/resources to different availability zones or regions
- deploy to different availability zones or regions

## Disaster Recovery
A system's ability to back up and restore data/apps/resources when needed

### Can use Azure to restore
- on-premises to on-premises
- on-premises to Azure
- other cloud to Azure
- Azure to Azure

## Subscriptions
- you can have more than one
- covers resources in multiple Azure regions
- can contain tenants and multiple resource groups and resources

## Tenant
- other name is Azure Active Directory
- has users and groups

## Azure Active Directory
- has users, groups, controls access to resources
- Azure Active Directory is like an org chart, phonebook, and access list all rolled into one service
- allows you to have a single source of truth for all of your businesses applications
- integrates with many applications like Skype for business and office 365

## Virtual Networks
- very closely mimic the setup, configuration, and architecture of networks in on-premise locations
- each subscription and region can have many virtual networks
- can be combined and structured in many different ways to achieve a comprehensive and complex network design

## Azure Storage
- gives you a secure and highly-available method to access almost all documents and data generated within your Azure cloud
- organized into "Accounts"
- further organized into types of storage:
    - Blobs
    - Tables
    - Queues
    - Files
- also includes SQL databases and Data Lakes