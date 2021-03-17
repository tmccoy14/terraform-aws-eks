# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN EKS CLUSTER IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "cluster_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_cluster_role.json

  tags = var.tags
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
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = data.aws_subnet_ids.public.ids
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
  assume_role_policy = data.aws_iam_policy_document.assume_nodegroup_role.json

  tags = var.tags
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
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.nodegroup_name
  node_role_arn   = aws_iam_role.nodegroup_role.arn
  subnet_ids      = data.aws_subnet_ids.public.ids

  instance_types = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.worker_nodegroup_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_readonly_policy,
  ]

  tags = var.tags
}
