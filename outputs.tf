output "organization_master_account_id" {
  value = aws_organizations_organization.org.master_account_id
}

output "organization_all_accounts" {
  value = aws_organizations_account.accounts
}

output "organization_all_organizational_units" {
  value = aws_organizations_organizational_unit.ous
}
