---
controller:
  region: ${aws_region}
  k8sTagClusterId: ${cluster_name}
  serviceAccount:
    create: true
    name: ${k8s_sa_name}
    annotations:
      eks.amazonaws.com/role-arn: ${iam_role_arn}
