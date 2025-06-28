resource "aws_rds_cluster" "this" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-mysql"
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  db_subnet_group_name    = var.db_subnet_group_name
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot     = var.skip_final_snapshot

  tags = merge(
    var.tags,
    {
      Name = var.cluster_identifier
    }
  )
}

resource "aws_rds_cluster_instance" "this" {
  count                   = var.instance_count
  identifier              = "${var.cluster_identifier}-${count.index + 1}"
  cluster_identifier      = aws_rds_cluster.this.id
  instance_class          = var.instance_class
  engine                  = aws_rds_cluster.this.engine
  engine_version          = aws_rds_cluster.this.engine_version
  publicly_accessible     = var.publicly_accessible
  db_subnet_group_name    = var.db_subnet_group_name
  tags                    = var.tags
}
