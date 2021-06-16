resource "aws_organizations_organization" "org" {
  aws_service_access_principals = var.organization_aws_service_access_principals
  feature_set                   = var.organization_feature_set
  enabled_policy_types          = var.organization_policy_types
}

resource "aws_organizations_organizational_unit" "ous" {
  for_each  = toset(distinct(var.organization_units))
  name      = each.value
  parent_id = aws_organizations_organization.org.roots.0.id
}

resource "aws_organizations_account" "accounts" {
  for_each  = var.organization_accounts
  name      = each.key
  email     = each.value.email
  parent_id = try(aws_organizations_organizational_unit.ous[each.value.parent_name].id, try(each.value.parent_id, null))
}
