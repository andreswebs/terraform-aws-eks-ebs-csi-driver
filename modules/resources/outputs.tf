output "namespace" {
  value       = helm_release.this.metadata[0].namespace
  description = "The name (`metadata.name`) of the Kubernetes namespace"
}

output "release" {
  description = "Helm release"
  value       = helm_release.this
}
