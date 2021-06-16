variable "organization_aws_service_access_principals" {
  default = [
    "cloudtrail.amazonaws.com",
    "sso.amazonaws.com"
  ]
}

variable "organization_feature_set" {
  description = "Specify ALL or CONSOLIDATED_BILLING"
  default     = "ALL"
}

variable "organization_policy_types" {
  description = "List of Organizations policy types to enable in the Organization Root. Organization must have feature_set set to ALL. For additional information about valid policy types (e.g. AISERVICES_OPT_OUT_POLICY, BACKUP_POLICY, SERVICE_CONTROL_POLICY, and TAG_POLICY"
  type        = list(string)
  default     = ["SERVICE_CONTROL_POLICY"]
}

# Nasted organization unit structure is not allowed here
variable "organization_units" {
  description = "Create flat organization units"
  type        = list(string)
  default = [
    "default"
  ]
}

variable "organization_accounts" {
  description = "Map of organization accounts to create. The map key is the name of the account and the value is an object containing account configuration variables."
  type        = any

  # Expected value for the `organization_accounts` is a map of child accounts. The map key is the name of the account and
  # the value is another map with one required key (email) and several optional keys:
  #
  # - email (required):
  #   Email address for the account.
  #
  # - parent_id:
  #   Parent Organizational Unit ID or Root ID for the account
  #   Defaults to the Organization default Root ID.
  #
  # - iam_user_access_to_billing:
  #   If set to ´ALLOW´, the new account enables IAM users to access account billing information if they have the required
  #   permissions. If set to ´DENY´, then only the root user of the new account can access account billing information.
  #   Defaults to ´default_iam_user_access_to_billing´.
  #
  # - tags:
  #   Key-value mapping of resource tags.
  #
  # Example:
  #
  # organization_accounts = {
  #   security = {
  #     email                       = "security-master@acme.com",
  #     parent_name                 = "my-org-unit",
  #     iam_user_access_to_billing  = "DENY",
  #     tags = {
  #       Tag-Key = "tag-value"
  #     }
  #   },
  #   sandbox = {
  #     email                       = "sandbox@acme.com"
  #   }
  # }
}
