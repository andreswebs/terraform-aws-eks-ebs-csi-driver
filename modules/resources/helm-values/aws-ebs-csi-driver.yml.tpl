---
controller:
  region: ${aws_region}
  k8sTagClusterId: ${eks_cluster_id}
  serviceAccount:
    create: true
    name: ${k8s_sa_name}
    annotations:
      role: ${iam_role_arn}
