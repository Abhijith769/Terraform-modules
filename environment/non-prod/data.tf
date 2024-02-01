data "null_data_source" "wait_for_cluster_and_kubernetes_configmap" {
  inputs = {
    cluster_name             = module.eks_cluster.eks_cluster_id
    kubernetes_config_map_id = module.eks_cluster.kubernetes_config_map_id
  }
}

data "aws_iam_policy_document" "bastion_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "jenkins_role" {

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "jenkins-ecr-policy" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:*",
      "cloudtrail:LookupEvents"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:CreateServiceLinkedRole"
    ]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values   = ["replication.ecr.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "jenkins-ecrfullaccess-policy" {
  name        = "jenkins-ecrfullaccess-policy"
  description = "Policy for AmazonEC2ContainerRegistryFullAccess for jenkins ec2"
  policy      = data.aws_iam_policy_document.jenkins-ecr-policy.json
}