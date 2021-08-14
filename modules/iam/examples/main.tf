module "aws_ebs_csi_driver_iam" {
  source                      = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver//modules/iam"
  cluster_oidc_provider       = var.eks_cluster_oidc_provider
  k8s_namespace               = "kube-system"
  iam_role_name               = "ebs-csi-controller-${var.eks_cluster_id}"
}