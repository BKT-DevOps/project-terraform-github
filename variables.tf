variable "github_organization" {
  description = "GitHub organization name"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token with appropriate permissions"
  type        = string
  sensitive   = true
}

variable "projects" {
  description = "Map of projects with their configuration. Key is the project identifier."
  type = map(object({
    team_name       = string # GitHub'da oluşturulacak takım adı
    project_lead    = string # Proje lideri kullanıcı adı
    team_permission = string # Takımın repolara erişim izni (pull, triage, push, maintain)
    repositories = list(object({
      name        = string           # Repository adı
      description = string           # Repository açıklaması
      visibility  = string           # Repository görünürlüğü (public, private)
      license     = optional(string) # Repository lisansı (opsiyonel, default: mit)
    }))
    members = list(object({
      username = string # GitHub kullanıcı adı
      role     = string # Takım rolü (member, maintainer)
    }))
  }))

  validation {
    condition = alltrue([
      for project_name, project in var.projects :
      contains(["pull", "triage", "push", "maintain"], project.team_permission)
    ])
    error_message = "Team permission must be one of: pull, triage, push, maintain"
  }

  validation {
    condition = alltrue([
      for project_name, project in var.projects :
      alltrue([
        for repo in project.repositories :
        contains(["public", "private"], repo.visibility)
      ])
    ])
    error_message = "Repository visibility must be either 'public' or 'private'"
  }

  validation {
    condition = alltrue([
      for project_name, project in var.projects :
      alltrue([
        for member in project.members :
        contains(["member", "maintainer"], member.role)
      ])
    ])
    error_message = "Team member role must be either 'member' or 'maintainer'"
  }
  # Repo isim formatı doğru mu 
  validation {
    condition = alltrue([
      for project_name, project in var.projects :
      alltrue([
        for repo in project.repositories :
        can(regex("^[a-zA-Z0-9_-]+$", repo.name))
      ])
    ])
    error_message = "Repository names can only contain letters, numbers, hyphens, and underscores"
  }
  # Username formatı doğru mu
  validation {
    condition = alltrue([
      for project_name, project in var.projects :
      alltrue([
        for member in project.members :
        can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-]*[a-zA-Z0-9])?$", member.username))
      ])
    ])
    error_message = "GitHub usernames must start and end with alphanumeric characters"
  }

}