variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "terraform_aws_eks"
}
variable "env_prefix" {
  description = "Environment Prefix"
  type        = string
  default     = "test"
}
##subnets
variable "eks_cluster_subnets" {
  description = "EKS Cluster Subnets"
  type        = list(string)
}
variable "eks_nodegroup_subnets" {
  description = "EKS NodeGroup Subnets"
  type        = list(string)

}
variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "wwwaiyan-terraform-eks-cluster"
}
variable "eks_cluster_version" {
  description = "value of EKS Cluster Version"
  type        = string
  default     = "1.28"
}
variable "nodegroup_instance_types" {
  description = "value of NodeGroup Instance Types"
  type        = list(any)
  default     = ["t3.small"]
}
variable "eks_addon_name" {
  # https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html
  description = "value of EKS Addon Name"
  type        = list(string)
  default     = []
}
#iam role
# https://docs.aws.amazon.com/eks/latest/userguide/using-service-linked-roles.html
# https://docs.aws.amazon.com/aws-managed-policy/latest/reference/policy-list.html
variable "default_cluster_role_policy_arns" {
  description = "Cluster Role Policy ARNs"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  ]
}
variable "default_node_group_role_policy_arns" {
  description = "Node Group Role Policy ARNs"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}
variable "cluster_role_policy_arns" {
  description = "Cluster Role Policy ARNs"
  type        = list(string)
  default     = []
}
variable "node_group_role_policy_arns" {
  description = "Node Group Role Policy ARNs"
  type        = list(string)
  default     = []
}