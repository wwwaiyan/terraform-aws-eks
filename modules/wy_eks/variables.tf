variable "project_name" {
  description = "Project Name"
  type        = string
}
variable "env_prefix" {
  description = "Environment Prefix"
  type        = string
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
}
variable "eks_cluster_version" {
  description = "value of EKS Cluster Version"
  type        = string
}
variable "nodegroup_instance_types" {
  description = "value of NodeGroup Instance Types"
  type        = list(any)
}
variable "eks_addon_name" {
  # https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html
  description = "value of EKS Addon Name"
  type        = list(string)
  default     = []
}
#iam role
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
# variable "cluster_role_policy_arns" {
#   description = "Cluster Role Policy ARNs"
#   type        = list(string)
#   default = [
#     "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
#     "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
#   ]
# }
# variable "node_group_role_policy_arns" {
#   description = "Node Group Role Policy ARNs"
#   type        = list(string)
#   default = [
#     "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
#     "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
#     "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   ]
# }