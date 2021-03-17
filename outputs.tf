// EKS CLUSTER IAM ROLE OUTPUTS
output "cluster_role_arn" {
  value       = aws_iam_role.cluster_role.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "cluster_role_create_date" {
  value       = aws_iam_role.cluster_role.create_date
  description = "Creation date of the IAM role."
}

output "cluster_role_id" {
  value       = aws_iam_role.cluster_role.id
  description = "ID of the role."
}

output "cluster_role_name" {
  value       = aws_iam_role.cluster_role.name
  description = "Name of the role."
}

output "cluster_role_unique_id" {
  value       = aws_iam_role.cluster_role.unique_id
  description = "Stable and unique string identifying the role."
}

// EKS CLUSTER OUTPUTS
output "cluster_id" {
  value       = aws_eks_cluster.eks_cluster.id
  description = "The name of the cluster."
}

output "cluster_arn" {
  value       = aws_eks_cluster.eks_cluster.arn
  description = "The Amazon Resource Name (ARN) of the cluster."
}

output "certificate_authority" {
  value       = aws_eks_cluster.eks_cluster.certificate_authority
  description = "Nested attribute containing certificate-authority-data for your cluster."
}

output "endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
  description = "The endpoint for your Kubernetes API server."
}

output "identity" {
  value       = aws_eks_cluster.eks_cluster.identity
  description = "Nested attribute containing identity provider information for your cluster. Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019."
}

output "platform_version" {
  value       = aws_eks_cluster.eks_cluster.platform_version
  description = "The platform version for the cluster."
}

output "cluster_status" {
  value       = aws_eks_cluster.eks_cluster.status
  description = "The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
}

output "version" {
  value       = aws_eks_cluster.eks_cluster.version
  description = "The Kubernetes server version for the cluster."
}

output "vpc_config" {
  value       = aws_eks_cluster.eks_cluster.vpc_config
  description = "Additional nested attributes."
}

// EKS CLUSTER NODE GROUP IAM ROLE OUTPUTS
output "nodegroup_role_arn" {
  value       = aws_iam_role.nodegroup_role.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "nodegroup_role_create_date" {
  value       = aws_iam_role.nodegroup_role.create_date
  description = "Creation date of the IAM role."
}

output "nodegroup_role_id" {
  value       = aws_iam_role.nodegroup_role.id
  description = "ID of the role."
}

output "nodegroup_role_name" {
  value       = aws_iam_role.nodegroup_role.name
  description = "Name of the role."
}

output "nodegroup_role_unique_id" {
  value       = aws_iam_role.nodegroup_role.unique_id
  description = "Stable and unique string identifying the role."
}

// EKS CLUSTER NODE GROUP OUTPUTS
output "nodegroup_arn" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.arn
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
}
output "nodegroup_id" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.id
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
}
output "autoscaling_groups" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources[0]
  description = "List of objects containing information about AutoScaling Groups."
}
output "autoscaling_groups_names" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources[1]
  description = "Name of the AutoScaling Group."
}
output "remote_access_security_group_id" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources[2]
  description = "Identifier of the remote access EC2 Security Group."
}
output "nodegroup_status" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.status
  description = "Status of the EKS Node Group."
}
