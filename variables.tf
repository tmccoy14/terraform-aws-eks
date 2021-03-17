variable "cluster_role_name" {
  description = "The name of AWS EKS cluster role."
  type        = string
}

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(any)
  default     = {}
}

variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
}

variable "vpc_id" {
  description = "The VPC associated with your cluster."
  type        = string
}
