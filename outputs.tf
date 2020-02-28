# Output vars
output "msk_bootstrap_brokers" {
  description = "Plaintext connection host:port pairs"
  value       = "${aws_msk_cluster.default.bootstrap_brokers}"
}
