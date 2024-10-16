
# variable "organization" {
#   description = "Name of the Terraform Cloud organization"
# }

# #This is the project ID of the project you currently are deploying these workspaces in. 
# variable "project_id" {
#   description = "Name of the Terraform Cloud project"
# }

# # This Is the terraform cloud role for each project. 
# variable "role_name" {
#   description = "Name of the Terraform Cloud Role for your project"
# }

# # This variable is created in terraform cloud under variable set and shared with all projects and workspace. 
# # You do not need to pass any value for it. It will be picked up dynamicaly during plan and apply.check "name" 

# variable "vcs_oauth_token" {
#   description = "VCS repository OAuth token"
# }

# variable "workspaces" {
#   description = "List of workspaces to create"
#   type = list(object({
#     workspace_name = string
#     working_dir    = string
#     vcs_identifier = string
#     # oauth_token_id = string
#     aws_account_id = string
#   }))
# }
