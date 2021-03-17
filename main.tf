# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER IAM ROLE
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_iam_role" "cluster_role" {
  name               = var.cluster_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_cluster_role.json

  tags = var.tags
}
