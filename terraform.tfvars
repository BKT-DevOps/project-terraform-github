# GitHub Configuration
github_organization = "BKT-DevOps"

#=============================================================================
# PROJE YAPISININ AÇIKLAMASI
#=============================================================================
# Bu dosyada her proje şu yapıda tanımlanır:
# 
# "project-key" = {                # Proje benzersiz anahtarı (UNIQUE, değişmez)
#   project_display_name = "..."   # Proje görünen adı (opsiyonel, insan okunabilir)
#   team_name            = "..."   # GitHub'da oluşturulacak takım adı
#   project_lead         = "..."   # Proje lideri GitHub kullanıcı adı
#   team_permission      = "push"  # Takım izin seviyesi
#   repositories         = [...]   # Proje altındaki repository'ler
#   members              = [...]   # Takım üyeleri
# }
#
# NOT: 
#   - project-key: Terraform'un kullandığı teknik ID (unique olmalı)
#   - project_display_name: GitHub dokümantasyonunda görünen isim (verilmezse key kullanılır)
#
# TEAM PERMISSION SEVİYELERİ:
#   - "pull"     → Sadece okuma yetkisi
#   - "triage"   → Issue/PR düzenleme, kod gönderemez
#   - "push"     → Yazma yetkisi (kod gönderme) ⭐ Önerilen
#   - "maintain" → Kod yönetimi + issue + PR kontrolü
#
# MEMBER ROLE'LERİ:
#   - "member"     → Normal takım üyesi
#   - "maintainer" → Takım yöneticisi (ekip yönetim yetkisi)
#=============================================================================

# Projects Configuration
projects = {
  # ========================================
  # PROJE: Infrastructure as Code
  # ========================================
  # "InfraCoders" = {
  #   project_display_name = "Infrastructure as Code Project"
  #   project_lead         = "flovearth"
  #   team_name            = "InfraCoders"
  #   team_permission      = "push"
  #   repositories = [
  #     {
  #       name        = "project-terraform-github"
  #       description = "Terraform ile GitHub Repolarının Otomatik Yönetimi"
  #       visibility  = "public"
  #     },

  #   ]
  #   members = [
  #     {
  #       username = "barisbutun"
  #       role     = "member"
  #     },
  #     {
  #       username = "hakanceran64"
  #       role     = "member"
  #     },
  #     {
  #       username = "hulyaoner"
  #       role     = "member"
  #     },
  #     {
  #       username = "ismailaricioglu"
  #       role     = "member"
  #     },
  #     {
  #       username = "karalarmehmet"
  #       role     = "member"
  #     },
  #     {
  #       username = "kheif"
  #       role     = "member"
  #     },
  #     {
  #       username = "purfatih"
  #       role     = "member"
  #     },
  #     {
  #       username = "seyid12"
  #       role     = "member"
  #     },
  #     {
  #       username = "Shamsiaa"
  #       role     = "member"
  #     },
  #     {
  #       username = "slymanmrcan"
  #       role     = "member"
  #     },
  #     {
  #       username = "lerkush"
  #       role     = "member"
  #     }
  #   ]
  # }

  "kovan" = {
    project_display_name = "Kovan Project"
    project_lead         = "hakanceran64"
    team_name            = "Kovan"
    team_permission      = "push"
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


  "lutfiye_test_projects" = {
    project_display_name = "Test Projects of Lutfiye"
    project_lead         = "lerkush"
    team_permission      = "push"
    team_name            = "Cherish"
    repositories = [
      {
        name        = "test_le_backend"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = "" # MIT lisansı olusmalı
      },
      {
        name        = "test_le_frontend"
        description = "Test repository for demo purposes"
        visibility  = "public"
        # MIT lisansı otomatik olarak kullanılacak
      },
      {
        name        = "test_le_web"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = "mit"
      },
      {
        name        = "test_le_android"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = "apache-2.0"
      },
      {
        name        = "test_le_ios"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = "lgpl-3.0"
      },
      {
        name        = "test_le_document"
        description = "Test repository for demo purposes"
        visibility  = "public"
        license     = "unlicense"
      },
      {
        name        = "test_le_docs"
        description = "Test repository for demo purposes"
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
        username = "karalarmehmet"
        role     = "member"
      },
      {
        username = "slymanmrcan"
        role     = "maintainer"
      }
    ]
  }

  "feyz-test" = {
    project_display_name = "Feedback System"
    project_lead         = "flovearth"
    team_name            = "Feedy"
    team_permission      = "push"
    repositories = [
      {
        name        = "feedback-service"
        description = "Core service for Project Feedy"
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


}


