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
