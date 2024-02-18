variable "project_name" {
    description = "Project Name"
    type = string
}
variable "env_prefix" {
    description = "Environment Prefix"
    type = string
}
variable "cluster_role_policy_arns" {
    description = "Cluster Role Policy ARNs"
    type = list(string)
    default = [
        "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
        "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    ]
}
variable "node_group_role_policy_arns" {
   description = "Node Group Role Policy ARNs"
   type = list(string)
   default = [ 
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
   ]
}