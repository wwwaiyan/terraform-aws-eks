output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}
output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}
output "eks_cluster_status" {
  value = module.eks.eks_cluster_status
}
output "eks_cluster_created_at" {
  value = module.eks.eks_cluster_created_at
}
output "eks_node_group_name" {
  value = module.eks.eks_node_group_name
}
output "eks_node_group_status" {
  value = module.eks.eks_node_group_status
}