output "organization_master_account_id" {
  value = aws_organizations_organization.org.master_account_id
}

output "organization_all_accounts" {
  value = aws_organizations_account.accounts
}
