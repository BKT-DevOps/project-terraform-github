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
# }
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
  "infra-automation" = {
    team_name       = "InfraCoders"
    project_lead    = "flovearth"
    team_permission = "push"

    repositories = [
      {
        name        = "project-terraform-github"
        description = "Terraform ile GitHub Repolarının Otomatik Yönetimi"
        visibility  = "public"
      }
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

  # ========================================
  # PROJE: Communication Platform
  # ========================================
  "communication-platform" = {
    team_name       = "Kovan"
    project_lead    = "hakanceran64"
    team_permission = "push"

    repositories = [
      {
        name        = "communication-service"
        description = "Core service for Communication Platform"
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

  # ========================================
  # PROJE: Demo & Testing
  # ========================================
  "demo-testing" = {
    team_name       = "DemoTeam"
    project_lead    = "ismailaricioglu"
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
  }

  # Ekip Rolleri ve İzinler İçin Örnekler

  # ___ORNEK: 1
  "frontend-test" = {
    team_name       = "UIExperts"
    project_lead    = "ismailaricioglu"
    team_permission = "maintain"

    repositories = [
      {
        name        = "dashboard-ui-test"
        description = "Test Dashboard UI Application"
        visibility  = "public"
        license     = "mit"
      }
    ]

    members = [
      {
        username = "ismailaricioglu"
        role     = "maintainer"
      },
      {
        username = "slymanmrcan"
        role     = "maintainer"
      }
    ]
  }


  # Ekip Rolleri ve İzinler İçin Örnekler

  # ___ORNEK: 1

  # "Documentation" = {
  #   lead            = "flovearth"
  #   team_permission = "push"
  #   
  #   repositories = [
  #     {
  #       name        = "community-documentation"
  #       description = "Topluluk için genel dokümantasyon"
  #       visibility  = "public"
  #     }
  #   ]
  #   
  #   members = [
  #     {
  #       username = "flovearth"
  #       role     = "maintainer"
  #     },
  #     {
  #       username = "ismailaricioglu"
  #       role     = "maintainer"
  #     },
  #     {
  #       username = "onurceylan"
  #       role     = "member"
  #     },
  #     {
  #       username = "UsainSasal"
  #       role     = "member"
  #     },
  #     {
  #       username = "egeren"
  #       role     = "member"
  #     },
  #     {
  #       username = "hulyaoner"
  #       role     = "member"
  #     },
  #     {
  #       username = "lerkush"
  #       role     = "member"
  #     },
  #   ]
  # }

  # ___ORNEK: 2

  # "Documentation" = { 
  #   # === Proje Yöneticisi (tam admin hakları) ===
  #   lead            = "ahmet"

  #   # === Takımın genel izin seviyesi ===
  #   # "admin"    → tüm repo ayarlarını değiştirebilir
  #   # "maintain" → kod yönetimi + issue + PR kontrolü
  #   # "push"     → yazma yetkisi (kod gönderme)
  #   # "triage"   → issue/PR düzenleme, kod gönderemez
  #   # "pull"     → sadece okuma yetkisi
  #   team_permission = "push"

  #   # === Repositories (repo bazında ayar) ===
  #   repositories = [
  #     {
  #       name         = "01-Documentation"
  #       description  = "Topluluk için genel dokümantasyon"
  #       visibility   = "public"
  #       license      = "mit"

  #       # Repo bazında özel izin tanımı (opsiyonel)
  #       repo_permissions = [
  #         {
  #           username   = "ahmet"
  #           permission = "admin"
  #         },
  #         {
  #           username   = "ayse"
  #           permission = "maintain"
  #         },
  #         {
  #           username   = "mehmet"
  #           permission = "triage"
  #         }
  #       ]
  #     }
  #   ]

  #   # === Team Members ===
  #   members = [
  #     # Lider: admin haklarına sahip
  #     {
  #       username = "ahmet"
  #       role     = "maintainer"
  #       comment  = "Takım lideri — repo ve proje ayarlarının tam kontrolüne sahip."
  #     },
  #     # Teknik destek/mentor
  #     {
  #       username = "ayse"
  #       role     = "maintainer"
  #       comment  = "Eş yöneticilik — PR kontrolü, issue takibi ve dokümantasyon denetimi."
  #     },
  #     # Aktif katkıcılar
  #     {
  #       username = "mehmet"
  #       role     = "member"
  #       comment  = "Kod katkısı, issue açma, PR oluşturma izni var (push)."
  #     },
  #     {
  #       username = "huseyin"
  #       role     = "member"
  #       comment  = "Read + Issue + Pull Request izni (triage)."
  #     },
  #     {
  #       username = "anil"
  #       role     = "member"
  #       comment  = "Belgeleme sürecinde görevli, yazma (push) izni var."
  #     },
  #     {
  #       username = "fatma"
  #       role     = "member"
  #       comment  = "Belge gözden geçirme, yorum yapma (read + comment) yetkisi."
  #     },
  #     {
  #       username = "havva"
  #       role     = "member"
  #       comment  = "Yeni üye, sadece public read erişimine sahip."
  #     }
  #   ]
  # }

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


}

# ___ORNEK: 2

# "Documentation" = { 
#   # === Proje Yöneticisi (tam admin hakları) ===
#   lead            = "ahmet"

#   # === Takımın genel izin seviyesi ===
#   # "admin"    → tüm repo ayarlarını değiştirebilir
#   # "maintain" → kod yönetimi + issue + PR kontrolü
#   # "push"     → yazma yetkisi (kod gönderme)
#   # "triage"   → issue/PR düzenleme, kod gönderemez
#   # "pull"     → sadece okuma yetkisi
#   team_permission = "push"

#   # === Repositories (repo bazında ayar) ===
#   repositories = [
#     {
#       name         = "01-Documentation"
#       description  = "Topluluk için genel dokümantasyon"
#       visibility   = "public"
#       license      = "mit"

#       # Repo bazında özel izin tanımı (opsiyonel)
#       repo_permissions = [
#         {
#           username   = "ahmet"
#           permission = "admin"
#         },
#         {
#           username   = "ayse"
#           permission = "maintain"
#         },
#         {
#           username   = "mehmet"
#           permission = "triage"
#         }
#       ]
#     }
#   ]

#   # === Team Members ===
#   members = [
#     {
#       username = "ahmet"
#       role     = "maintainer"              # Takım yöneticisi
#     },
#     {
#       username = "ayse"
#       role     = "maintainer"              # Eş yönetici
#     },
#     {
#       username = "mehmet"
#       role     = "member"                  # Normal üye
#     },
#     {
#       username = "fatma"
#       role     = "member"
#       comment  = "Kod katkısı, issue açma, PR oluşturma izni var (push)."
#     },
#     {
#       username = "huseyin"
#       role     = "member"
#       comment  = "Read + Issue + Pull Request izni (triage)."
#     },
#     {
#       username = "anil"
#       role     = "member"
#       comment  = "Belgeleme sürecinde görevli, yazma (push) izni var."
#     },
#     {
#       username = "fatma"
#       role     = "member"
#       comment  = "Belge gözden geçirme, yorum yapma (read + comment) yetkisi."
#     },
#     {
#       username = "havva"
#       role     = "member"
#       comment  = "Yeni üye, sadece public read erişimine sahip."
#     }
#   ]
# }

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

