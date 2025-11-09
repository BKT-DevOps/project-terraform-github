# GitHub Configuration
github_organization = "BKT-DevOps"

# Example Project Configuration
# "project-alpha" = {  # "project-alpha" takım ismi olacaktır
#   lead            = "flovearth" # proje lideri
#   team_permission = "push" # takım izni
#   repositories = [ # proje repoları
#     {
#       name              = "to-do-api" # repo ismi
#       description       = "API service for Project To-Do" # repo açıklaması
#       visibility        = "public" # repo görünürlüğü
#     }
#   ]
#   members = [ # proje üyeleri
#     {
#       username = "flovearth" # üye GitHub kullanıcı adı
#       role     = "maintainer" # üye rolü (maintainer repo yöneticisi, member normal üye)
#     },
#     {
#       username = "hulyaoner" # üye GitHub kullanıcı adı
#       role     = "member" # üye rolü (maintainer repo yöneticisi, member normal üye)
#     },
#     {
#       username = "lerkush"
#       role     = "member"
#     },
#     {
#       username = "ismailaricioglu"
#       role     = "member"
#     }  # aynı formatta diğer üyeler eklenebilir 
#   ]
# }

# Projects Configuration
projects = {
  "InfraCoders" = {
    lead            = "flovearth"
    team_permission = "push"
    repositories = [
      {
        name        = "project-terraform-github"
        description = "Terraform ile GitHub Repolarının Otomatik yönetimi"
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
      }
    ]
  }

  "kovan" = {
    lead            = "hakanceran64"
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
    lead            = "ismailaricioglu"
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
    lead            = "ismailaricioglu"
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
  }

  # Ekip Rolleri ve İzinler İçin Örnekler

  # ___ORNEK: 1

  # "Documentation" = {
  #   lead            = "flovearth"
  #   team_permission = "push"
  #   repositories = [
  #     {
  #       name        = "01-Documentation"
  #       description = "Topluluk için genel dokümantasyon"
  #       visibility  = "public"
  #     }
  #   ]
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
