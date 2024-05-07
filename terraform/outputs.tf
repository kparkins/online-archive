output "cluster_connection_string" {
  value = mongodbatlas_cluster.archive_cluster.connection_strings[0].standard_srv
}

