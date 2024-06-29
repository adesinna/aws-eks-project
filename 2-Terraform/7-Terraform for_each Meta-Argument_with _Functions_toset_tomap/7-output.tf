output "for_output_list_public_ip" {
  description = "For loop with list"
  value = toset([
    for instance in aws_instance.myinstance:
          instance.public_ip
  ])
}

output "for_output_list_public_dns" {
  description = "For loop with list"
  value = toset([
    for instance in aws_instance.myinstance:
          instance.public_dns
  ])
}

# For maps
output "instance_publicdns2" {
  value = tomap({
    for s, instance in aws_instance.myinstance:
      s => instance.public_dns

    # S intends to be a subnet ID
  })
}
