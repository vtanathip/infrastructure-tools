output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.aws_vm.instance_id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.aws_vm.instance_public_ip
}

output "instance_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = module.aws_vm.instance_private_ip
}
