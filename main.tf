locals {
  # Organization name => id mapping for organization_accounts.parent_name
  aws_organizations_units_map = { for unit in distinct(data.aws_organizations_organizational_units.ous.children) : unit.name => unit.id }
}

resource "aws_organizations_organization" "org" {
  aws_service_access_principals = var.organization_aws_service_access_principals
  feature_set                   = var.organization_feature_set
}

resource "aws_organizations_organizational_unit" "ous" {
  for_each  = toset(distinct(var.organization_units))
  name      = each.value
  parent_id = aws_organizations_organization.org.roots.0.id
}

data "aws_organizations_organizational_units" "ous" {
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "accounts" {
  for_each  = var.organization_accounts
  name      = each.key
  email     = each.value.email
  parent_id = lookup(local.aws_organizations_units_map, lookup(each.value, "parent_name", null), null)
}
