# terraform-aws-eks
This repo is created for eks cluster setup with managed node group.  
>“Note: This repo is intended for lab testing purposes, not for production. Additionally, it focuses on creating the cluster and does not cover cluster auto-scaling at this stage.”  


example usage:
```
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