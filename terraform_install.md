
# 🌍 Terraform Kurulum Rehberi | Terraform Installation Guide

<details open>
<summary><h2>🇹🇷 TÜRKÇE </h2></summary>

Bu doküman, **Terraform**'un Windows, Linux ve macOS işletim sistemlerine nasıl kurulacağını adım adım açıklar.  
Terraform, altyapıyı kodla yönetmeyi sağlayan (Infrastructure as Code – IaC) güçlü bir araçtır.

---

## 🪟 1. Windows Kurulumu

### 🔹 Yöntem 1: Manuel Kurulum

1. **Terraform İndir:**  
   [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

2. **ZIP Dosyasını Çıkar:**  
   Önerilen dizin: `C:\terraform` (isteğe göre `C:\Program Files\terraform` dizinine de kurabilirsiniz.)

3. **PATH Ayarı Yap:**  
   - Başlat → "Environment Variables" → "Edit the system environment variables"  
   - "Environment Variables" → "Path" → "Edit" → "New" → `C:\terraform` ekle (kurulumu `C:\Program Files\terraform` dizinine yaptıysanız burada onu ekleyin.)
   - Değişiklikleri kaydet.

4. **Doğrulama:**
   ```bash
   terraform -version
   ```

### 🔹 Yöntem 2: Chocolatey ile Kurulum

Chocolatey, Windows için popüler bir paket yöneticisidir.

1. **PowerShell'i Yönetici olarak aç ve çalıştır:**
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; `
   [System.Net.ServicePointManager]::SecurityProtocol = `
   [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   ```
 
2. **Terraform'u kur:**  
   ```powershell
   choco install terraform -y
   ```

3. **Doğrulama:**
   ```powershell
   terraform version
   ```

---

## 🐧 2. Linux Kurulumu

### 🔹 Yöntem 1: APT ile (Ubuntu/Debian)

1. **Gerekli araçları kur:**
   ```bash
   sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
   ```
   
2. **HashiCorp GPG anahtarını ekle:**
   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | \
   sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
   ```
   
3. **HashiCorp deposunu ekle:**
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
   https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
   sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```
   
4. **Terraform'u yükle:**
   ```bash
   sudo apt update
   sudo apt install terraform
   ```
   
5. **Doğrulama:**
   ```bash
   terraform -version
   ```

### 🔹 Yöntem 2: Manuel Kurulum

1. **İndir:**
   ```bash
   wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip
   ```
   
2. **Arşivi Çıkar:**
   ```bash
   unzip terraform_1.9.8_linux_amd64.zip
   ```
   
3. **Binary dosyayı taşı:**
   ```bash
   sudo mv terraform /usr/local/bin/
   ```
   
4. **Versiyonu kontrol et:**
   ```bash
   terraform -version
   ```

---

## 🍏 3. macOS Kurulumu

### 🔹 Yöntem 1: Homebrew ile Kurulum

1. **Homebrew kurulu değilse:**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
2. **Terraform'u kur:**
   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

3. **Doğrulama:**
   ```bash
   terraform -version
   ```

### 🔹 Yöntem 2: Manuel Kurulum

1. **Terraform'u indir:**  
   [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
   
2. **Zip dosyasını çıkar:**
   ```bash
   unzip terraform_1.9.8_darwin_amd64.zip
   ```
   
3. **Binary dosyayı taşı:**
   ```bash
   sudo mv terraform /usr/local/bin/
   ```
   
4. **Versiyonu kontrol et:**
   ```bash
   terraform version
   ```

---

## 🚀 4. Proje Oluşturma

### 📁 1. Proje Klasörünü Oluşturma

VS Code terminalini aç ve aşağıdaki komutları çalıştır:

```bash
mkdir terraform-github
cd terraform-github    
```

Bu komutlar, "terraform-github" isminde bir klasör oluşturur ve içine girer.  
Artık bu klasörde 3 dosya oluşturacağız. Klasör yapısı şöyle olacak:

```
terraform-github/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

### 🧱 2. Dosyaları Hazırlama

#### 📄 main.tf

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "example_repo" {
  name        = "terraform-managed-repo"
  description = "Repository managed by Terraform via VS Code"
  visibility  = "private"
  has_issues  = true
  has_wiki    = false
}
```

✅ Bu dosya, Terraform'un GitHub provider'ını kullanacağını belirtir.  
✅ `github_repository` kaynağı, GitHub üzerinde otomatik olarak bir repo oluşturur.

#### 📄 variables.tf

```hcl
variable "github_token" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
}

variable "github_owner" {
  type        = string
  description = "GitHub account or organization name"
}
```

✅ Bu dosya, değişkenleri tanımlar.  
✅ Token ve kullanıcı adını ayrı bir dosyada tanımlamak güvenli bir yöntemdir.

#### 📄 terraform.tfvars

```hcl
github_token = "ghp_xxxxxxx"     # Buraya token'ını yaz
github_owner = "kullanıcı-adın"  # GitHub kullanıcı adın veya organizasyon adın
```

✅ Bu dosya değişkenlerin değerlerini içerir.  
⚠️ **Kesinlikle GitHub'a push etme! Çünkü token gizlidir.**

### 🔒 3. `.gitignore` Dosyası Ekle

Proje kök dizinine `.gitignore` adında bir dosya oluştur ve şu satırları ekle:

```
terraform.tfvars
.terraform/
```

### 🔑 4. GitHub Token Alma (Access Token)

GitHub hesabında şu adımları izle:

1. **Profile Picture** → **Settings**
2. **Developer Settings** → **Personal Access Tokens** → **Tokens (classic)**
3. **"Generate new token (classic)"** seçeneğini tıkla
4. **Ad ver:** `terraform-github`
5. **Süre:** "No expiration" veya 90 days
6. **İzinleri işaretle:**
   - `repo`
   - `admin:repo_hook`
   - `read:org`
7. **Generate token** butonuna bas → çıkan `ghp_....` ile başlayan token'ı kopyala (sonradan göremeyeceksin)
8. Bu token'ı `terraform.tfvars` içine yapıştır

### 🧩 5. Terraform Komutları

Terraform'u çalıştırmak için VS Code'un kendi terminalini aç ve sırasıyla şu komutları çalıştır:

#### 🔹 Terraform başlatma
```bash
terraform init
```
👉 Gerekli provider'ları indirir ve projeyi hazırlar.

#### 🔹 Planı görme
```bash
terraform plan
```
👉 Ne oluşturulacağını gösterir.

#### 🔹 Uygulama
```bash
terraform apply
```
👉 `apply` sırasında senden "yes" onayı isteyecek — yaz ve Enter'a bas.

✅ Terraform, GitHub üzerinde senin adına `terraform-managed-repo` adlı özel bir repo oluşturur.

---

## 📚 5. Ek Bilgi

- **Terraform belgeleri:** [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)
- **Terraform Registry:** [https://registry.terraform.io/](https://registry.terraform.io/)

---

## 🎯 Özet

Bu rehberde:
- ✅ Terraform'u Windows, Linux ve macOS'a kurduk
- ✅ GitHub ile entegrasyon için bir proje oluşturduk
- ✅ Güvenli bir şekilde token yönetimini öğrendik
- ✅ Terraform komutlarıyla altyapıyı kod olarak yönettik

</details>

---

<details>
<summary><h2>🇬🇧 ENGLISH</h2></summary>

This document explains step-by-step how to install **Terraform** on Windows, Linux, and macOS operating systems.  
Terraform is a powerful tool that enables Infrastructure as Code (IaC) management.

---

## 🪟 1. Windows Installation

### 🔹 Method 1: Manual Installation

1. **Download Terraform:**  
   [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

2. **Extract the ZIP File:**  
   Recommended directory: `C:\terraform` (you can also install to `C:\Program Files\terraform` if preferred)

3. **Configure PATH:**  
   - Start → "Environment Variables" → "Edit the system environment variables"  
   - "Environment Variables" → "Path" → "Edit" → "New" → Add `C:\terraform`
   - Save changes

4. **Verify:**
   ```bash
   terraform -version
   ```

### 🔹 Method 2: Installation with Chocolatey

Chocolatey is a popular package manager for Windows.

1. **Open PowerShell as Administrator and run:**
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; `
   [System.Net.ServicePointManager]::SecurityProtocol = `
   [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   ```
 
2. **Install Terraform:**  
   ```powershell
   choco install terraform -y
   ```

3. **Verify:**
   ```powershell
   terraform version
   ```

---

## 🐧 2. Linux Installation

### 🔹 Method 1: Using APT (Ubuntu/Debian)

1. **Install required tools:**
   ```bash
   sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
   ```
   
2. **Add HashiCorp GPG key:**
   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | \
   sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
   ```
   
3. **Add HashiCorp repository:**
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
   https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
   sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```
   
4. **Install Terraform:**
   ```bash
   sudo apt update
   sudo apt install terraform
   ```
   
5. **Verify:**
   ```bash
   terraform -version
   ```

### 🔹 Method 2: Manual Installation

1. **Download:**
   ```bash
   wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip
   ```
   
2. **Extract archive:**
   ```bash
   unzip terraform_1.9.8_linux_amd64.zip
   ```
   
3. **Move binary file:**
   ```bash
   sudo mv terraform /usr/local/bin/
   ```
   
4. **Check version:**
   ```bash
   terraform -version
   ```

---

## 🍏 3. macOS Installation

### 🔹 Method 1: Installation with Homebrew

1. **If Homebrew is not installed:**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
2. **Install Terraform:**
   ```bash
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

3. **Verify:**
   ```bash
   terraform -version
   ```

### 🔹 Method 2: Manual Installation

1. **Download Terraform:**  
   [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
   
2. **Extract zip file:**
   ```bash
   unzip terraform_1.9.8_darwin_amd64.zip
   ```
   
3. **Move binary file:**
   ```bash
   sudo mv terraform /usr/local/bin/
   ```
   
4. **Check version:**
   ```bash
   terraform version
   ```

---

## 🚀 4. Creating a Project

### 📁 1. Creating the Project Folder

Open VS Code terminal and run the following commands:

```bash
mkdir terraform-github
cd terraform-github    
```

These commands create a folder named "terraform-github" and navigate into it.  
Now we'll create 3 files in this folder. The folder structure will look like this:

```
terraform-github/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

### 🧱 2. Preparing the Files

#### 📄 main.tf

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "example_repo" {
  name        = "terraform-managed-repo"
  description = "Repository managed by Terraform via VS Code"
  visibility  = "private"
  has_issues  = true
  has_wiki    = false
}
```

✅ This file specifies that Terraform will use the GitHub provider.  
✅ The `github_repository` resource automatically creates a repository on GitHub.

#### 📄 variables.tf

```hcl
variable "github_token" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
}

variable "github_owner" {
  type        = string
  description = "GitHub account or organization name"
}
```

✅ This file defines variables.  
✅ Defining token and username in a separate file is a secure method.

#### 📄 terraform.tfvars

```hcl
github_token = "ghp_xxxxxxx"     # Put your token here
github_owner = "your-username"   # Your GitHub username or organization name
```

✅ This file contains the values of variables.  
⚠️ **Never push this to GitHub! The token is confidential.**

### 🔒 3. Add `.gitignore` File

Create a file named `.gitignore` in the project root directory and add these lines:

```
terraform.tfvars
.terraform/
```

### 🔑 4. Getting GitHub Token (Access Token)

Follow these steps in your GitHub account:

1. **Profile Picture** → **Settings**
2. **Developer Settings** → **Personal Access Tokens** → **Tokens (classic)**
3. Click **"Generate new token (classic)"**
4. **Name it:** `terraform-github`
5. **Expiration:** "No expiration" or 90 days
6. **Check permissions:**
   - `repo`
   - `admin:repo_hook`
   - `read:org`
7. Click **Generate token** → Copy the token starting with `ghp_....` (you won't be able to see it later)
8. Paste this token into `terraform.tfvars`

### 🧩 5. Terraform Commands

To run Terraform, open VS Code's terminal and execute these commands in order:

#### 🔹 Initialize Terraform
```bash
terraform init
```
👉 Downloads required providers and prepares the project.

#### 🔹 View the plan
```bash
terraform plan
```
👉 Shows what will be created.

#### 🔹 Apply
```bash
terraform apply
```
👉 During `apply`, it will ask for "yes" confirmation — type it and press Enter.

✅ Terraform will create a private repository named `terraform-managed-repo` on GitHub for you.

---

## 📚 5. Additional Information

- **Terraform documentation:** [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)
- **Terraform Registry:** [https://registry.terraform.io/](https://registry.terraform.io/)

---

## 🎯 Summary

In this guide we:
- ✅ Installed Terraform on Windows, Linux, and macOS
- ✅ Created a project for GitHub integration
- ✅ Learned secure token management
- ✅ Managed infrastructure as code with Terraform commands

</details>
