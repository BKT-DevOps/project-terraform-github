# GitHub Repository Management with Terraform

<div align="center">

[![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![GitHub](https://img.shields.io/badge/GitHub-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

**Terraform ile GitHub organizasyonundaki repository'leri, takımları ve erişim kontrollerini otomatik olarak yöneten Infrastructure as Code (IaC) projesi**

</div>

---

<details open>
<summary><strong>🇹🇷 Türkçe</strong></summary>

<br>

> **ÖNEMLİ:** Bu repo, **InfraCoders** projesinin bir parçasıdır. Projenin genel hedefleri hakkında bilgi için [`docs/Project-Definition.md`](docs/Project-Definition.md) belgesini inceleyin.

## 📋 İçindekiler

- [Genel Bakış](#-genel-bakış)
- [Özellikler](#-özellikler)
- [Mimari](#-mimari)
- [Ön Gereksinimler](#-ön-gereksinimler)
- [Kurulum](#-kurulum)
- [Kullanım](#-kullanım)
- [Yapılandırma](#-yapılandırma)
- [Outputs](#-outputs)
- [Güvenlik](#-güvenlik)
- [Katkıda Bulunma](#-katkıda-bulunma)

## 🎯 Genel Bakış

Bu Terraform modülü, GitHub organizasyonunuzdaki repository'leri, takımları, branch protection kurallarını ve erişim kontrollerini kod üzerinden yönetmenizi sağlar. Manuel yapılandırma hatalarını ortadan kaldırır ve tutarlı bir altyapı sağlar.

### Ne İşe Yarar?

- ✅ Proje bazlı GitHub takımları oluşturma
- ✅ Repository'leri otomatik olarak oluşturma ve yapılandırma
- ✅ Takım üyelerini ve erişim izinlerini yönetme
- ✅ Branch protection kuralları uygulama (main, develop, release)
- ✅ CODEOWNERS dosyası otomatik oluşturma
- ✅ Issue label'ları ve şablonları yapılandırma
- ✅ İmzalı commit zorunluluğu ve PR review kuralları

## ✨ Özellikler

### Repository Yönetimi
- Otomatik repository oluşturma (public/private)
- GitIgnore ve License şablonu desteği
- Branch'lar arası otomatik bağlantı (main → develop → release)
- Merge stratejileri yapılandırması
- Auto-merge desteği

### Güvenlik ve Erişim Kontrolü
- Branch protection rules (main branch koruması)
- İmzalı commit zorunluluğu
- PR approval requirement (minimum 1 onay)
- Code owner review zorunluluğu
- Takım bazlı erişim yönetimi (pull, triage, push, maintain)
- Admin erişimi (proje liderlerine özel)

### Takım Yönetimi
- Proje bazlı GitHub takımları
- Takım üyesi rolleri (member, maintainer)
- Otomatik takım-repository ilişkilendirmesi
- Proje lideri atama

### Otomasyon
- Otomatik initial setup issue oluşturma
- CODEOWNERS dosyası otomasyonu
- Issue template'leri
- Standart label'lar (setup, priority:high)

## 🏗️ Mimari

```
┌─────────────────────────────────────────────────────────┐
│                    terraform.tfvars                     │
│              (Proje ve Takım Tanımları)                 │
└─────────────────┬───────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────────┐
│                    Terraform State                       │
│              (Remote Backend - S3/R2/etc.)              │
└─────────────────┬───────────────────────────────────────┘
                  │
      ┌───────────┴───────────┐
      ▼                       ▼
┌──────────┐          ┌──────────────┐
│  Teams   │          │ Repositories │
│          │◄─────────┤              │
│  • IAM   │  Access  │  • Branches  │
│  • Roles │          │  • Protection│
└──────────┘          │  • Files     │
                      └──────────────┘
```

## 🔧 Ön Gereksinimler

Bu projeyi çalıştırmak için aşağıdaki araçların kurulu olması gerekir:

- **Terraform** `>= 1.0`
- **GitHub Personal Access Token** (gerekli izinlerle)
  - `repo` (full control)
  - `admin:org` (read:org, write:org)
  - `delete_repo` (repo silme işlemleri için)
- **Remote Backend Erişimi** (state yönetimi için)
- **Git** `>= 2.0`

### GitHub Token İzinleri

Token'ınız şu izinlere sahip olmalıdır:
```
✓ repo (Full control of repositories)
  ✓ repo:status
  ✓ repo_deployment
  ✓ public_repo
  ✓ repo:invite
  ✓ security_events
✓ admin:org (Full control of orgs and teams)
  ✓ write:org
  ✓ read:org
✓ delete_repo (Delete repositories)
```

## 🚀 Kurulum

### 1. Repository'yi Klonlayın

```bash
git clone https://github.com/BKT-DevOps/project-terraform-github.git
cd project-terraform-github
```

### 2. Terraform'u Başlatın

```bash
terraform init
```

### 3. Yapılandırma Dosyasını Düzenleyin

`terraform.tfvars` dosyasını düzenleyerek proje yapılandırmanızı tanımlayın:

```hcl
github_organization = "YourOrganization"

projects = {
  "YourProject" = {
    team_name       = "your-team"
    project_lead    = "your-github-username"
    team_permission = "push"
    repositories = [
      {
        name        = "your-repo-name"
        description = "Repository açıklaması"
        visibility  = "private"
        license     = "mit"
      }
    ]
    members = [
      {
        username = "member1"
        role     = "member"
      }
    ]
  }
}
```

### 4. GitHub Token'ı Ayarlayın

```bash
export TF_VAR_github_token="your_github_personal_access_token"
```

> **⚠️ Güvenlik Notu:** Token'ınızı asla git'e commit etmeyin!

## 💻 Kullanım

### Plan Oluşturma

Terraform'un ne yapacağını görmek için:

```bash
terraform plan
```

### Değişiklikleri Uygulama

```bash
terraform apply
```

### Kaynakları Silme

```bash
terraform destroy
```

### Testleri Çalıştırma

```bash
terraform test
```

## ⚙️ Yapılandırma

### Proje Yapısı

Her proje `terraform.tfvars` dosyasında şu yapıda tanımlanır:

```hcl
"proje-identifier" = {
  team_name       = "..."        # GitHub'da oluşturulacak takım adı
  project_lead    = "..."        # Proje lideri GitHub kullanıcı adı
  team_permission = "push"       # Takım izin seviyesi
  repositories    = [...]        # Proje altındaki repository'ler
  members         = [...]        # Takım üyeleri
}
```

### Team Permission Seviyeleri

| Seviye | Açıklama |
|--------|----------|
| `pull` | Sadece okuma yetkisi |
| `triage` | Issue/PR düzenleme, kod gönderemez |
| `push` | Yazma yetkisi (kod gönderme) ⭐ Önerilen |
| `maintain` | Kod yönetimi + issue + PR kontrolü |

### Member Rolleri

| Role | Açıklama |
|------|----------|
| `member` | Normal takım üyesi |
| `maintainer` | Takım yöneticisi |

### Repository Yapılandırma Seçenekleri

```hcl
{
  name        = "repo-name"           # Repository adı (zorunlu)
  description = "Açıklama"            # Açıklama (zorunlu)
  visibility  = "public"              # public veya private (zorunlu)
  license     = "mit"                 # Lisans şablonu (opsiyonel, default: mit)
  gitignore_template = "Terraform"    # GitIgnore şablonu (opsiyonel)
}
```

## 📤 Outputs

Terraform apply sonrası aşağıdaki çıktıları alırsınız:

### `teams`
Oluşturulan takımların bilgileri (id, name, slug)

### `repositories`
Oluşturulan repository'lerin bilgileri (name, url, clone url)

### `team_memberships`
Takım üyelik özeti (proje lideri, üyeler, repository'ler)

### `project_summary`
Genel özet (toplam proje, repo ve üye sayısı)

**Örnek:**
```bash
terraform output teams
terraform output repositories
terraform output project_summary
```

## 🔒 Güvenlik

### Uygulanan Güvenlik Önlemleri

- ✅ İmzalı commit zorunluluğu (Signed commits required)
- ✅ Branch protection rules
- ✅ PR review requirement (min. 1 approval)
- ✅ Code owner review zorunluluğu
- ✅ Branch silme koruması
- ✅ Force push koruması
- ✅ Merge stratejisi kontrolü

### Backend Güvenliği

Terraform state dosyası uzak bir backend'de şifrelenmiş olarak saklanır. Backend yapılandırması `versions.tf` dosyasında tanımlanmıştır ve değişik sağlayıcıları destekler (S3, Cloudflare R2, vb.).

### En İyi Güvenlik Pratikleri

1. GitHub token'ınızı çevre değişkeni olarak kullanın
2. State dosyasına erişimi sınırlandırın
3. Branch protection'ı devre dışı bırakmayın
4. İmzalı commit kullanımını zorunlu tutun
5. Düzenli olarak token'ları yenileyin

## 📁 Dosya Yapısı

```
.
├── main.tf                 # Ana Terraform yapılandırması
├── variables.tf            # Değişken tanımlamaları
├── outputs.tf             # Çıktı tanımlamaları
├── versions.tf            # Provider ve Terraform versiyonları
├── terraform.tfvars       # Değişken değerleri (GİZLİ!)
├── tests/
│   └── unit.tftest.hcl   # Terraform testleri
├── docs/                  # Dokümantasyon
│   ├── Project-Definition.md
│   ├── Architecture-Overview.md
│   └── Development-Workflow.md
├── .github/
│   └── ISSUE_TEMPLATE/   # Issue şablonları
├── CONTRIBUTING.md        # Katkı rehberi
├── CODE_OF_CONDUCT.md    # Davranış kuralları
└── README.md             # Bu dosya
```

## 🤝 Katkıda Bulunma

Projeye katkıda bulunmak isterseniz, lütfen [`CONTRIBUTING.md`](CONTRIBUTING.md) dosyasını inceleyin.

### Katkı Süreci

1. Bu repository'yi fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

### Geliştirme Akışı

Detaylı geliştirme akışı için [`docs/Development-Workflow.md`](docs/Development-Workflow.md) belgesine bakın.

## 📚 Ek Kaynaklar

- [Terraform GitHub Provider Dokümantasyonu](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [GitHub API Dokümantasyonu](https://docs.github.com/en/rest)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Git Signed Commits Guide](docs/Verified-Commits-Guide.md)

## 🐛 Sorun Bildirimi

Bir sorun bulursanız veya öneriniz varsa lütfen [Issue](https://github.com/BKT-DevOps/project-terraform-github/issues) açın.

## 📄 Lisans

Bu proje **MIT Lisansı** ile lisanslanmıştır. Detaylar için [`LICENSE`](LICENSE) dosyasına bakınız.

## 👥 Proje Ekibi

**Proje Lideri:** [@flovearth](https://github.com/flovearth)

Ekip bilgileri için [`docs/Team.md`](docs/Team.md) dosyasına bakın.

---

<div align="center">
  
**[⬆ Başa Dön](#github-repository-management-with-terraform)**

<sub>Bu proje ❤️ ile InfraCoders ekibi tarafından geliştirilmiştir.</sub>

</div>

</details>

<details>
<summary><strong>🇬🇧 English</strong></summary>

<br>

> **IMPORTANT:** This repository is part of the **InfraCoders** project. For information about the overall project goals, please review the [`docs/Project-Definition.md`](docs/Project-Definition.md) document.

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Architecture](#-architecture)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Usage](#-usage)
- [Configuration](#-configuration)
- [Outputs](#-outputs)
- [Security](#-security)
- [Contributing](#-contributing)

## 🎯 Overview

This Terraform module enables you to manage repositories, teams, branch protection rules, and access controls in your GitHub organization through code. It eliminates manual configuration errors and provides a consistent infrastructure.

### What Does It Do?

- ✅ Create project-based GitHub teams
- ✅ Automatically create and configure repositories
- ✅ Manage team members and access permissions
- ✅ Apply branch protection rules (main, develop, release)
- ✅ Auto-generate CODEOWNERS files
- ✅ Configure issue labels and templates
- ✅ Enforce signed commits and PR review requirements

## ✨ Features

### Repository Management
- Automatic repository creation (public/private)
- GitIgnore and License template support
- Automatic branch linking (main → develop → release)
- Merge strategy configuration
- Auto-merge support

### Security and Access Control
- Branch protection rules (main branch protection)
- Signed commit requirement
- PR approval requirement (minimum 1 approval)
- Code owner review requirement
- Team-based access management (pull, triage, push, maintain)
- Admin access (for project leads)

### Team Management
- Project-based GitHub teams
- Team member roles (member, maintainer)
- Automatic team-repository association
- Project lead assignment

### Automation
- Automatic initial setup issue creation
- CODEOWNERS file automation
- Issue templates
- Standard labels (setup, priority:high)

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    terraform.tfvars                     │
│           (Project and Team Definitions)                │
└─────────────────┬───────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────────┐
│                    Terraform State                       │
│              (Remote Backend - S3/R2/etc.)              │
└─────────────────┬───────────────────────────────────────┘
                  │
      ┌───────────┴───────────┐
      ▼                       ▼
┌──────────┐          ┌──────────────┐
│  Teams   │          │ Repositories │
│          │◄─────────┤              │
│  • IAM   │  Access  │  • Branches  │
│  • Roles │          │  • Protection│
└──────────┘          │  • Files     │
                      └──────────────┘
```

## 🔧 Prerequisites

The following tools must be installed to run this project:

- **Terraform** `>= 1.0`
- **GitHub Personal Access Token** (with required permissions)
  - `repo` (full control)
  - `admin:org` (read:org, write:org)
  - `delete_repo` (for repository deletion)
- **Remote Backend Access** (for state management)
- **Git** `>= 2.0`

### GitHub Token Permissions

Your token must have the following permissions:
```
✓ repo (Full control of repositories)
  ✓ repo:status
  ✓ repo_deployment
  ✓ public_repo
  ✓ repo:invite
  ✓ security_events
✓ admin:org (Full control of orgs and teams)
  ✓ write:org
  ✓ read:org
✓ delete_repo (Delete repositories)
```

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/BKT-DevOps/project-terraform-github.git
cd project-terraform-github
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Edit Configuration File

Edit the `terraform.tfvars` file to define your project configuration:

```hcl
github_organization = "YourOrganization"

projects = {
  "YourProject" = {
    team_name       = "your-team"
    project_lead    = "your-github-username"
    team_permission = "push"
    repositories = [
      {
        name        = "your-repo-name"
        description = "Repository description"
        visibility  = "private"
        license     = "mit"
      }
    ]
    members = [
      {
        username = "member1"
        role     = "member"
      }
    ]
  }
}
```

### 4. Set GitHub Token

```bash
export TF_VAR_github_token="your_github_personal_access_token"
```

> **⚠️ Security Note:** Never commit your token to git!

## 💻 Usage

### Creating a Plan

To see what Terraform will do:

```bash
terraform plan
```

### Applying Changes

```bash
terraform apply
```

### Destroying Resources

```bash
terraform destroy
```

### Running Tests

```bash
terraform test
```

## ⚙️ Configuration

### Project Structure

Each project is defined in the `terraform.tfvars` file with the following structure:

```hcl
"project-identifier" = {
  team_name       = "..."        # Team name to be created in GitHub
  project_lead    = "..."        # Project lead's GitHub username
  team_permission = "push"       # Team permission level
  repositories    = [...]        # Repositories under the project
  members         = [...]        # Team members
}
```

### Team Permission Levels

| Level | Description |
|-------|-------------|
| `pull` | Read-only access |
| `triage` | Issue/PR editing, cannot push code |
| `push` | Write access (code push) ⭐ Recommended |
| `maintain` | Code management + issue + PR control |

### Member Roles

| Role | Description |
|------|-------------|
| `member` | Regular team member |
| `maintainer` | Team manager |

### Repository Configuration Options

```hcl
{
  name        = "repo-name"           # Repository name (required)
  description = "Description"         # Description (required)
  visibility  = "public"              # public or private (required)
  license     = "mit"                 # License template (optional, default: mit)
  gitignore_template = "Terraform"    # GitIgnore template (optional)
}
```

## 📤 Outputs

After terraform apply, you get the following outputs:

### `teams`
Information about created teams (id, name, slug)

### `repositories`
Information about created repositories (name, url, clone url)

### `team_memberships`
Team membership summary (project lead, members, repositories)

### `project_summary`
Overall summary (total projects, repos, and member count)

**Example:**
```bash
terraform output teams
terraform output repositories
terraform output project_summary
```

## 🔒 Security

### Applied Security Measures

- ✅ Signed commit requirement
- ✅ Branch protection rules
- ✅ PR review requirement (min. 1 approval)
- ✅ Code owner review requirement
- ✅ Branch deletion protection
- ✅ Force push protection
- ✅ Merge strategy control

### Backend Security

The Terraform state file is stored encrypted in a remote backend. Backend configuration is defined in the `versions.tf` file and supports various providers (S3, Cloudflare R2, etc.).

### Security Best Practices

1. Use GitHub token as an environment variable
2. Restrict access to the state file
3. Don't disable branch protection
4. Enforce signed commit usage
5. Regularly rotate tokens

## 📁 File Structure

```
.
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── outputs.tf             # Output definitions
├── versions.tf            # Provider and Terraform versions
├── terraform.tfvars       # Variable values (SENSITIVE!)
├── tests/
│   └── unit.tftest.hcl   # Terraform tests
├── docs/                  # Documentation
│   ├── Project-Definition.md
│   ├── Architecture-Overview.md
│   └── Development-Workflow.md
├── .github/
│   └── ISSUE_TEMPLATE/   # Issue templates
├── CONTRIBUTING.md        # Contribution guide
├── CODE_OF_CONDUCT.md    # Code of conduct
└── README.md             # This file
```

## 🤝 Contributing

If you wish to contribute to the project, please review the [`CONTRIBUTING.md`](CONTRIBUTING.md) file.

### Contribution Process

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add amazing feature'`)
4. Push your branch (`git push origin feature/amazing-feature`)
5. Create a Pull Request

### Development Workflow

For detailed development workflow, see the [`docs/Development-Workflow.md`](docs/Development-Workflow.md) document.

## 📚 Additional Resources

- [Terraform GitHub Provider Documentation](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [GitHub API Documentation](https://docs.github.com/en/rest)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Git Signed Commits Guide](docs/Verified-Commits-Guide.md)

## 🐛 Issue Reporting

If you find a bug or have a suggestion, please open an [Issue](https://github.com/BKT-DevOps/project-terraform-github/issues).

## 📄 License

This project is licensed under the **MIT License**. See the [`LICENSE`](LICENSE) file for details.

## 👥 Project Team

**Project Lead:** [@flovearth](https://github.com/flovearth)

For team information, see the [`docs/Team.md`](docs/Team.md) file.

---

<div align="center">
  
**[⬆ Back to Top](#github-repository-management-with-terraform)**

<sub>This project is developed with ❤️ by the InfraCoders team.</sub>

</div>

</details>