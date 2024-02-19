# EKS Cluster role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

#policy_attachment
resource "aws_iam_role_policy_attachment" "cluster_role_policy_attachment" {
  count      = length(var.cluster_role_policy_arns)
  policy_arn = element(var.cluster_role_policy_arns, count.index)
  role       = aws_iam_role.eks_cluster_role.name
}

# EKS Node Group role
resource "aws_iam_role" "eks_nodegroup_role" {
  name = "eks_nodegroup_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
#policy_attachment
resource "aws_iam_role_policy_attachment" "node_group_policy_attachment" {
  count      = length(var.node_group_role_policy_arns)
  policy_arn = element(var.node_group_role_policy_arns, count.index)
  role       = aws_iam_role.eks_nodegroup_role.name
}