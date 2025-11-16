# License Selection Guide / Lisans Seçim Rehberi

<details open>
<summary><h2>🇹🇷 Türkçe</h2></summary>

### Genel Bakış
Bu Terraform yapılandırması ile repository oluştururken lisanslama üzerinde tam kontrole sahipsiniz. Sistem, belirttiğiniz kriterlere göre lisans dosyasını otomatik olarak oluşturur.

### Nasıl Çalışır?

#### Varsayılan Davranış
Eğer bir lisans belirtmezseniz veya boş bırakırsanız (`""`), otomatik olarak **MIT Lisansı** repository'nize eklenecektir.

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    # Lisans belirtilmemiş - varsayılan olarak MIT kullanılacak
  },
  {
    name        = "diger-proje"
    description = "Diğer proje"
    visibility  = "public"
    license     = ""  # Boş lisans - varsayılan olarak MIT kullanılacak
  }
]
```

#### Lisans Belirtme
Farklı bir lisans kullanmak için, geçerli bir lisans tanımlayıcısı ile `license` alanını ekleyin:

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    license     = "apache-2.0"  # Apache License 2.0 kullanılacak
  }
]
```

#### Lisanssız
Repository'nizde hiçbir lisans dosyası istemiyorsanız, `"none"` değerini kullanın:

```hcl
repositories = [
  {
    name        = "harika-projem"
    description = "Proje açıklaması"
    visibility  = "public"
    license     = "none"  # LICENSE dosyası oluşturulmayacak
  }
]
```

### Geçerli Lisans Tanımlayıcıları

GitHub tarafından desteklenen lisans tanımlayıcıları:

| Lisans Adı | Tanımlayıcı | Açıklama |
|------------|-------------|----------|
| MIT Lisansı | `mit` | Basit ve izin verici |
| Apache Lisansı 2.0 | `apache-2.0` | Patent hakları ile izin verici |
| GNU GPLv3 | `gpl-3.0` | Güçlü copyleft |
| GNU AGPLv3 | `agpl-3.0` | Ağ copyleft'i |
| GNU LGPLv3 | `lgpl-3.0` | Zayıf copyleft |
| Mozilla Public License 2.0 | `mpl-2.0` | Zayıf copyleft |
| BSD 2-Clause "Basitleştirilmiş" | `bsd-2-clause` | Basit izin verici |
| BSD 3-Clause "Yeni" veya "Revize" | `bsd-3-clause` | Kısıtlamalarla izin verici |
| Boost Yazılım Lisansı 1.0 | `bsl-1.0` | Basit izin verici |
| Creative Commons Zero v1.0 | `cc0-1.0` | Kamu malı |
| Eclipse Public License 2.0 | `epl-2.0` | Zayıf copyleft |
| GNU GPLv2 | `gpl-2.0` | Güçlü copyleft |
| ISC Lisansı | `isc` | Basit izin verici |
| The Unlicense | `unlicense` | Kamu malı |

### Doğrulama

Sistem aşağıdaki kontrolleri içerir:
- Lisans tanımlayıcıları küçük harf olmalıdır
- Sadece geçerli GitHub lisans tanımlayıcıları kabul edilir
- Özel `"none"` değeri lisanssız durumlar için tanınır

Geçersiz bir lisans tanımlayıcısı girerseniz, Terraform herhangi bir kaynak oluşturmadan önce doğrulama aşamasında hata gösterecektir.

### Örnekler

**Örnek 1: Varsayılan MIT lisansı kullanımı**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        # MIT lisansı otomatik olarak kullanılacak
      }
    ]
    members = [...]
  }
}
```

**Örnek 2: Apache 2.0 lisansı kullanımı**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-uygulama"
        description = "Frontend uygulaması"
        visibility  = "public"
        license     = "apache-2.0"
      }
    ]
    members = [...]
  }
}
```

**Örnek 3: Lisanssız**
```hcl
projects = {
  "web-platformu" = {
    team_name       = "Web Platform Ekibi"
    project_lead    = "ahmet-yilmaz"
    team_permission = "push"
    repositories = [
      {
        name        = "dahili-arac"
        description = "Dahili araç"
        visibility  = "private"
        license     = "none"
      }
    ]
    members = [...]
  }
}
```

---

<details open>
<summary><h3>🎯 Hangi Lisansı Seçmeliyim?</h3></summary>

#### **MIT** seçin eğer:
- ✅ Kullanıcılara maksimum özgürlük tanımak istiyorsanız
- ✅ Türev çalışmaların açık kaynak olması umurumuzda değilse
- ✅ Basit, iyi anlaşılan bir lisans istiyorsanız
- ✅ Bir kütüphane veya araç geliştiriyorsanız
- 📦 **Örnekler:** jQuery, Rails, Node.js

#### **Apache 2.0** seçin eğer:
- ✅ Patent koruması istiyorsanız
- ✅ Açık ticari marka koruması gerekiyorsa
- ✅ Kurumsal ortamda çalışıyorsanız
- ✅ Katkıda bulunanların patent hakları vermesini istiyorsanız
- 📦 **Örnekler:** Android, Apache HTTP Server, Kubernetes

#### **GPL 3.0** seçin eğer:
- ✅ Türev çalışmaların açık kaynak kalmasını istiyorsanız
- ✅ Özgür yazılım ilkelerine bağlıysanız
- ✅ Tescilli fork'ları önlemek istiyorsanız
- ✅ Ağ kullanımı çok önemli değilse
- 📦 **Örnekler:** Linux, Git, WordPress eklentileri

#### **AGPL 3.0** seçin eğer:
- ✅ Bir web servisi veya SaaS geliştiriyorsanız
- ✅ Ağ kullanımının paylaşım gereksinimini tetiklemesini istiyorsanız
- ✅ Tescilli hosted versiyonları önlemek istiyorsanız
- ✅ Copyleft'e güçlü şekilde bağlıysanız
- 📦 **Örnekler:** MongoDB, Mastodon, NextCloud

#### **LGPL 3.0** seçin eğer:
- ✅ Bir kütüphane geliştiriyorsanız
- ✅ Kütüphanedeki değişikliklerin açık kaynak olmasını istiyorsanız
- ✅ Tescilli yazılımların kütüphanenize bağlanmasına izin veriyorsanız
- ✅ MIT ve GPL arasında orta bir yol istiyorsanız
- 📦 **Örnekler:** GTK, Qt (çift lisanslı)

#### **MPL 2.0** seçin eğer:
- ✅ Dosya düzeyinde copyleft istiyorsanız
- ✅ GPL ile uyumluluk istiyorsanız
- ✅ Karma lisanslama ile sorun yoksa
- ✅ İzin verici ve copyleft arasında orta yol istiyorsanız
- 📦 **Örnekler:** Firefox, Thunderbird

#### **BSD 2-Clause/3-Clause** seçin eğer:
- ✅ Basit bir izin verici lisans istiyorsanız
- ✅ Akademide çalışıyorsanız
- ✅ MIT'ye benzer ama daha eski bir şey istiyorsanız
- ✅ Adınızın onay için kullanılmasını engellemek istiyorsanız (3-Clause)
- 📦 **Örnekler:** FreeBSD, OpenBSD

#### **ISC** seçin eğer:
- ✅ Mümkün olan en basit izin verici lisansı istiyorsanız
- ✅ MIT'yi seviyorsunuz ama daha basit dil istiyorsanız
- ✅ İşlevsel olarak MIT ile aynı
- 📦 **Örnekler:** OpenBSD araçları, Node.js paketleri

#### **Unlicense** seçin eğer:
- ✅ Çalışmanızı kamu malı yapmak istiyorsanız
- ✅ Hiçbir kısıtlama istemiyorsanız
- ✅ Atıf yapılmasını istemiyorsanız
- ✅ Herkesin kodunuzla her şeyi yapmasıyla sorun yoksa
- 📦 **Örnekler:** Kamu malı projeler

#### **"none"** seçin eğer:
- ✅ Kodunuz tescilli/özel
- ✅ Henüz lisans konusunda karar vermeye hazır değilsiniz
- ✅ Daha sonra özel bir lisans ekleyeceksiniz
- ⚠️ **Uyarı:** Lisans olmadan, başkaları kodunuzu kullanma iznine sahip değildir!

### Lisans Kategorileri

#### **İzin Verici Lisanslar** (Daha Fazla Özgürlük)
Kullanıcıların tescilli türevler oluşturma dahil neredeyse her şeyi yapmasına izin verir.
- MIT, Apache 2.0, BSD 2-Clause/3-Clause, ISC, Unlicense

#### **Zayıf Copyleft Lisansları** (Orta Yol)
Lisanslı kodda yapılan değişikliklerin paylaşılmasını gerektirir, ancak tescilli kodla bağlantıya izin verir.
- LGPL 3.0, MPL 2.0

#### **Güçlü Copyleft Lisansları** (Maksimum Paylaşım)
Türev çalışmaların aynı lisansı kullanmasını gerektirir.
- GPL 3.0, AGPL 3.0

### Lisansımı Sonradan Değiştirebilir miyim?

**Evet, ama karmaşık:**
- ✅ Lisanssız koda her zaman lisans ekleyebilirsiniz
- ✅ Kodunuzu daha izin verici yapabilirsiniz (GPL → MIT)
- ⚠️ Kodu daha kısıtlayıcı yapmak zordur (MIT → GPL)
- ⚠️ Tüm katkıda bulunanlardan izin almanız gerekir
- ⚠️ Mevcut kopyalar eski lisans altında kalır

**En iyi uygulama:** Baştan dikkatli seçin!

</details>

---

## Quick Reference / Hızlı Referans

| Scenario / Senaryo | Configuration / Yapılandırma | Result / Sonuç |
|---------------------|------------------------------|----------------|
| No license field / Lisans alanı yok | `{}` | MIT license / MIT lisansı |
| Empty license / Boş lisans | `license = ""` | MIT license / MIT lisansı |
| Explicit MIT / Açık MIT | `license = "mit"` | MIT license / MIT lisansı |
| Apache 2.0 | `license = "apache-2.0"` | Apache 2.0 license / Apache 2.0 lisansı |
| No license wanted / Lisans istemiyorum | `license = "none"` | No LICENSE file / LICENSE dosyası yok |

---

## Support / Destek

For more information about licenses, visit:
Lisanslar hakkında daha fazla bilgi için:

- **English**: https://choosealicense.com/
- **Türkçe**: https://choosealicense.com/

For GitHub license documentation:
GitHub lisans dokümantasyonu için:

- https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository

</details>

---

<details>
<summary><h2>🇬🇧 English</h2></summary>

### Overview
When creating repositories through this Terraform configuration, you have full control over licensing. The system automatically handles license file creation based on your specification.

### How It Works

#### Default Behavior
If you don't specify a license or leave it empty (`""`), **MIT License** will be automatically added to your repository.

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    # No license specified - MIT will be used by default
  },
  {
    name        = "another-project"
    description = "Another project"
    visibility  = "public"
    license     = ""  # Empty license - MIT will be used by default
  }
]
```

#### Specifying a License
To use a different license, add the `license` field with a valid license identifier:

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    license     = "apache-2.0"  # Apache License 2.0 will be used
  }
]
```

#### No License
If you don't want any license file in your repository, use `"none"`:

```hcl
repositories = [
  {
    name        = "my-awesome-project"
    description = "My project description"
    visibility  = "public"
    license     = "none"  # No LICENSE file will be created
  }
]
```

### Valid License Identifiers

The following license identifiers are supported by GitHub:

| License Name | Identifier | Description |
|--------------|------------|-------------|
| MIT License | `mit` | Simple and permissive |
| Apache License 2.0 | `apache-2.0` | Permissive with patent grant |
| GNU GPLv3 | `gpl-3.0` | Strong copyleft |
| GNU AGPLv3 | `agpl-3.0` | Network copyleft |
| GNU LGPLv3 | `lgpl-3.0` | Weak copyleft |
| Mozilla Public License 2.0 | `mpl-2.0` | Weak copyleft |
| BSD 2-Clause "Simplified" | `bsd-2-clause` | Simple permissive |
| BSD 3-Clause "New" or "Revised" | `bsd-3-clause` | Permissive with restrictions |
| Boost Software License 1.0 | `bsl-1.0` | Simple permissive |
| Creative Commons Zero v1.0 | `cc0-1.0` | Public domain dedication |
| Eclipse Public License 2.0 | `epl-2.0` | Weak copyleft |
| GNU GPLv2 | `gpl-2.0` | Strong copyleft |
| ISC License | `isc` | Simple permissive |
| The Unlicense | `unlicense` | Public domain |

### Validation

The system includes validation to ensure:
- License identifiers are lowercase
- Only valid GitHub license identifiers are accepted
- Special value `"none"` is recognized for no license

If you enter an invalid license identifier, Terraform will show an error during the validation phase before creating any resources.

### Examples

**Example 1: Using default MIT license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-app"
        description = "Frontend application"
        visibility  = "public"
        # MIT license will be used automatically
      }
    ]
    members = [...]
  }
}
```

**Example 2: Using Apache 2.0 license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "frontend-app"
        description = "Frontend application"
        visibility  = "public"
        license     = "apache-2.0"
      }
    ]
    members = [...]
  }
}
```

**Example 3: No license**
```hcl
projects = {
  "web-platform" = {
    team_name       = "Web Platform Team"
    project_lead    = "john-doe"
    team_permission = "push"
    repositories = [
      {
        name        = "internal-tool"
        description = "Internal tool"
        visibility  = "private"
        license     = "none"
      }
    ]
    members = [...]
  }
}
```

---

<details open>
<summary><h3>🎯 Which License Should I Choose?</h3></summary>

#### Choose **MIT** if:
- ✅ You want maximum freedom for users
- ✅ You don't care if derivative works are open source
- ✅ You want a simple, well-understood license
- ✅ You're building a library or tool
- 📦 **Examples:** jQuery, Rails, Node.js

#### Choose **Apache 2.0** if:
- ✅ You want patent protection
- ✅ You need explicit trademark protection
- ✅ You're working in an enterprise environment
- ✅ You want contributors to grant patent rights
- 📦 **Examples:** Android, Apache HTTP Server, Kubernetes

#### Choose **GPL 3.0** if:
- ✅ You want derivative works to remain open source
- ✅ You're committed to free software principles
- ✅ You want to prevent proprietary forks
- ✅ Network use doesn't matter much
- 📦 **Examples:** Linux, Git, WordPress plugins

#### Choose **AGPL 3.0** if:
- ✅ You're building a web service or SaaS
- ✅ You want network use to trigger sharing requirements
- ✅ You want to prevent proprietary hosted versions
- ✅ You're strongly committed to copyleft
- 📦 **Examples:** MongoDB, Mastodon, NextCloud

#### Choose **LGPL 3.0** if:
- ✅ You're building a library
- ✅ You want modifications to the library to be open source
- ✅ You allow proprietary software to link to your library
- ✅ You want a middle ground between MIT and GPL
- 📦 **Examples:** GTK, Qt (dual-licensed)

#### Choose **MPL 2.0** if:
- ✅ You want file-level copyleft
- ✅ You want compatibility with GPL
- ✅ You're okay with mixed licensing
- ✅ You want a middle ground between permissive and copyleft
- 📦 **Examples:** Firefox, Thunderbird

#### Choose **BSD 2-Clause/3-Clause** if:
- ✅ You want a simple permissive license
- ✅ You're in academia
- ✅ You want something similar to MIT but older
- ✅ You want to prohibit use of your name for endorsement (3-Clause)
- 📦 **Examples:** FreeBSD, OpenBSD

#### Choose **ISC** if:
- ✅ You want the simplest possible permissive license
- ✅ You like MIT but want even simpler language
- ✅ Functionally identical to MIT
- 📦 **Examples:** OpenBSD tools, Node.js packages

#### Choose **Unlicense** if:
- ✅ You want to dedicate your work to the public domain
- ✅ You want no restrictions whatsoever
- ✅ You don't want to be attributed
- ✅ You're okay with anyone doing anything with your code
- 📦 **Examples:** Public domain projects

#### Choose **"none"** if:
- ✅ Your code is proprietary/private
- ✅ You're not ready to decide on a license yet
- ✅ You'll add a custom license later
- ⚠️ **Warning:** Without a license, others have no permission to use your code!

### License Categories

#### **Permissive Licenses** (More Freedom)
Allow users to do almost anything, including creating proprietary derivatives.
- MIT, Apache 2.0, BSD 2-Clause/3-Clause, ISC, Unlicense

#### **Weak Copyleft Licenses** (Middle Ground)
Require sharing modifications to the licensed code, but allow linking with proprietary code.
- LGPL 3.0, MPL 2.0

#### **Strong Copyleft Licenses** (Maximum Sharing)
Require derivative works to use the same license.
- GPL 3.0, AGPL 3.0

### Can I Change My License Later?

**Yes, but it's complicated:**
- ✅ You can always add a license to unlicensed code
- ✅ You can make your code more permissive (GPL → MIT)
- ⚠️ Making code more restrictive is difficult (MIT → GPL)
- ⚠️ You need permission from all contributors
- ⚠️ Existing copies remain under the old license

**Best practice:** Choose carefully from the start!

</details>

</details>