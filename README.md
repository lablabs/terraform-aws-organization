# AWS Organization Terraform module

[![labyrinth labs logo](ll-logo.png)](https://lablabs.io/)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

![Terraform validation](https://github.com/lablabs/***REPOSITORY***/workflows/Terraform%20validation/badge.svg?branch=master)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-success?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Description

Terraform module which sets up AWS Organization in the root account.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 2.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_organizations_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_account) |
| [aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) |
| [aws_organizations_organizational_unit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| organization\_accounts | Map of organization accounts to create. The map key is the name of the account and the value is an object containing account configuration variables. | `any` | n/a | yes |
| organization\_aws\_service\_access\_principals | n/a | `list` | <pre>[<br>  "cloudtrail.amazonaws.com",<br>  "sso.amazonaws.com"<br>]</pre> | no |
| organization\_enabled\_policy\_types | List of Organizations policy types to enable in the Organization Root. Organization must have feature\_set set to ALL. For additional information about valid policy types (e.g. AISERVICES\_OPT\_OUT\_POLICY, BACKUP\_POLICY, SERVICE\_CONTROL\_POLICY, and TAG\_POLICY | `list(string)` | <pre>[<br>  "SERVICE_CONTROL_POLICY"<br>]</pre> | no |
| organization\_feature\_set | Specify ALL or CONSOLIDATED\_BILLING | `string` | `"ALL"` | no |
| organization\_units | Create flat organization units | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_organizations\_account | Map of the organization accounts attributes where key is account name |
| aws\_organizations\_organizational\_unit | Map of the organization units attributes where key is ou name |
| organization | AWS organization attributes |
| organization\_all\_accounts | Map of the organization units attributes where key is account name |
| organization\_all\_organizational\_units | Map of the organization units attributes where key is ou name |
| organization\_master\_account\_id | Management account id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflow](.github/workflows/main.yml). A pull-request to the
master branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.


## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
