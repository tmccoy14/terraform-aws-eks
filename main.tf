# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "cluster_role" {
  assume_role_policy    = data.aws_iam_policy_document.assume_cluster_role.json
  description           = var.cluster_role_description
  force_detach_policies = var.cluster_role_force_detach_policies
  managed_policy_arns   = var.cluster_role_managed_policy_arns
  max_session_duration  = var.cluster_role_max_session_duration
  name                  = var.cluster_role_name
  path                  = var.cluster_role_path
  permissions_boundary  = var.cluster_role_permissions_boundary
  tags                  = var.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER IAM ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER IAM ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "cluster_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_eks_cluster" "eks_cluster" {
  enabled_cluster_log_types = var.enabled_cluster_log_types
  name                      = var.cluster_name
  role_arn                  = aws_iam_role.cluster_role.arn
  version                   = var.eks_version
  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = var.security_group_ids
    subnet_ids              = data.aws_subnet_ids.public.ids
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy,
    aws_iam_role_policy_attachment.cluster_service_policy,
  ]
  tags = var.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER NODE GROUP IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "nodegroup_role" {
  assume_role_policy    = data.aws_iam_policy_document.assume_nodegroup_role.json
  description           = var.nodegroup_role_description
  force_detach_policies = var.nodegroup_role_force_detach_policies
  managed_policy_arns   = var.nodegroup_role_managed_policy_arns
  max_session_duration  = var.nodegroup_role_max_session_duration
  name                  = var.nodegroup_role_name
  path                  = var.nodegroup_role_path
  permissions_boundary  = var.nodegroup_role_permissions_boundary
  tags                  = var.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER NODE GROUP IAM ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "worker_nodegroup_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodegroup_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER NODE GROUP IAM ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodegroup_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER NODE GROUP IAM ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ecr_readonly_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodegroup_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER NODE GROUP
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_eks_node_group" "eks_cluster_nodegroup" {
  ami_type        = var.ami_type
  cluster_name    = aws_eks_cluster.eks_cluster.name
  disk_size       = var.disk_size
  instance_types  = var.instance_types
  node_group_name = var.nodegroup_name
  node_role_arn   = aws_iam_role.nodegroup_role.arn
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  subnet_ids = data.aws_subnet_ids.public.ids
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.worker_nodegroup_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_readonly_policy,
  ]
  tags = var.tags
}
