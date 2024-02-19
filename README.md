# terraform-aws-eks
This repo is created for eks cluster setup with managed node group.  
>“Note: This repo is intended for lab testing purposes, not for production. Additionally, it focuses on creating the cluster and does not cover cluster auto-scaling at this stage.”  


example usage:
```
module "vpc" {
  source                  = "github.com/wwwaiyan/terraform-aws-vpc/modules/wy_vpc"
  project_name            = var.project_name
  env_prefix              = var.env_prefix
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_subnet_cidr     = var.private_subnet_cidr
  create_nat              = var.create_nat #if you want to create nat gateway for private subnet, you need to set public_subnet_cidr
  public_subnet_for_nat   = var.public_subnet_for_nat
  azs                     = var.azs
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
locals {
  eks_subnets = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
}
module "eks" {
  source                   = "./modules/wy_eks"
  project_name             = var.project_name
  env_prefix               = var.env_prefix
  eks_cluster_subnets      = local.eks_subnets
  eks_nodegroup_subnets    = local.eks_subnets
  eks_cluster_name         = var.eks_cluster_name
  eks_cluster_version      = var.eks_cluster_version
  nodegroup_instance_types = var.nodegroup_instance_types
  eks_addon_name           = var.eks_addon_name
}
```  
In this case, it will create eks cluster with root module  
- VPC and subnets for EKS Cluster
- 1 EKS Cluster with managed node group  
Run <code>terraform plan</code> and <code>terraform apply</code> Commands  
we can check terraform state with <code>terraform refresh</code> command 
