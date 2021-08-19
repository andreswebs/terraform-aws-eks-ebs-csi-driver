/**
* Deploys IAM resources for the Amazon EBS CSI driver.
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

  }
}

locals {
  iam_role_name = var.iam_role_name == "" ? null : var.iam_role_name
  kms_key_arn = var.kms_key_arn == "" ? null : var.kms_key_arn
}

module "assume_role_policy" {
  source                = "andreswebs/eks-irsa-policy-document/aws"
  version               = "1.0.0"
  k8s_sa_name           = var.k8s_sa_name
  k8s_sa_namespace      = var.k8s_namespace
  cluster_oidc_provider = var.cluster_oidc_provider
}

resource "aws_iam_role" "this" {
  name               = local.iam_role_name
  assume_role_policy = module.assume_role_policy.json
}

resource "aws_iam_role_policy" "ebs_permissions" {
  name   = "ebs-permissions"
  role   = aws_iam_role.this.id
  policy = file("${path.module}/policies/ebs-permissions.json")
}

resource "aws_iam_role_policy" "kms_permissions" {
  count = local.kms_key_arn != null ? 1 : 0
  name   = "kms-permissions"
  role   = aws_iam_role.this.id
  policy = templatefile("${path.module}/policies/kms-permissions.json.tpl", {
    kms_key_arn = local.kms_key_arn
  })
}
