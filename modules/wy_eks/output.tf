output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
output "eks_cluster_status" {
  value = aws_eks_cluster.eks_cluster.status
}
output "eks_cluster_created_at" {
  value = aws_eks_cluster.eks_cluster.created_at
}
output "eks_node_group_name" {
  value = aws_eks_node_group.eks_node_group.node_group_name
}
output "eks_node_group_status" {
  value = aws_eks_node_group.eks_node_group.status
}