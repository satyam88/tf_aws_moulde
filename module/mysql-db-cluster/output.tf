output "cluster_endpoint" {
  description = "Cluster writer endpoint"
  value       = aws_rds_cluster.this.endpoint
}

output "reader_endpoint" {
  description = "Cluster reader endpoint"
  value       = aws_rds_cluster.this.reader_endpoint
}

output "cluster_id" {
  description = "Cluster ID"
  value       = aws_rds_cluster.this.id
}
