locals {
  # Flatten the projects and teams into a more accessible structure
  flattened_projects = flatten([
    for project in var.projects : [
      for team in project.teams : {
        team_name                = team.name
        team_visibility          = team.visibility
        team_access              = team.access
        team_members             = team.members
        project_settings         = team.project_access.settings
        project_teams            = team.project_access.teams
        workspace_runs           = team.workspace_access.runs
        workspace_sentinel_mocks = team.workspace_access.sentinel_mocks
        workspace_state_versions = team.workspace_access.state_versions
        workspace_variables      = team.workspace_access.variables
        workspace_create         = team.workspace_access.create
        workspace_locking        = team.workspace_access.locking
        workspace_delete         = team.workspace_access.delete
        workspace_move           = team.workspace_access.move
        workspace_run_tasks      = team.workspace_access.run_tasks
        project_id               = lookup(local.project_name, project.name, "")
      }
    ]
  ])

  project_name = { for project in tfe_project.project : project.name => project.id }

  # flattened_workspaces = flatten([
  #   for project in var.projects : [
  #     for ws in project.workspaces : {
  #       # project_name       = project.name
  #       workspace_name = ws.name
  #       description    = ws.description
  #       # terraform_version = ws.terraform_version
  #       tag_names         = ws.tag_names
  #       project_id        = lookup(local.project_name, project.name, "")
  #       branch            = ws.branch
  #       identifier        = ws.identifier
  #       working_directory = ws.working_directory
  #       trigger_patterns  = ws.trigger_patterns
  #     }
  #   ]
  # ])

  # Create a list of member mappings like this
  # team_name = team_name
  # member_name = member_email
  team_members = flatten([
    for project in var.projects : [
      for team in project.teams : [
        for member in team["members"] : {
          team_name   = team["name"]
          member_name = member
        } if length(team["members"]) > 0
      ]
  ]])


}


# Create an organization depending on var.create_new_organization
resource "tfe_organization" "org" {
  count = var.create_new_organization ? 1 : 0
  name  = var.organization
  email = var.organization_email
}

resource "tfe_project" "project" {
  count        = length(var.projects)
  name         = var.projects[count.index].name
  organization = var.organization
}

resource "tfe_team" "team" {
  for_each     = { for item in local.flattened_projects : item.team_name => item }
  name         = each.value.team_name
  organization = var.organization
  visibility   = each.value.team_visibility
}

# resource "tfe_team_members" "team_members" {

#   for_each  = { for member in local.team_members : "${member.team_name}_${member.member_name}" => member }
#   team_id   = tfe_team.team[each.value["team_name"]].id
#   usernames = toset([each.value.member_name])


# }


resource "tfe_team_project_access" "team_access" {
  for_each = { for item in local.flattened_projects : item.team_name => item }
  #count      = length(var.projects)
  team_id    = tfe_team.team["${each.value.team_name}"].id
  project_id = each.value.project_id
  access     = each.value.team_access

  project_access {
    settings = each.value.project_settings
    teams    = each.value.project_teams
  }

  workspace_access {
    runs           = each.value.workspace_runs
    sentinel_mocks = each.value.workspace_sentinel_mocks
    state_versions = each.value.workspace_state_versions
    variables      = each.value.workspace_variables
    create         = each.value.workspace_create
    locking        = each.value.workspace_locking
    delete         = each.value.workspace_delete
    move           = each.value.workspace_move
    run_tasks      = each.value.workspace_run_tasks
  }
}

# resource "tfe_oauth_client" "effulgencetech_github" {
#   organization     = var.organization
#   api_url          = "https://api.github.com"
#   http_url         = "https://github.com"
#   oauth_token      = var.vcs_oauth_token
#   service_provider = "github"
# }

# resource "tfe_workspace" "workspace" {
#   for_each = { for ws in local.flattened_workspaces : ws.workspace_name => ws }

#   name         = each.value.workspace_name
#   organization = var.organization # Make sure to define this variable or hardcode your organization name
#   # terraform_version = each.value.terraform_version
#   project_id        = each.value.project_id
#   description       = each.value.description
#   tag_names         = each.value.tag_names
#   auto_apply        = false
#   force_delete      = true
#   queue_all_runs    = true
#   trigger_patterns  = each.value.trigger_patterns
#   working_directory = each.value.working_directory
#   vcs_repo {
#     branch         = each.value.branch
#     identifier     = each.value.identifier
#     oauth_token_id = var.vcs_oauth_token
#   }

# }

# Only use the below two resources when the members are not already part of the organization

resource "tfe_team_organization_member" "team_members" {
  # Create a map with the team name and member name combines as a key for uniqueness
  for_each                   = { for member in local.team_members : "${member.team_name}_${member.member_name}" => member }
  team_id                    = tfe_team.team[each.value["team_name"]].id
  organization_membership_id = tfe_organization_membership.org_members[each.value["member_name"]].id
}

# # Add TFC accounts to the organization
resource "tfe_organization_membership" "org_members" {
  for_each = toset(flatten([
    for item in local.flattened_projects : [
      for member in item.team_members : "${member}"
    ]
  ]))
  organization = var.organization
  email        = each.value
}
