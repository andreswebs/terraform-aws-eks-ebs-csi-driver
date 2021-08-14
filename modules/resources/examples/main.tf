module "aws_ebs_csi_driver_resources" {
  source                           = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver//modules/resources"
  cluster_name                     = var.eks_cluster_id
  iam_role_arn                     = var.aws_ebs_csi_driver_iam_role_arn
  chart_version_aws_ebs_csi_driver = var.chart_version_aws_ebs_csi_driver
}