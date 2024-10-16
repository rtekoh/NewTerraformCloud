variable "organization" {
  description = "The name of the organization."
  type        = string
}

variable "organization_email" {
  description = "The email for the organization."
  type        = string
}

variable "create_new_organization" {
  description = "Determines if a new organization should be created."
  type        = bool
}

variable "projects" {
  description = "List of projects with their details, including associated teams and team members."
  type = list(object({
    name = string
    workspaces = list(object({
      name              = string
      description       = string
      tag_names         = list(string)
    }))
    teams = list(object({
      name       = string
      visibility = string
      access     = string
      members    = list(string)
      project_access = object({
        settings = string
        teams    = string
      })
      workspace_access = object({
        runs           = string
        sentinel_mocks = string
        state_versions = string
        variables      = string
        create         = bool
        locking        = bool
        delete         = bool
        move           = bool
        run_tasks      = bool
      })
    }))
  }))
}

