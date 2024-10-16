output "workspace_details" {
  value = {
    for name, workspace in tfe_workspace.workspace : name => {
      id   = workspace.id
      name = workspace.name
    }
  }
}
