resource "mongodbatlas_cluster" "archive_cluster" {
  project_id                = var.atlas_proj_id 
  name                      = var.atlas_cluster_name 
  disk_size_gb              = var.atlas_cluster_disk_size_gb
  provider_instance_size_name = var.atlas_cluster_provider_instance_size
  provider_name             = var.atlas_cluster_provider_name
  provider_region_name      = var.atlas_cluster_provider_region_name

  provisioner "local-exec" {
   command =<<EOF
      ansible-playbook -v -i ../ansible/inventory.yml ../ansible/load-data.yml \
        --extra-vars '@atlas.tfvars.json' \
        --extra-vars atlas_connection_string=${mongodbatlas_cluster.archive_cluster.connection_strings[0].standard_srv}
EOF
  }
}

resource "mongodbatlas_online_archive" "archive" {
  project_id   = var.atlas_proj_id 
  cluster_name = mongodbatlas_cluster.archive_cluster.name
  db_name      = var.atlas_database_name
  coll_name = var.atlas_collection_name

  criteria {
    type = "DATE"
    date_field = var.atlas_archive_date_field 
    expire_after_days = var.atlas_archive_expire_after_days
  }

 dynamic "partition_fields" {
    for_each = var.atlas_archive_partition_fields
    content {
      field_name = partition_fields.value.field_name
      order      = partition_fields.value.order
    }
  } 
}