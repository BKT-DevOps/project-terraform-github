provider "github" {
  owner = var.github_organization
  token = var.github_token
}

# Create teams for each project
resource "github_team" "project" {
  for_each    = var.projects
  name        = each.value.team_name
  description = "${each.key} projesi geliştirme ekibi"
  privacy     = "closed"
}

# Create repositories for each project
resource "github_repository" "repo" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility

  has_issues      = true
  has_wiki        = true
  has_projects    = true
  has_discussions = true

  delete_branch_on_merge = true
  auto_init              = true

  # Optional License
  license_template = each.value.license

  # Enable branch protection
  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = false
  allow_auto_merge   = false

  lifecycle {
    ignore_changes = [
      description,
      visibility
    ]
  }
}

# Set up team access to repositories
resource "github_team_repository" "access" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  team_id    = github_team.project[each.value.project_name].id
  repository = github_repository.repo[each.key].name
  permission = each.value.team_permission
}

# Add team members
resource "github_team_membership" "members" {
  for_each = { for m in local.all_memberships : "${m.project}-${m.user}" => m }

  team_id  = github_team.project[each.value.project].id
  username = each.value.user
  role     = each.value.role
}

# Grant admin access to project leads
resource "github_repository_collaborator" "lead" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  username   = each.value.lead
  permission = "admin"
}

# Create additional branches for each repository
resource "github_branch" "develop" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  branch     = "develop"

  source_branch = try(github_repository.repo[each.key].default_branch, "main")

  depends_on = [github_repository.repo]
}

resource "github_branch" "release" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  branch     = "release"

  source_branch = try(github_repository.repo[each.key].default_branch, "main")

  depends_on = [github_repository.repo]
}

# Branch protection rules
resource "github_branch_protection" "main" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository_id = github_repository.repo[each.key].node_id
  pattern       = "main"

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    restrict_dismissals             = false
    require_code_owner_reviews      = true
  }

  enforce_admins         = false
  allows_deletions       = false
  allows_force_pushes    = false
  require_signed_commits = true

  depends_on = [
    github_repository_file.docs_project,
    github_repository_file.readme,
    github_repository_file.codeowners,
    github_repository_file.docs_architecture,
    github_repository_file.docs_workflow,
    github_repository_file.docs_verified_commits,
    github_repository_file.pr_template
  ]
}

resource "github_repository_file" "codeowners" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  branch         = "main"
  file           = ".github/CODEOWNERS"
  content        = "* @${each.value.lead}\n"
  commit_message = "initial commit"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]

  lifecycle {
    ignore_changes = [
      content,
      commit_message
    ]
  }
}

# Create labels for issues
resource "github_issue_label" "setup" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "setup"
  color       = "1d76db"
  description = "Initial setup tasks"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository,
      name,
      color,
      description
    ]
  }
}

resource "github_issue_label" "priority_high" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "priority:high"
  color       = "d93f0b"
  description = "High priority tasks"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository,
      name,
      color,
      description
    ]
  }
}

# Create initial setup issue for each project
resource "github_issue" "initial_setup" {
  for_each = { for project_name, project in var.projects : project_name => project }

  repository = github_repository.repo[local.project_main_repos[each.key]].name
  title      = "Initial Setup"
  body = replace(
    replace(
      file("${path.module}/docs/Initial-Setup-Issue.md"),
      "{{PROJECT_NAME}}", each.key
    ),
    "{{PROJECT_LEAD}}", each.value.project_lead
  )

  assignees = [each.value.project_lead]
  labels    = ["setup", "priority:high"]

  depends_on = [
    github_repository.repo,
    github_issue_label.setup,
    github_issue_label.priority_high
  ]

  lifecycle {
    ignore_changes = [
      title,
      body,
      assignees,
      labels,
      repository
    ]
  }
}

resource "github_repository_file" "docs_project" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Project-Definition.md"
  content = replace(
    replace(
      file("${path.module}/docs/Project-Definition.md"),
      "{{PROJECT_NAME}}", each.value.project_name
    ),
    "{{PROJECT_LEAD}}", each.value.lead
  )
  commit_message = "Add project documentation"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]

  lifecycle {
    ignore_changes = [content]
  }
}
# Architecture Overview dokümanı
resource "github_repository_file" "docs_architecture" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Architecture-Overview.md"
  content = replace(
    file("${path.module}/docs/Architecture-Overview.md"),
    "{{PROJECT_NAME}}", each.value.project_name
  )
  commit_message = "Add Architecture Overview document"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]
  lifecycle {
    ignore_changes = [content]
  }
}

# Development Workflow dokümanı
resource "github_repository_file" "docs_workflow" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Development-Workflow.md"
  content = replace(
    file("${path.module}/docs/Development-Workflow.md"),
    "{{PROJECT_NAME}}", each.value.project_name
  )
  commit_message = "Add Development Workflow document"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]
}

# Verified Commits Guide dokümanı
resource "github_repository_file" "docs_verified_commits" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Verified-Commits-Guide.md"
  content = replace(
    file("${path.module}/docs/Verified-Commits-Guide.md"),
    "{{PROJECT_NAME}}", each.value.project_name
  )
  commit_message = "Add Verified Commits Guide document"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]

  lifecycle {
    ignore_changes = [content]
  }
}

# Team sayfası için dinamik içerik
resource "github_repository_file" "team" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Team.md"

  content = replace(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                file("${path.module}/docs/Team.md"),
                "{{PROJECT_NAME}}", each.value.project_name
              ),
              "{{TEAM_NAME}}", var.projects[each.value.project_name].team_name
            ),
            "{{GITHUB_ORG}}", var.github_organization
          ),
          "{{PROJECT_LEAD}}", each.value.lead
        ),
        "{{MEMBER_COUNT}}", tostring(length(var.projects[each.value.project_name].members))
      ),
      "{{MAINTAINER_COUNT}}", tostring(length([
        for m in var.projects[each.value.project_name].members : m if m.role == "maintainer"
      ]))
    ),
    "{{REGULAR_MEMBER_COUNT}}", tostring(length([
      for m in var.projects[each.value.project_name].members : m if m.role == "member"
    ]))
  )

  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]

  lifecycle {
    ignore_changes = [content]
  }
}

# Create comprehensive README for each repository
resource "github_repository_file" "readme" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "README.md"
  content = replace(
    replace(
      replace(
        replace(
          file("${path.module}/docs/Readme.md"),
          "{{PROJECT_NAME}}", each.value.project_name
        ),
        "{{PROJECT_LEAD}}", each.value.lead
      ),
      "{{GITHUB_ORG}}", var.github_organization
    ),
    "{{REPO_NAME}}", each.key
  )
  commit_message = "Update README with project information"

  depends_on = [
    github_repository.repo,
    github_team_repository.access,
    github_repository_collaborator.lead
  ]

  overwrite_on_create = true # This will overwrite the auto-generated README

  lifecycle {
    ignore_changes = [content]
  }
}

# --- Code of Conduct dosyasını her repoya ekle ---
resource "github_repository_file" "code_of_conduct" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  branch         = "main"
  file           = "CODE_OF_CONDUCT.md"
  content        = file("${path.module}/CODE_OF_CONDUCT.md")
  commit_message = "Add CODE_OF_CONDUCT.md file"

  overwrite_on_create = true

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [content]
  }
}

resource "github_repository_file" "wiki_home" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Wiki-Home.md" # Wiki için referans
  content = replace(
    replace(
      file("${path.module}/docs/Wiki-Home.md"),
      "{{PROJECT_NAME}}", each.value.project_name
    ),
    "{{PROJECT_LEAD}}", each.value.lead
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [content]
  }
}

# Local values for processing complex data structures
locals {
  # Map project names to their first repository (main repo)
  project_main_repos = {
    for project_name, project in var.projects :
    project_name => project.repositories[0].name
  }

  # Flatten repos from projects
  all_repos = flatten([
    for project_name, project in var.projects : [
      for repo in project.repositories : {
        project_name    = project_name
        repo_name       = repo.name
        description     = repo.description
        visibility      = repo.visibility
        lead            = project.project_lead
        team_permission = project.team_permission
        license         = try(repo.license, "mit")
      }
    ]
  ])

  # Flatten team memberships
  all_memberships = flatten([
    for project_name, project in var.projects : [
      for member in project.members : {
        project = project_name
        user    = member.username
        role    = member.role
      }
    ]
  ])
}

# --- Raporlamayı etkinleştirmek için sorun şablonu yapılandırmasını ekle ---
resource "github_repository_file" "issue_template_config" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository          = github_repository.repo[each.key].name
  branch              = "main"
  file                = ".github/ISSUE_TEMPLATE/config.yml"
  content             = file("${path.module}/.github/ISSUE_TEMPLATE/config.yml")
  commit_message      = "initial commit"
  overwrite_on_create = true
  depends_on          = [github_repository.repo]
}

resource "github_repository_file" "report_abuse_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository          = github_repository.repo[each.key].name
  branch              = "main"
  file                = ".github/ISSUE_TEMPLATE/report-abuse.yml"
  content             = file("${path.module}/.github/ISSUE_TEMPLATE/report-abuse.yml")
  commit_message      = "initial commit"
  overwrite_on_create = true
  depends_on          = [github_repository.repo]

  lifecycle {
    ignore_changes = [content]
  }
}
# Create default pull request template
resource "github_repository_file" "pr_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  file           = ".github/pull_request_template.md"
  content        = file("${path.module}/.github/pull_request_template.md")
  commit_message = "Add default PR template"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  lifecycle {
    ignore_changes = [content]
  }
}

