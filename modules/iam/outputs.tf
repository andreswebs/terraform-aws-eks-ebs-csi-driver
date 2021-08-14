output "role" {
  description = "IAM role for the Kubernetes service account"
  value = aws_iam_role.this
}
