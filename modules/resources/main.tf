/**
* Deploys the Amazon EBS CSI driver Helm chart.
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }

  }
}

data "aws_region" "current" {}

resource "helm_release" "this" {

  name       = var.helm_release_name
  namespace  = var.k8s_namespace
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  version    = var.chart_version_aws_ebs_csi_driver

  recreate_pods     = var.helm_recreate_pods
  atomic            = var.helm_atomic_creation
  cleanup_on_fail   = var.helm_cleanup_on_fail
  wait              = var.helm_wait_for_completion
  wait_for_jobs     = var.helm_wait_for_jobs
  timeout           = var.helm_timeout_seconds
  max_history       = var.helm_max_history
  verify            = var.helm_verify
  keyring           = var.helm_keyring
  reuse_values      = var.helm_reuse_values
  reset_values      = var.helm_reset_values
  force_update      = var.helm_force_update
  replace           = var.helm_replace
  create_namespace  = var.helm_create_namespace
  dependency_update = var.helm_dependency_update
  skip_crds         = var.helm_skip_crds

  values = [
    templatefile("${path.module}/helm-values/aws-ebs-csi-driver.yml.tpl", {
      aws_region   = data.aws_region.current.name
      cluster_name = var.cluster_name
      k8s_sa_name  = var.k8s_sa_name
      iam_role_arn = var.iam_role_arn
    })
  ]

}

