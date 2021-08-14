module "aws_ebs_csi_driver" {
  source                           = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver"
  cluster_name                     = var.eks_cluster_id
  cluster_oidc_provider            = var.eks_cluster_oidc_provider
  iam_role_name                    = "ebs-csi-controller-${var.eks_cluster_id}"
  chart_version_aws_ebs_csi_driver = var.chart_version_aws_ebs_csi_driver
}