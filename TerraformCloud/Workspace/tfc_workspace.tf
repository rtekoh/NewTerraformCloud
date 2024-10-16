##  This code should be used to create workspaces within each project. 




locals {
  organization = var.organization
  project_id   = var.project_id
  role_name    = var.role_name

  flattened_account_ids = flatten([for ws in var.workspaces : ws.aws_account_id])
}


resource "tfe_workspace" "workspace" {
  for_each          = { for worksp, workspace in var.workspaces : worksp => workspace }
  name              = each.value.workspace_name
  organization      = local.organization
  project_id        = local.project_id
  auto_apply        = false
  working_directory = each.value.working_dir
  vcs_repo {
    branch     = "master"
    identifier = each.value.vcs_identifier
    # oauth_token_id = each.value.oauth_token_id
    oauth_token_id = var.vcs_oauth_token
  }
}


## Required Environment Variables
##  This variable must be present for Dynamic credentials to work
## Requires v1.7.0 or later if self-managing agents. Must be present and set to "true", or Terraform Cloud will not attempt to authenticate to AWS.
resource "tfe_variable" "aws_run_role_arn" {
  for_each     = tfe_workspace.workspace
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = "arn:aws:iam::${local.flattened_account_ids[each.key]}:role/${local.role_name}"
  workspace_id = tfe_workspace.workspace[each.key].id
  category     = "env"
}


## Required Environment Variables
## Requires v1.7.0 or later if self-managing agents. 
## The ARN of the role to use for the apply phase of a run.
resource "tfe_variable" "aws_provider_auth" {
  for_each     = tfe_workspace.workspace
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  workspace_id = tfe_workspace.workspace[each.key].id
  category     = "env"
}
