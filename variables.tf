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

variable "nodegroup_role_name" {
  description = "The name of AWS EKS nodegroup role."
  type        = string
}

variable "nodegroup_name" {
  description = "Name of the EKS Node Group."
  type        = string
}

variable "instance_types" {
  description = "List of instance types associated with the EKS Node Group."
  type        = string
  default     = "t3.medium"
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = string
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = string
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = string
}
