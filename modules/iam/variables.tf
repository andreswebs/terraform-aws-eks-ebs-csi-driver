variable "cluster_oidc_provider" {
  type        = string
  description = "OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster"
  default     = ""
}

variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace on which to install"
  default     = "kube-system"
}

variable "k8s_sa_name" {
  type        = string
  description = "Name of the Kubernetes service account"
  default     = "ebs-csi-controller"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name"
  default     = "ebs-csi-controller"
}
