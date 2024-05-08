resource "mongodbatlas_cluster" "archive_cluster" {
  project_id                = var.atlas_proj_id 
  name                      = var.atlas_cluster_name 
  disk_size_gb              = 10
  provider_instance_size_name = "M10"
  provider_name             = "AWS"
  provider_region_name      = "US_WEST_2"


  provisioner "local-exec" {
   command =<<EOF
      ansible-playbook -v -i ../ansible/inventory.yml ../ansible/load-data.yml --extra-vars '{
        "mongo_username": "${var.atlas_proj_pub_key}",
        "mongo_password": "${var.atlas_proj_priv_key}", 
        "mongo_database_name": "${var.atlas_archive_db}",
        "mongo_collection_name": "${var.atlas_archive_collection}",
        "mongo_connection_string": "${mongodbatlas_cluster.archive_cluster.connection_strings[0].standard_srv}"
      }'
EOF
  }

}

resource "mongodbatlas_online_archive" "archive" {
  project_id   = var.atlas_proj_id 
  cluster_name = mongodbatlas_cluster.archive_cluster.name
  db_name      = var.atlas_archive_db
  coll_name = var.atlas_archive_collection

  criteria {
    type = "DATE"
    date_field = var.atlas_archive_date_field 
    expire_after_days = 7
  }

 dynamic "partition_fields" {
    for_each = var.atlas_archive_partition_fields
    content {
      field_name = partition_fields.value.field_name
      order      = partition_fields.value.order
    }
  } 

  provisioner "local-exec" {
    #command = "ansible-playbook -i localhost, ../ansible/count_docs.yml --extra-vars 'cluster_host=${mongodbatlas_cluster.my_cluster.connection_strings.standard}'"
    command = "echo 'archive provision ran'"
  }
}


/* Uncomment and use this to test your ansible playbook changes
  resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
   command =<<EOF
      ansible-playbook -v -i ../ansible/inventory.yml ../ansible/load-data.yml --extra-vars '{
        "mongo_username": "${var.atlas_proj_pub_key}",
        "mongo_password": "${var.atlas_proj_priv_key}", 
        "mongo_database_name": "${var.atlas_archive_db}",
        "mongo_collection_name": "${var.atlas_archive_collection}",
        "mongo_connection_string": "${mongodbatlas_cluster.archive_cluster.connection_strings[0].standard_srv}"
      }'
EOF
  }
}
*/