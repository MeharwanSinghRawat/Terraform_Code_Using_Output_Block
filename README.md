# Terraform_Code_Using_Output_Block
Terraform setup for Azure infrastructure including a resource group,  a VNet, two subnets, two public IPs, a n (NSG), NICs), and two virtual machines (VMs). The setup uses Azure Key Vault to securely store and access VM passwords. Additionally, it provisions an Azure SQL Server and a corresponding SQL database.

# 🌐 Terraform Azure Infrastructure Setup

This repository contains a modular Terraform setup to provision a complete infrastructure environment on **Microsoft Azure**. It uses a **parent-child module structure** to manage and deploy the following Azure resources:

---

## 📦 Provisioned Resources

- ✅ Resource Group
- ✅ Virtual Network (VNet)
- ✅ Two Subnets
- ✅ Two Public IPs
- ✅ Network Security Group (NSG)
- ✅ Two Network Interfaces (NICs)
- ✅ Two Linux Virtual Machines (VMs)
- ✅ Azure Key Vault (for secure VM password storage)
- ✅ Azure SQL Server
- ✅ Azure SQL Database

---

## 🏗️ Project Structure
.
├── module/
│ ├── azurerm_data_server/
│ ├── azurerm_database/
│ ├── azurerm_nic_module/
│ ├── azurerm_nsg/
│ ├── azurerm_public_ip_module/
│ ├── azurerm_resource_module/
│ ├── azurerm_subnet_module/
│ ├── azurerm_vm_module/
│ └── azurerm_vnet_module/
│
├── Parent_Module/
│ ├── main.tf
│ ├── provider.tf
│ ├── terraform.tfstate
│ └── terraform.tfstate.backup

Plan the Infrastructure
terraform plan

Apply the Configuration
terraform apply

🔐 Key Vault Integration
This project uses Azure Key Vault to securely store and access VM credentials. The azurerm_key_vault_secret resource is referenced inside the VM module to retrieve the admin password.