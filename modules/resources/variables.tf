variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace on which to install Chartmuseum"
  default     = "kube-system"
}

variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account used by Chartmuseum"
  default     = "ebs-csi-controller"
}

variable "iam_role_arn" {
  type        = string
  description = "ARN of the IAM role used by the Kubernetes service account"
  default     = ""
}

variable "chart_version_aws_ebs_csi_driver" {
  type        = string
  description = "Chart version"
  default     = null
}

variable "helm_release_name" {
  type        = string
  description = "Release name"
  default     = "aws-ebs-csi-driver"
}

variable "helm_max_history" {
  type        = number
  description = "Maximum number of release versions stored per release; `0` means no limit"
  default     = 3
}

variable "helm_timeout_seconds" {
  type        = number
  description = "Time in seconds to wait for any individual kubernetes operation"
  default     = 300
}

variable "helm_recreate_pods" {
  type        = bool
  description = "Perform pods restart during upgrade/rollback ?"
  default     = true
}

variable "helm_atomic_creation" {
  type        = bool
  description = "Purge resources on installation failure ? The wait flag will be set automatically if atomic is used"
  default     = true
}

variable "helm_cleanup_on_fail" {
  type        = bool
  description = "Deletion new resources created in this upgrade if the upgrade fails ?"
  default     = true
}

variable "helm_wait_for_completion" {
  type        = bool
  description = "Wait until all resources are in a ready state before marking the release as successful ?"
  default     = true
}

variable "helm_wait_for_jobs" {
  type        = bool
  description = "Wait until all Jobs have been completed before marking the release as successful ?"
  default     = true
}

variable "helm_verify" {
  type        = bool
  description = "Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart"
  default     = false
}

variable "helm_keyring" {
  type        = string
  description = "Location of public keys used for verification; used only if verify is true"
  default     = ".gnupg/pubring.gpg"
}

variable "helm_reuse_values" {
  type        = bool
  description = "When upgrading, reuse the last release's values and merge any overrides ? If 'reset_values' is specified, this is ignored"
  default     = false
}

variable "helm_reset_values" {
  type        = bool
  description = "When upgrading, reset the values to the ones built into the chart ?"
  default     = false
}

variable "helm_force_update" {
  type        = bool
  description = "Force resource update through delete/recreate if needed ?"
  default     = false
}

variable "helm_create_namespace" {
  type        = bool
  description = "Create the namespace if it does not yet exist ?"
  default     = true
}

variable "helm_replace" {
  type        = bool
  description = "Re-use the given name, even if that name is already used; this is unsafe in production"
  default     = false
}

variable "helm_dependency_update" {
  type        = bool
  description = "Run helm dependency update before installing the chart ?"
  default     = false
}

variable "helm_skip_crds" {
  type        = bool
  description = "Skip installing CRDs ?"
  default     = false
}
