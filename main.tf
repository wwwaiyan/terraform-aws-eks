module "vpc" {
  source                  = "github.com/wwwaiyan/terraform-aws-vpc/modules/wy_vpc"
  project_name            = var.project_name
  env_prefix              = var.env_prefix
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_subnet_cidr     = var.private_subnet_cidr
  create_nat              = var.create_nat #required public_subnet_cidr
  public_subnet_for_nat   = var.public_subnet_for_nat
  azs                     = var.azs
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
locals {
  eks_subnets = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
}
module "eks" {
  source                      = "github.com/wwwaiyan/terraform-aws-eks/modules/wy_eks"
  project_name                = var.project_name
  env_prefix                  = var.env_prefix
  eks_cluster_subnets         = local.eks_subnets
  eks_nodegroup_subnets       = local.eks_subnets
  eks_cluster_name            = var.eks_cluster_name
  eks_cluster_version         = var.eks_cluster_version
  nodegroup_instance_types    = var.nodegroup_instance_types
  eks_addon_name              = var.eks_addon_name
  cluster_role_policy_arns    = var.cluster_role_policy_arns
  node_group_role_policy_arns = var.node_group_role_policy_arns
}