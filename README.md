# terraform-aws-eks

Terraform module that defines an EKS cluster and node group with IAM roles and policies.

## Examples

```sh
module "eks" {
  source  = "tmccoy14/eks/aws"
  # pin a specific version found at:
  # https://github.com/tmccoy14/terraform-aws-eks/releases
  # https://registry.terraform.io/modules/tmccoy14/eks/aws/latest
  version = "x.x.x"

  cluster_name        = "testing-cluster"
  vpc_id              = "vpc-1234abcd"
  nodegroup_name      = "testing-nodegroup"
  desired_size        = "1"
  max_size            = "1"
  min_size            = "1"
}
```

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.14.0 |
| aws       | "~> 3.0"  |

## Resources

| Resource Name                                          |
| ------------------------------------------------------ |
| aws_eks_cluster.eks_cluster                            |
| aws_eks_node_group.eks_cluster_nodegroup               |
| aws_iam_role.cluster_role                              |
| aws_iam_role.nodegroup_role                            |
| aws_iam_role_policy_attachment.cluster_policy          |
| aws_iam_role_policy_attachment.cluster_service_policy  |
| aws_iam_role_policy_attachment.cni_policy              |
| aws_iam_role_policy_attachment.ecr_readonly_policy     |
| aws_iam_role_policy_attachment.worker_nodegroup_policy |

## Inputs

| Name                                 | Description                                                                                                                                                                                         | Type         | Default       | Required |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | ------------- | -------- |
| cluster_role_description             | Description of the role.                                                                                                                                                                            | string       | null          | false    |
| cluster_role_force_detach_policies   | Whether to force detaching any policies the role has before destroying it.                                                                                                                          | bool         | false         | false    |
| cluster_role_inline_policy           | Configuration block defining an exclusive set of IAM inline policies associated with the IAM role.                                                                                                  | map(any)     | {}            | false    |
| cluster_role_managed_policy_arns     | Set of exclusive IAM managed policy ARNs to attach to the IAM role.                                                                                                                                 | list(string) | []            | false    |
| cluster_role_max_session_duration    | Maximum session duration (in seconds) that you want to set for the specified role.                                                                                                                  | string       | null          | false    |
| cluster_role_name                    | Friendly name of the role. If omitted, Terraform will assign a random, unique name.                                                                                                                 | string       | null          | false    |
| cluster_role_permissions_boundary    | ARN of the policy that is used to set the permissions boundary for the role.                                                                                                                        | string       | null          | false    |
| cluster_name                         | Name of the cluster.                                                                                                                                                                                | string       |               | true     |
| vpc_id                               | The VPC associated with your cluster.                                                                                                                                                               | string       |               | true     |
| enable_cluster_log_type              | A list of the desired control plane logging to enable.                                                                                                                                              | list(string) | []            | flase    |
| endpoint_private_access              | Indicates whether or not the Amazon EKS private API server endpoint is enabled.                                                                                                                     | bool         | false         | false    |
| endpoint_public_access               | Indicates whether or not the Amazon EKS public API server endpoint is enabled.                                                                                                                      | bool         | false         | false    |
| public_access_cidrs                  | List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled.                                                                                 | list(string) | ["0.0.0.0/0]  | false    |
| security_group_ids                   | List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane.       | list(string) | []            | false    |
| eks_version                          | Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. | string       | null          | false    |
| nodegroup_role_description           | Description of the role.                                                                                                                                                                            | string       | null          | false    |
| nodegroup_role_force_detach_policies | Whether to force detaching any policies the role has before destroying it.                                                                                                                          | bool         | false         | false    |
| nodegroup_role_inline_policy         | Configuration block defining an exclusive set of IAM inline policies associated with the IAM role.                                                                                                  | map(any)     | {}            | false    |
| nodegroup_role_managed_policy_arns   | Set of exclusive IAM managed policy ARNs to attach to the IAM role.                                                                                                                                 | list(string) | []            | false    |
| nodegroup_role_max_session_duration  | Maximum session duration (in seconds) that you want to set for the specified role.                                                                                                                  | string       | null          | false    |
| nodegroup_role_name                  | The name of AWS EKS nodegroup role.                                                                                                                                                                 | string       | null          | false    |
| nodegroup_role_permissions_boundary  | ARN of the policy that is used to set the permissions boundary for the role.                                                                                                                        | string       | null          | false    |
| desired_size                         | Desired number of worker nodes.                                                                                                                                                                     | string       |               | true     |
| max_size                             | Maximum number of worker nodes.                                                                                                                                                                     | string       |               | true     |
| min_size                             | Minimum number of worker nodes.                                                                                                                                                                     | string       |               | true     |
| nodegroup_name                       | Name of the EKS Node Group.                                                                                                                                                                         | string       |               | true     |
| instance_types                       | List of instance types associated with the EKS Node Group.                                                                                                                                          | list(string) | ["t3.medium"] | false    |
| ami_type                             | Type of Amazon Machine Image (AMI) associated with the EKS Node Group.                                                                                                                              | string       | "AL2_x86_64"  | false    |
| disk_size                            | Disk size in GiB for worker nodes.                                                                                                                                                                  | string       | "20"          | false    |
| tags                                 | Key-value mapping of resource tags.                                                                                                                                                                 | map(any)     | {}            | false    |

## Outputs

| Name                            | Description                                                                 |
| ------------------------------- | --------------------------------------------------------------------------- |
| autoscaling_groups              | List of objects containing information about AutoScaling Groups.            |
| autoscaling_groups_names        | Name of the AutoScaling Group.                                              |
| certificate-authority           | Nested attribute containing certificate-authority-data for your cluster.    |
| cluster_arn                     | The Amazon Resource Name (ARN) of the cluster.                              |
| cluster_id                      | The name of the cluster.                                                    |
| cluster_role_arn                | Amazon Resource Name (ARN) specifying the role.                             |
| cluster_role_create_date        | Creation date of the IAM role.                                              |
| cluster_role_id                 | ID of the role.                                                             |
| cluster_role_name               | Name of the role.                                                           |
| cluster_role_unique_id          | Stable and unique string identifying the role.                              |
| cluster_status                  | The status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED.   |
| endpoint                        | The endpoint for your Kubernetes API server.                                |
| identity                        | Nested attribute containing identity provider information for your cluster. |
| nodegroup_arn                   | Amazon Resource Name (ARN) of the EKS Node Group.                           |
| nodegroup_id                    | EKS Cluster name and EKS Node Group name separated by a colon (:).          |
| nodegroup_role_arn              | Amazon Resource Name (ARN) specifying the role.                             |
| nodegroup_role_create_date      | Creation date of the IAM role.                                              |
| nodegroup_role_id               | ID of the role.                                                             |
| nodegroup_role_name             | Name of the role.                                                           |
| nodegroup_role_unique_id        | Stable and unique string identifying the role.                              |
| nodegroup_status                | Status of the EKS Node Group.                                               |
| platform_version                | The platform version for the cluster.                                       |
| remote_access_security_group_id | Identifier of the remote access EC2 Security Group.                         |
| version                         | The Kubernetes server version for the cluster.                              |
| vpc_config                      | Additional nested attributes.                                               |
