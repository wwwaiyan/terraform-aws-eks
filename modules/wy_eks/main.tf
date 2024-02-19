locals {
  cluster_role_policy_arns    = concat(var.cluster_role_policy_arns, var.default_cluster_role_policy_arns)
  node_group_role_policy_arns = concat(var.node_group_role_policy_arns, var.default_node_group_role_policy_arns)
  # cluster_role_policy_arns = length(var.cluster_role_policy_arns) > 0 ? var.cluster_role_policy_arns : var.default_cluster_role_policy_arns
  # node_group_role_policy_arns = length(var.node_group_role_policy_arns) > 0 ? var.node_group_role_policy_arns : var.default_node_group_role_policy_arns
}
module "eks_iam" {
  source                      = "../eks_iam"
  project_name                = var.project_name
  env_prefix                  = var.env_prefix
  cluster_role_policy_arns    = local.cluster_role_policy_arns
  node_group_role_policy_arns = local.node_group_role_policy_arns
}
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${var.env_prefix}-${var.eks_cluster_name}"
  role_arn = module.eks_iam.eks_cluster_role_arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids              = var.eks_cluster_subnets
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }
  provisioner "local-exec" {
    command = " aws eks update-kubeconfig --name ${aws_eks_cluster.eks_cluster.name}"
  }

  depends_on = [module.eks_iam]
  tags = {
    Name        = "${var.project_name}-${var.env_prefix}-${var.eks_cluster_name}"
    Project     = var.project_name
    Environment = var.env_prefix
  }
}
resource "aws_eks_addon" "eks_addon" {
  count        = length(var.eks_addon_name) > 0 ? length(var.eks_addon_name) : 0
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_name[count.index]
  # addon_version = 
}
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-${var.env_prefix}-${var.eks_cluster_name}-node-group"
  node_role_arn   = module.eks_iam.eks_nodegroup_role_arn
  subnet_ids      = var.eks_nodegroup_subnets
  instance_types  = var.nodegroup_instance_types

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  depends_on = [module.eks_iam]
  lifecycle {
    create_before_destroy = true
  }
}