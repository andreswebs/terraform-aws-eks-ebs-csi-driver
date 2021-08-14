module "aws_ebs_csi_driver_resources" {
  source                           = "github.com/andreswebs/terraform-aws-eks-ebs-csi-driver//modules/resources"
  k8s_namespace                    = "kube-system"
  iam_role_arn                     = var.aws_ebs_csi_driver_iam_role_arn
  chart_version_aws_ebs_csi_driver = var.chart_version_aws_ebs_csi_driver
}