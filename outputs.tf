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
output "id" {
  value       = aws_eks_cluster.eks_cluster.id
  description = "The name of the cluster."
}

output "arn" {
  value       = aws_eks_cluster.eks_cluster.arn
  description = "The Amazon Resource Name (ARN) of the cluster."
}

output "certificate-authority-data" {
  value       = aws_eks_cluster.eks_cluster.certificate_authority.data
  description = "Nested attribute containing certificate-authority-data for your cluster."
}

output "endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
  description = "The endpoint for your Kubernetes API server."
}

output "identity_oidc" {
  value       = aws_eks_cluster.eks_cluster.identity.oidc
  description = "Nested attribute containing identity provider information for your cluster. Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019."
}

output "idenetity_issuer" {
  value       = aws_eks_cluster.eks_cluster.identity.issuer
  description = "Issuer URL for the OpenID Connect identity provider."
}

output "platform_version" {
  value       = aws_eks_cluster.eks_cluster.platform_version
  description = "The platform version for the cluster."
}

output "status" {
  value       = aws_eks_cluster.eks_cluster.status
  description = "The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED."
}

output "version" {
  value       = aws_eks_cluster.eks_cluster.version
  description = "The Kubernetes server version for the cluster."
}

output "cluster_security_group_id" {
  value       = aws_eks_cluster.eks_cluster.vpc_config.cluster_security_group_id
  description = "The cluster security group that was created by Amazon EKS for the cluster."
}

output "vpc_id" {
  value       = aws_eks_cluster.eks_cluster.vpc_config.vpc_id
  description = "The VPC associated with your cluster."
}

// EKS CLUSTER NODEGROUP IAM ROLE OUTPUTS
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

// EKS CLUSTER NODEGROUP OUTPUTS
output "arn" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.arn
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
}
output "id" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.id
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
}
output "autoscaling_groups" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources.autoscaling_groups
  description = "List of objects containing information about AutoScaling Groups."
}
output "name" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources.name
  description = "Name of the AutoScaling Group."
}
output "remote_access_security_group_id" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.resources.remote_access_security_group_id
  description = "Identifier of the remote access EC2 Security Group."
}
output "status" {
  value       = aws_eks_node_group.eks_cluster_nodegroup.status
  description = "Status of the EKS Node Group."
}
