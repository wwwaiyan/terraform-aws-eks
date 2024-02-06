variable "project_name" {
    description = "Project Name"
    type = string
}
variable "env_prefix" {
    description = "Environment Prefix"
    type = string
}
variable "eks_cluster_subnets" {
    description = "EKS Cluster Subnets"
    type = list(string)
}
variable "eks_nodegroup_subnets" {
    description = "EKS NodeGroup Subnets"
    type = list(string)
  
}
variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type = string
}
variable "eks_cluster_version" {
  description = "value of EKS Cluster Version"
  type = string
}
variable "nodegroup_instance_types" {
  description = "value of NodeGroup Instance Types"
  type = list
}