variable "projectid" {
  type = string
  default = "k8s-prod-440909"
}
variable "region" {
  type = string
  default = "us-east1"
}
variable "vpcname" {
  type = string
  default = "prodvpc-k8s"
}
variable "routingmode" {
  type = string
  default = "REGIONAL"
}
variable "subnet_cidr" {
  type = string
  default = "10.0.0.0/20"
}
variable "subnetname" {
  type = string
  default = "private-subnet"
}
variable "private_ip_google_access" {
  type = bool
  default = true
}
variable "subnetregion" {
  type = string
  default = "us-east1"
}
variable "k8s_pod_cidr" {
  type = string
  default = "10.10.0.0/16"
}
variable "k8s_service_cidr" {
  type = string
  default = "10.20.0.0/16"
}
variable "router_name" {
  type = string
  default = "private-router-nat"
}
### cluster varaibles
variable "clustername" {
  type = string
  default = "prod"
}
variable "master_ipv4_cidr_block" {
  type = string
  default = "172.16.0.0/28"
}
variable "cluster_initial_node_count" {
  type = number
  default = "1"
}
variable "clusterzone" {
  type = string
  default = "us-east1-b"
}
### nodepool1 varaiables
variable "pool1_nodecount" {
  type = number
  default = "1"
}
variable "pool1_machinetype" {
  type = string
  default = "e2-small"
}
variable "pool1_labels" {
  type = string
  default = "pool1"
}
### nodepool2 varaiables
variable "pool2_nodecount" {
  type = number
  default = "1"
}
variable "pool2_machinetype" {
  type = string
  default = "e2-small"
}
variable "pool2_labels" {
  type = string
  default = "pool2"
}
variable "min_node_count" {
  type = string
  default = "1"
}
variable "max_node_count" {
  type = string
  default = "6"
}