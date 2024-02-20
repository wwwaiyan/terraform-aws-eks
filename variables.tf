#vpc
variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "demo"
}
variable "env_prefix" {
  description = "Environment Prefix"
  type        = string
  default     = "dev"
}
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.80.0.0/16"
}
#availability_zone
variable "azs" {
  description = "Availability Zone"
  type        = list(string)
  default     = []
}
#public_subnet
variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = list(string)
  default     = ["10.80.1.0/24", "10.80.2.0/24", "10.80.3.0/24"]
}
variable "map_public_ip_on_launch" {
  description = "Map Public IP on Launch"
  type        = bool
  default     = true
}
#private_subnet
variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = list(string)
  default     = ["10.80.4.0/24", "10.80.5.0/24", "10.80.6.0/24"]
}
variable "create_nat" {
  description = "Create NAT Gateway"
  type        = bool
  default     = true
}
variable "public_subnet_for_nat" {
  description = "Public Subnet for NAT Gateway"
  type        = number
  default     = 0
}
#eks
variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "terraformEKS"
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
  description = "value of EKS Addon Name"
  type        = list(string)
  default     = ["aws-ebs-csi-driver"]
}
variable "cluster_role_policy_arns" {
  description = "Cluster Role Policy ARNs"
  type        = list(string)
  default     = []
}
variable "node_group_role_policy_arns" {
  description = "Node Group Role Policy ARNs"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
}