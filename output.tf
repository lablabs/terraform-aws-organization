output "organization" {
  description = "AWS organization attributes"
  value       = aws_organizations_organization.org
}

output "aws_organizations_organizational_unit" {
  description = "Map of the organization units attributes where key is ou name"
  value       = aws_organizations_organizational_unit.ous
}

output "aws_organizations_account" {
  description = "Map of the organization accounts attributes where key is account name"
  value       = aws_organizations_account.accounts
}
