# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "cluster_role" {
  name               = var.cluster_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_cluster_role.json

  tags = var.tags
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER IAM POLICY
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER ROLE POLICY ATTACHMENT
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "cluster_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster_role.name
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER
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
