variable "atlas_org_pub_key" {
  type        = string
  description = "Public Key for MongoDB Atlas API"
}

variable "atlas_org_priv_key" {
  type        = string
  description = "Private Key for MongoDB Atlas API"
}

variable "atlas_proj_pub_key" {
  type        = string
  description = "Public Key for MongoDB Atlas project"
}

variable "atlas_proj_priv_key" {
  type        = string
  description = "Private Key for MongoDB Atlas project"
}

variable "atlas_org_id" {
  description = "The Organization ID for MongoDB Atlas"
  type        = string
}

variable "atlas_proj_id" {
  description = "The Project ID for MongoDB Atlas"
  type = string
}

variable "atlas_proj_name" {
  description = "The Project Name for MongoDB Atlas"
  type = string
}

variable "atlas_cluster_name" {
  description = "THe name of the cluster to be created"
  type = string
}

variable "atlas_cluster_disk_size_gb" {
  description = "Cluster disk size in GB"
  type = number 
}

variable "atlas_cluster_provider_name" {
  description = "Cloud provider the cluster will be deployed on"
  type = string
}

variable "atlas_cluster_provider_region_name" {
  description = "The Cluod Provider region to deploy in"
  type = string
}

variable "atlas_cluster_provider_instance_size" {
  description = "The instance size of the MongoDB cluster"
  type = string
}

variable "atlas_collection_name" {
  description = "The collection to use with Online Archive"
  type = string
}

variable "atlas_database_name" {
  description = "The database to use with Online Archive"
  type = string
}

variable "atlas_archive_date_field" {
  description = "The date field to use with Online Archive"
  type = string
}

variable "atlas_archive_expire_after_days" {
  description = "Number of days to archive days after"
  type = number
}

variable "atlas_archive_partition_fields" {
  description = "List of partition fields and their order"
  type = list(object({
      field_name = string
      order      = number
  }))
}

