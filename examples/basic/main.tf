locals {
  tags = {
    "foo" = "bar"
  }

  organization_units = [
    "foo",
    "bar",
  ]

  organization_accounts = {
    foo = {
      email       = "foo@example.com",
      parent_name = "foo",
      tags        = local.tags
    },
    bar = {
      email     = "bar@example.com",
      parent_id = "xyz",
      tags      = local.tags
    },
  }
}

module "organization" {
  source                = "../../"
  organization_accounts = local.organization_accounts
  organization_units    = local.organization_units
  organization_aws_service_access_principals = [
    "aws-artifact-account-sync.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "fms.amazonaws.com",
    "guardduty.amazonaws.com",
    "securityhub.amazonaws.com",
    "sso.amazonaws.com"
  ]
}
