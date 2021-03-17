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

  cluster_role_name   = "testing-cluster-role"
  cluster_name        = "testing-cluster"
  vpc_id              = "vpc-1234abcd"
  nodegroup_role_name = "testing-nodegroup-role"
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

| Name                | Description                                                | Type         | Default       | Required |
| ------------------- | ---------------------------------------------------------- | ------------ | ------------- | -------- |
| cluster_name        | Name of the cluster.                                       | string       |               | true     |
| cluster_role_name   | The name of AWS EKS cluster role                           | string       |               | true     |
| desired_size        | Desired number of worker nodes.                            | string       |               | true     |
| max_size            | Maximum number of worker nodes.                            | string       |               | true     |
| min_size            | Minimum number of worker nodes.                            | string       |               | true     |
| nodegroup_name      | Name of the EKS Node Group.                                | string       |               | true     |
| nodegroup_role_name | The name of AWS EKS nodegroup role.                        | string       |               | true     |
| vpc_id              | The VPC associated with your cluster.                      | string       |               | true     |
| instance_types      | List of instance types associated with the EKS Node Group. | list(string) | ["t3.medium"] | false    |
| tags                | Key-value mapping of resource tags.                        | map(any)     | {}            | false    |

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
