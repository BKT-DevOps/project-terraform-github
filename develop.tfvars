github_organization = "BKT-DevOps"

projects = {
  "Dev-Test-Project" = {
    lead            = "flovearth"
    team_permission = "pull"
    repositories = [
      {
        name        = "dev-demo-repo"
        description = "Repository for the DEV environment"
        visibility  = "private"
      }
    ]
    members = [
      {
        username = "flovearth"
        role     = "member"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      }
    ]
  }
}