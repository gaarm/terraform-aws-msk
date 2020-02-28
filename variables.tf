# Input vars
variable "product_name" {
  type        = string
  description = "The product name as used in various places (e.g. aws resource tags), for example tixx"
}

variable "environment" {
  type        = string
  description = "The environment this cluster is representing, for example dv (development), st (staging) or pd (production)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all created resources"
}

variable "msk_kafka_version" {
  type        = string
  description = "Kafka version"
}

variable "msk_number_of_broker_nodes" {
  type        = number
  description = "Number of broker nodes"
}

variable "msk_ebs_volume_size" {
  type        = number
  description = "EBS volume size"
}

variable "msk_instance_type" {
  type        = string
  description = "MSK instance type"
}

variable "msk_client_subnets" {
  type        = list(string)
  description = "Client subnets for MSK cluster"
}

variable "msk_security_groups" {
  type        = list(string)
  description = "List of security group IDs to be allowed to connect to the MSK cluster"
}

variable "msk_server_configuration" {
  type        = string
  description = "MSK configuration of server.properties"
}