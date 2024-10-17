organization            = "EffulgenceTech"
organization_email      = "rtekoh@outlook.com"
create_new_organization = false
vcs_oauth_token         = "ot-a6qNZLM7exPnyyjb"
projects = [
  {
    name = "cloudengineering_project",
    workspaces = [
      {
        name        = "cloudengineering_project_config_ws",
        description = "Config workspace for CloudEngineering team",
        # terraform_version = "1.6.6",
        tag_names         = ["cloudengineering", "prod"]
        trigger_patterns  = ["TerraformCloud/Workspace"]
        working_directory = "TerraformCloud/Workspace"
        branch            = "master"
        identifier        = "rtekoh/NewTerraformCloud"
      }
    ],
    teams = [
      {
        name       = "tfc_cloud_admin"
        visibility = "secret"
        access     = "custom"
        members = [
          "rtekoh@gmail.com"
          # Add New members here. Use user's effulgencetech email address only 
        ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 

        project_access = {
          settings = "delete"
          teams    = "manage"
        }
        workspace_access = {
          runs           = "apply"
          sentinel_mocks = "read"
          state_versions = "write"
          variables      = "write"
          create         = true
          locking        = true
          delete         = true
          move           = true
          run_tasks      = true
        }
      }
    ]
  },

  {
    name = "itcustomapps_project",
    workspaces = [
      {
        name        = "itcustomapps_project_config_ws",
        description = "Config workspace for itcustomapps team",
        # terraform_version = "1.6.6",
        tag_names         = ["itcustomapps", "prod"]
        trigger_patterns  = ["TerraformCloud/Workspace"]
        working_directory = "TerraformCloud/Workspace"
        branch            = "master"
        identifier        = "rtekoh/NewTerraformCloud"
      }
    ],
    teams = [
      {
        name       = "tfc_itcustomapps_admin"
        visibility = "secret"
        access     = "custom"
        members = [
          "timi@effulgencetech.org"

          # Add New members here. Use user's effulgencetech email address only 
        ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 

        project_access = {
          settings = "delete"
          teams    = "manage"
        }
        workspace_access = {
          runs           = "apply"
          sentinel_mocks = "read"
          state_versions = "write"
          variables      = "write"
          create         = true
          locking        = true
          delete         = true
          move           = true
          run_tasks      = true
        }
      },
      {
        name       = "tfc_itcustomapps_developer"
        visibility = "secret"
        access     = "custom"
        members = [
          "timi@effulgencetech.org"
          # Add New members here. Use user's effulgencetech email address only 
        ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
        project_access = {
          settings = "update"
          teams    = "read"
        }
        workspace_access = {
          runs           = "apply"
          sentinel_mocks = "read"
          state_versions = "write"
          variables      = "write"
          create         = true
          locking        = true
          delete         = true
          move           = false
          run_tasks      = true
        }
      }
    ]
  }
  #,
  # {
  #   name = "dba_project",
  #   workspaces = [
  #     {
  #       name        = "dba_project_config_ws",
  #       description = "Config workspace for dba team",
  #       # terraform_version = "1.6.6",
  #       tag_names = ["dba", "prod"]
  #     }
  #   ],
  #   teams = [
  #     {
  #       name       = "tfc_dba_admin"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "delete"
  #         teams    = "manage"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = true
  #         run_tasks      = true
  #       }
  #     },
  #     {
  #       name       = "tfc_dba_developer"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "update"
  #         teams    = "read"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = false
  #         run_tasks      = true
  #       }
  #     }
  #   ]
  # },
  # {
  #   name = "syseng_project",
  #   workspaces = [
  #     {
  #       name        = "syseng_project_config_ws",
  #       description = "Config workspace for syseng team",
  #       # terraform_version = "1.6.6",
  #       tag_names = ["syseng", "prod"]
  #     }
  #   ],
  #   teams = [
  #     {
  #       name       = "tfc_syseng_admin"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "delete"
  #         teams    = "manage"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = true
  #         run_tasks      = true
  #       }
  #     },
  #     {
  #       name       = "tfc_syseng_developer"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "update"
  #         teams    = "read"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = false
  #         run_tasks      = true
  #       }
  #     }
  #   ]
  # },
  # {
  #   name = "security_audit_project",
  #   workspaces = [
  #     {
  #       name        = "security_audit_config_ws",
  #       description = "Config workspace for InfoSec team",
  #       # terraform_version = "1.6.6",
  #       tag_names = ["infosec", "prod"]
  #     }
  #   ],
  #   teams = [
  #     {
  #       name       = "security_audit_readonly"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         "rtekoh@effulgencetech.org"
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "read"
  #         teams    = "manage"
  #       }
  #       workspace_access = {
  #         runs           = "read"
  #         sentinel_mocks = "read"
  #         state_versions = "read-outputs"
  #         variables      = "read"
  #         create         = false
  #         locking        = false
  #         delete         = false
  #         move           = false
  #         run_tasks      = false
  #       }
  #     }
  #   ]
  # },
  # {
  #   name = "central_network_project",
  #   workspaces = [
  #     {
  #       name        = "central_network_config_ws",
  #       description = "Config workspace for Centralized Netorking",
  #       # terraform_version = "1.6.6",
  #       tag_names = ["cloudengineering", "networking", "prod"]
  #     }
  #   ],
  #   teams = [
  #     {
  #       name       = "tfc_networking_test"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         "rtekoh@effulgencetech.org"
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 

  #       project_access = {
  #         settings = "delete"
  #         teams    = "manage"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = true
  #         run_tasks      = true
  #       }
  #     }
  #   ]
  # },
  # {
  #   name = "halo_project",
  #   workspaces = [
  #     {
  #       name        = "halo_config_ws",
  #       description = "Config workspace for halo team",
  #       # terraform_version = "1.6.6",
  #       tag_names = ["halo", "prod"]
  #     }
  #   ],
  #   teams = [
  #     {
  #       name       = "tfc_halo_developer"
  #       visibility = "secret"
  #       access     = "custom"
  #       members = [
  #         "timi@effulgencetech.org"
  #         # Add New members here. Use user's effulgencetech email address only 
  #       ] # Make sure user has been granted sso access to terraform cloud and have not logged in initially. Invite will be sent directly from terraform cloud 
  #       project_access = {
  #         settings = "delete"
  #         teams    = "manage"
  #       }
  #       workspace_access = {
  #         runs           = "apply"
  #         sentinel_mocks = "read"
  #         state_versions = "write"
  #         variables      = "write"
  #         create         = true
  #         locking        = true
  #         delete         = true
  #         move           = true
  #         run_tasks      = true
  #       }
  #     }
  #   ]
  # }
  # # Add more projects here with the same structure.
]




