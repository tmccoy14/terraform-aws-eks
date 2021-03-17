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

output "certificate_authority" {
  value       = aws_eks_cluster.eks_cluster.certificate_authority
  description = "Nested attribute containing certificate-authority-data for your cluster."
}

output "data" {
  value       = aws_eks_cluster.eks_cluster.data
  description = "The base64 encoded certificate data required to communicate with your cluster. Add this to the certificate-authority-data section of the kubeconfig file for your cluster."
}

output "endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
  description = "The endpoint for your Kubernetes API server."
}

output "identity" {
  value       = aws_eks_cluster.eks_cluster.identity
  description = "Nested attribute containing identity provider information for your cluster. Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019."
}

output "oidc" {
  value       = aws_eks_cluster.eks_cluster.oidc
  description = "Nested attribute containing OpenID Connect identity provider information for the cluster."
}

output "issuer" {
  value       = aws_eks_cluster.eks_cluster.issuer
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

output "vpc_config" {
  value       = aws_eks_cluster.eks_cluster.vpc_config
  description = "Additional nested attributes:"
}

output "cluster_security_group_id" {
  value       = aws_eks_cluster.eks_cluster.cluster_security_group_id
  description = "The cluster security group that was created by Amazon EKS for the cluster."
}

output "vpc_id" {
  value       = aws_eks_cluster.eks_cluster.vpc_id
  description = "The VPC associated with your cluster."
}
