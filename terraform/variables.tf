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

variable "atlas_archive_collection" {
    description = "The collection to use with Online Archive"
    type = string
}

variable "atlas_archive_db" {
    description = "The database to use with Online Archive"
    type = string
}

variable "atlas_archive_date_field" {
    description = "The date field to use with Online Archive"
    type = string
}

