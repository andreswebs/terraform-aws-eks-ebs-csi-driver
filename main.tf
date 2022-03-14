/**
* Deploys the [Amazon EBS CSI driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html) on AWS EKS via Helm.
*/

module "iam" {
  source                = "./modules/iam"
  cluster_oidc_provider = var.cluster_oidc_provider
  k8s_sa_name           = var.k8s_sa_name
  k8s_namespace         = var.k8s_namespace
  iam_role_name         = var.iam_role_name
  kms_key_arn           = var.kms_key_arn
}

module "resources" {

  source                           = "./modules/resources"
  iam_role_arn                     = module.iam.role.arn
  k8s_sa_name                      = var.k8s_sa_name
  k8s_namespace                    = var.k8s_namespace
  chart_version_aws_ebs_csi_driver = var.chart_version_aws_ebs_csi_driver
  cluster_name                     = var.cluster_name

  helm_release_name        = var.helm_release_name
  helm_recreate_pods       = var.helm_recreate_pods
  helm_atomic_creation     = var.helm_atomic_creation
  helm_cleanup_on_fail     = var.helm_cleanup_on_fail
  helm_wait_for_completion = var.helm_wait_for_completion
  helm_wait_for_jobs       = var.helm_wait_for_jobs
  helm_timeout_seconds     = var.helm_timeout_seconds
  helm_max_history         = var.helm_max_history
  helm_verify              = var.helm_verify
  helm_keyring             = var.helm_keyring
  helm_reuse_values        = var.helm_reuse_values
  helm_reset_values        = var.helm_reset_values
  helm_force_update        = var.helm_force_update
  helm_replace             = var.helm_replace
  helm_create_namespace    = var.helm_create_namespace
  helm_dependency_update   = var.helm_dependency_update
  helm_skip_crds           = var.helm_skip_crds
}
