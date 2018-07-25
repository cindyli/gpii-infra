terraform {
  backend "gcs" {}
}

variable "project_id" {}
variable "serviceaccount_key" {}
variable "keyring_name" {}

variable "encryption_keys" {
  type = "list"
}

variable "storage_location" {
  default = "us-central1"
}

variable "storage_class" {
  default = "REGIONAL"
}

module "gcp-secret-mgmt" {
  source = "/exekube-modules/gcp-secret-mgmt"

  project_id         = "${var.project_id}"
  serviceaccount_key = "${var.serviceaccount_key}"
  encryption_keys    = "${var.encryption_keys}"
  storage_location   = "${var.storage_location}"
  storage_class      = "${var.storage_class}"
  keyring_name       = "${var.keyring_name}"
}
