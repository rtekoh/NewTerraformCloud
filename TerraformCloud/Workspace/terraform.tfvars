# tfc_hostname = "app.terraform.io"

organization = "EffulgenceTech"
project_id   = "prj-QVs5km4fmZefDrPs"
role_name    = "terraform-cloud-dynamic-credentials"

##  Specify the workspace name as described in the document https://wiki.fhcrc.org/display/AWS/Terraform+Cloud+Resource+Guide?src=contextnavpagetreemode   
##  Format   ${environment}_{project_name}_{resource_description}_ws

## working_dir  This is the directory from which your configuration files will be deployed. This is such that workspace runs will only be started when this directory is updated. 
## Format:  "projects/prod"

##  The project Repository for the team. 
## Format  "cloud-engineering/terraformcloud"

##  aws_account_id :  This is the account ID of the account in which resources in this workspace will be deployed in. 
##  Make sure you have access to the target account to get this ID.vcs_oauth_token = 
## Format : 082996641203

workspaces = [
  {
    workspace_name = "workspace-test"
    working_dir    = "projects/prod"
    vcs_identifier = "rtekoh/Terraform-gmailaccount" # Enter here the repository for your project e.g: "cloud-engineering/terraformcloud"
    aws_account_id = "082996641203"
  }
  # Add New workspace here
]
