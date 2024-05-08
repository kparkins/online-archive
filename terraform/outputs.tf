output "cluster_srv_connection_string" {
  value = mongodbatlas_cluster.archive_cluster.connection_strings[0].standard_srv
}

output "cluster_standard_connection_string" {
  value = mongodbatlas_cluster.archive_cluster.connection_strings[0].standard
}
