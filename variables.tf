// EKS CLUSTER IAM ROLE VARIABLES
variable "cluster_role_description" {
  description = "Description of the role."
  type        = string
  default     = null
}

variable "cluster_role_force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it."
  type        = bool
  default     = false
}

variable "cluster_role_managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role."
  type        = list(string)
  default     = []
}

variable "cluster_role_max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role."
  type        = number
  default     = null
}

variable "cluster_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "cluster_role_path" {
  description = "Path to the role."
  type        = string
  default     = null
}

variable "cluster_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

// EKS CLUSTER VARIABLES
variable "cluster_name" {
  description = "Name of the cluster."
  type        = string
}

variable "vpc_id" {
  description = "The VPC associated with your cluster."
  type        = string
}

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable."
  type        = list(string)
  default     = []
}

variable "endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "security_group_ids" {
  description = "List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane."
  type        = list(string)
  default     = []
}

variable "eks_version" {
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS."
  type        = string
  default     = null
}

// EKS CLUSTER NODE GROUP IAM ROLE VARIABLES
variable "nodegroup_role_description" {
  description = "Description of the role."
  type        = string
  default     = null
}

variable "nodegroup_role_force_detach_policies" {
  description = "Whether to force detaching any policies the role has before destroying it."
  type        = bool
  default     = false
}

variable "nodegroup_role_managed_policy_arns" {
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role."
  type        = list(string)
  default     = []
}

variable "nodegroup_role_max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role."
  type        = number
  default     = null
}

variable "nodegroup_role_name" {
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "nodegroup_role_path" {
  description = "Path to the role."
  type        = string
  default     = null
}

variable "nodegroup_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

// EKS CLUSTER NODE GROUP VARIABLES
variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group."
  type        = string
  default     = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes."
  type        = string
  default     = "20"
}

variable "instance_types" {
  description = "List of instance types associated with the EKS Node Group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "nodegroup_name" {
  description = "Name of the EKS Node Group."
  type        = string
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

variable "tags" {
  description = "Key-value mapping of resource tags."
  type        = map(any)
  default     = {}
}
