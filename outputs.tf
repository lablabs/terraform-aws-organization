output "organization_master_account_id" {
  description = "Management account id"
  value       = aws_organizations_organization.org.master_account_id
}

output "organization_all_accounts" {
  description = "Map of the organization units attributes where key is account name"
  value       = aws_organizations_account.accounts
}

output "organization_all_organizational_units" {
  description = "Map of the organization units attributes where key is ou name"
  value       = aws_organizations_organizational_unit.ous
}
