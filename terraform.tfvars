# GitHub Configuration
github_organization = "BKT-DevOps"

#=============================================================================
# PROJE YAPISININ AÇIKLAMASI
#=============================================================================
# Bu dosyada her proje şu yapıda tanımlanır:
# 
# "proje-identifier" = {           # Proje benzersiz adı (key)
#   team_name       = "..."        # GitHub'da oluşturulacak takım adı
#   project_lead    = "..."        # Proje lideri GitHub kullanıcı adı
#   team_permission = "push"       # Takım izin seviyesi
#   repositories    = [...]        # Proje altındaki repository'ler
#   members         = [...]        # Takım üyeleri

#
# TEAM PERMISSION SEVİYELERİ:
#   - "pull"     → Sadece okuma yetkisi
#   - "triage"   → Issue/PR düzenleme, kod gönderemez
#   - "push"     → Yazma yetkisi (kod gönderme)
#   - "maintain" → Kod yönetimi + issue + PR kontrolü
#
# MEMBER ROLE'LERİ:
#   - "member"     → Normal takım üyesi
#   - "maintainer" → Takım yöneticisi
#=============================================================================

# Projects Configuration
projects = {
  # ========================================
  # PROJE: Infrastructure as Code
  # ========================================
  "InfraCoders" = {
    project_lead    = "flovearth"
    team_name       = "InfraCoders"
    team_permission = "push"
    repositories = [
      {
        name        = "project-terraform-github"
        description = "Terraform ile GitHub Repolarının Otomatik Yönetimi"
        visibility  = "public"
      },

    ]
    members = [
      {
        username = "barisbutun"
        role     = "member"
      },
      {
        username = "hakanceran64"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "ismailaricioglu"
        role     = "member"
      },
      {
        username = "karalarmehmet"
        role     = "member"
      },
      {
        username = "kheif"
        role     = "member"
      },
      {
        username = "purfatih"
        role     = "member"
      },
      {
        username = "seyid12"
        role     = "member"
      },
      {
        username = "Shamsiaa"
        role     = "member"
      },
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "lerkush"
        role     = "member"
      }
    ]
  }

  "kovan" = {
    project_lead    = "hakanceran64"
    team_name       = "Kovan"
    team_permission = "push"
    repositories = [
      {
        name        = "communication-service"
        description = "Core service for Project Communication"
        visibility  = "public"
      }
    ]
    members = [
      {
        username = "flovearth"
        role     = "maintainer"
      },
      {
        username = "ismailaricioglu"
        role     = "member"
      },
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "slymanmrcan"
        role     = "member"
      },
      {
        username = "barisbutun"
        role     = "member"
      }
    ]
  }

  "project-test" = {
    project_lead    = "ismailaricioglu"
    team_name       = "Project Test"
    team_permission = "push"
    repositories = [
      {
        name        = "test-repo"
        description = "Test repository for demo purposes"
        visibility  = "public"
      }
    ]
    members = [
      {
        username = "egeren"
        role     = "maintainer"
      },
      {
        username = "UsainSasal"
        role     = "member"
      },
      {
        username = "onurceylan"
        role     = "member"
      }
    ]
  },
  "project-test-ismail" = {
    project_lead    = "ismailaricioglu"
    team_name       = "Project Test Ismail"
    team_permission = "push"
    repositories = [
      {
        name        = "test-repo-34"
        description = "Test repository for demo purposes"
        visibility  = "public"
      }
    ]
    members = [
      {
        username = "egeren"
        role     = "maintainer"
      },
      {
        username = "UsainSasal"
        role     = "member"
      },
      {
        username = "onurceylan"
        role     = "member"
      },
      {
        username = "flovearth"
        role     = "member"
      }
    ]
  },
  "project-test-lutfiye" = {
    project_lead    = "lerkush"
    team_permission = "push"
    team_name       = "Project Test Lutfiye"
    repositories = [
      {
        name        = "project-test-lutfiye"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = ""

      },
      {
        name        = "test_le_frontend-uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        # MIT lisansı otomatik olarak kullanılacak
      },
      {
        name        = "test_le_mobil_app"
        description = "Frontend uygulaması"
        visibility  = "public"
        license     = "apache-2.0"
      },
      {
        name        = "test_le_uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        license     = "none"
      }
    ]
    members = [
      {
        username = "hulyaoner"
        role     = "member"
      },
      {
        username = "onurceylan"
        role     = "member"
      },
      {
        username = "flovearth"
        role     = "member"
      }
    ]
  }
}


# DIPNOT: Diğer rol ve zini türleri aşağıda listelenmiştir. İhtiyaca göre ilgili özellikler tanımlanabilinir.

# Organization (Organizasyon) Roller  : github_membership
# Team (Takım) Roller                 : github_team_membership
# Environment Protection Rules        : github_repository_environment
# Actions / Workflow Roller           : github_actions_repository_permissions
# Branch Protection Roller            : github_branch_protection

# | Kapsam            | Roller / İzinler                               |
# | ----------------- | ---------------------------------------------- |
# | Repository        | `admin`, `maintain`, `write`, `triage`, `read` |
# | Organization      | `admin`, `member`                              |
# | Team              | `maintainer`, `member`                         |
# | Environment       | `selected_teams`, `selected_users`, `all`      |
# | Actions           | `read`, `write`, `none`                        |
# | Branch Protection | Kullanıcı/Takım bazlı kısıtlama                |

