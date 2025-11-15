# 🤝 Katkıda Bulunma Rehberi | Contributing Guide
 

## 📋 İçindekiler | Table of Contents

- [Neden Katkıda Bulunmalısınız?](#-neden-katkıda-bulunmalısınız)
- [Katkı Türleri](#-katkı-türleri)
- [Başlamadan Önce](#-başlamadan-önce)
- [Katkı Süreci](#-katkı-süreci)
- [Kod Standartları](#-kod-standartları)
- [İletişim](#-iletişim)

---
<details open>

 <summary><strong>🇹🇷 Türkçe Rehber</strong></summary>

<p><br>
<strong>Hoş geldiniz!</strong> Bu rehber, BKT-DevOps topluluğuna katkıda bulunmak isteyen herkes için hazırlanmıştır. Sizi aramızda görmekten mutluluk duyuyoruz!

## 💫 Neden Katkıda Bulunmalısınız?

BKT-DevOps topluluğuna katkıda bulunmak:
- 🚀 **Profesyonel gelişim** - Gerçek dünya projeleri üzerinde çalışarak deneyim kazanırsınız
- 🤝 **Networking** - Alanında uzman kişilerle tanışır, profesyonel ağınızı genişletirsiniz
- 📚 **Portfolyo** - CV'nize ekleyebileceğiniz somut ve ölçülebilir katkılar
- 💪 **Topluluk etkisi** - Binlerce kişinin faydalanacağı çözümler geliştirirsiniz
- 🎓 **Mentorluk** - Deneyimli geliştiricilerden geri bildirim ve rehberlik alırsınız

## 🎨 Katkı Türleri

### 🐛 Hata Bildirimi (Bug Report)
Projede bir hata mı keşfettiniz? Bildirerek topluluğa önemli bir katkı sağlarsınız.

**Nasıl bildirilir:**
1. [Issues](../../issues) sayfasına gidin
2. "Bug Report" şablonunu seçin
3. Hatayı detaylı açıklayın:
   - Hangi adımlar sonucu oluştu
   - Beklenen davranış neydi
   - Gerçekleşen davranış ne oldu
   - Sistem bilgileriniz (OS, sürüm vb.)

### ✨ Özellik Önerisi (Feature Request)
Yeni bir özellik mi hayal ediyorsunuz? Fikirlerinizi paylaşın!

**Nasıl önerilir:**
1. [Discussions](../../discussions) alanını kontrol edin (benzer öneriler var mı?)
2. "Feature Request" şablonuyla yeni bir issue açın
3. Önerinizi detaylandırın:
   - Hangi problemi çözüyor
   - Nasıl çalışmalı
   - Kimler faydalanacak

### 📖 Dokümantasyon
Dokümantasyon iyileştirmeleri en değerli katkılardandır!

**Neler yapabilirsiniz:**
- README dosyalarını iyileştirin
- Kullanım örnekleri ekleyin
- Teknik dokümantasyon yazın
- Typo ve gramer hatalarını düzeltin
- Türkçe çeviri desteği sağlayın

### 💻 Kod Katkısı
Kodla katkıda bulunmak istiyorsanız:

**İdeal başlangıç:**
- `good-first-issue` etiketi olan konular
- `help-wanted` işaretli görevler
- Dokümantasyonda belirtilen TODO'lar

### 👥 Topluluk Desteği
Kod yazmadan da katkıda bulunabilirsiniz:
- Başkalarının sorularını yanıtlayın
- Code review yapın
- Discussions'da fikir paylaşın
- Yeni üyelere yardımcı olun

---

## 🚀 Başlamadan Önce

### ✅ Ön Koşullar
- GitHub hesabınız olmalı
- Git temel bilgisine sahip olmalısınız
- [Davranış Kurallarımızı](CODE_OF_CONDUCT.md) okumuş olmalısınız
- Projeye özgü gereksinimleri kontrol edin

### 📚 Önerilen Okumalar
1. [README.md](README.md) - Proje hakkında genel bilgi
2. [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) - Topluluk kuralları
3. [LICENSE](LICENSE) - Lisans bilgisi
4. Proje dokümantasyonu (docs/ klasörü)

---

## 🔄 Katkı Süreci

### 1️⃣ Issue Oluşturun veya Seçin

**Mevcut issue'lara göz atın:**
```
1. Issues sekmesine gidin
2. Etiketlere göre filtreleyin
3. İlgilendiğiniz konuyu bulun
4. Yorum yaparak çalışmak istediğinizi belirtin
```

**Yeni issue açın:**
- Önce benzer bir issue olmadığından emin olun
- Uygun şablonu kullanın
- Detaylı ve net bir açıklama yazın

### 2️⃣ Repository'yi Fork Edin

```bash
# GitHub'da "Fork" butonuna tıklayın
# Ardından forkladığınız repo'yu klonlayın
git clone https://github.com/KULLANICI-ADINIZ/REPO-ADI.git
cd REPO-ADI

# Upstream remote ekleyin
git remote add upstream https://github.com/BKT-DevOps/REPO-ADI.git
```

### 3️⃣ Yeni Branch Oluşturun

**Branch isimlendirme kuralları:**
```bash
# Yeni özellik
git checkout -b feature/kisaca-aciklama

# Hata düzeltme
git checkout -b bugfix/kisaca-aciklama

# Dokümantasyon
git checkout -b docs/kisaca-aciklama

# Performans iyileştirme
git checkout -b perf/kisaca-aciklama
```

**Örnekler:**
```bash
git checkout -b feature/add-user-authentication
git checkout -b bugfix/fix-login-validation
git checkout -b docs/update-api-documentation
```

### 4️⃣ Değişikliklerinizi Yapın

**En İyi Pratikler:**
- ✅ Küçük ve odaklı değişiklikler yapın
- ✅ Her mantıksal değişiklik için ayrı commit atın
- ✅ Kod standartlarına uyun
- ✅ Test ekleyin (varsa test framework'ü)
- ✅ Dokümantasyonu güncelleyin

**Değişiklik döngüsü:**
```bash
# 1. Değişiklikleri yapın
# ... kod editörünüzde çalışın ...

# 2. Değişiklikleri kontrol edin
git status
git diff

# 3. Test edin (projeye göre değişir)
# npm test
# pytest
# vb.

# 4. Commit yapın (detaylar aşağıda)
```

### 5️⃣ Commit Mesajları

**Format:**
```
<tip>(<kapsam>): <özet>

<detaylı açıklama (opsiyonel)>

<footer (opsiyonel)>
```

**Tip başlıkları:**
- `feat:` - Yeni özellik
- `fix:` - Hata düzeltme
- `docs:` - Dokümantasyon değişikliği
- `style:` - Kod formatı (logic değişmeyen)
- `refactor:` - Kod iyileştirme
- `test:` - Test ekleme/düzeltme
- `chore:` - Build, konfigürasyon vb.
- `perf:` - Performans iyileştirme

**✅ İyi commit örnekleri:**
```bash
feat(auth): add JWT token validation

fix(api): resolve null pointer exception in user service
Fixes #123

docs(readme): update installation instructions

refactor(utils): simplify date formatting function

test(auth): add unit tests for login endpoint
```

**❌ Kaçınılması gereken:**
```bash
update code
fixed bug
changes
WIP
asdfgh
```

### 6️⃣ Değişiklikleri Push Edin

```bash
# Değişiklikleri staging area'ya ekleyin
git add .

# Commit yapın
git commit -m "feat: açıklayıcı mesaj"

# Kendi fork'unuza push edin
git push origin feature/branch-adi
```

### 7️⃣ Pull Request (PR) Oluşturun

**PR açma adımları:**
1. GitHub'da fork'unuza gidin
2. "Compare & pull request" butonuna tıklayın
3. Base repository: `BKT-DevOps/repo-adi` `main`
4. Head repository: `kullanici-adi/repo-adi` `feature-branch`

**PR başlığı:**
```
[TİP] Kısa ve açıklayıcı başlık

Örnekler:
[FEATURE] Add user authentication system
[BUGFIX] Fix memory leak in data processor
[DOCS] Update API documentation
```

**PR açıklaması şablonu:**

```markdown
## 📝 Açıklama
<!-- Bu PR'ın amacını kısaca açıklayın -->

## 🎯 İlgili Issue
<!-- Issue numarasını belirtin -->
Closes #123
Relates to #456

## 🔄 Değişiklik Türü
<!-- İlgili kutucukları işaretleyin -->
- [ ] Bug fix (kod değişikliği - mevcut hatayı düzeltir)
- [ ] New feature (kod değişikliği - yeni özellik ekler)
- [ ] Breaking change (mevcut özellikleri etkiler)
- [ ] Documentation update

## 📋 Değişiklikler
<!-- Yaptığınız değişiklikleri listeleyin -->
- Değişiklik 1
- Değişiklik 2
- Değişiklik 3

## ✅ Kontrol Listesi
<!-- Tamamladığınız adımları işaretleyin -->
- [ ] Kod kendi kendini açıklıyor ve yorum eklendi
- [ ] Dokümantasyon güncellendi
- [ ] Testler eklendi/güncellendi
- [ ] Tüm testler başarılı
- [ ] Commit mesajları standartlara uygun
- [ ] Branch güncel (main ile merge edilmiş)

## 🧪 Test Edildi
<!-- Nasıl test ettiniz? -->
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual tests

## 📸 Ekran Görüntüleri (varsa)
<!-- UI değişikliği varsa ekran görüntüsü ekleyin -->

## 💬 Ek Notlar
<!-- Gözden geçirenler için özel notlar -->
```

### 8️⃣ Code Review Süreci

**Ne bekleyebilirsiniz:**
1. ✅ **Otomatik kontroller** - CI/CD pipeline çalışır
2. 👀 **İnceleme** - Maintainer'lar kodu gözden geçirir
3. 💬 **Geri bildirim** - Sorular ve öneriler gelir
4. 🔄 **İterasyon** - Gerekli değişiklikleri yaparsınız
5. ✨ **Onay** - PR onaylanır
6. 🎉 **Merge** - Kodunuz ana branch'e eklenir

**Geri bildirimlere yanıt verme:**
- 🙏 Nazik ve profesyonel olun
- 💭 Önerileri dikkate alın
- 🤔 Anlamadığınız noktaları sorun
- 🔄 İstenen değişiklikleri hızlıca yapın

**Değişiklik yapma:**
```bash
# Geri bildirimlere göre değişiklik yapın
git add .
git commit -m "refactor: apply code review suggestions"

# Aynı branch'e push edin (PR otomatik güncellenir)
git push origin feature/branch-adi
```

---

## 📏 Kod Standartları

### Genel Kurallar
- ✅ **Okunabilirlik:** Kod kendini açıklamalı
- ✅ **DRY:** Don't Repeat Yourself
- ✅ **KISS:** Keep It Simple, Stupid
- ✅ **YAGNI:** You Aren't Gonna Need It
- ✅ **Tutarlılık:** Projenin mevcut stilini takip edin

### Dosya Organizasyonu
```
project-root/
├── docs/              # Dokümantasyon
├── src/               # Kaynak kod
├── tests/             # Test dosyaları
├── .github/           # GitHub workflows, templates
├── README.md          # Proje açıklaması
├── CONTRIBUTING.md    # Bu dosya
├── CODE_OF_CONDUCT.md # Davranış kuralları
├── LICENSE            # Lisans
└── .gitignore         # Git ignore kuralları
```

### Yorum ve Dokümantasyon
```javascript
// ✅ İYİ: Açıklayıcı yorum
// Calculate the total price including taxes and discounts
// @param basePrice - Original price before calculations
// @param taxRate - Tax rate as decimal (e.g., 0.18 for 18%)
function calculateTotal(basePrice, taxRate) {
  return basePrice * (1 + taxRate);
}

// ❌ KÖTÜ: Gereksiz yorum
// This function adds two numbers
function add(a, b) {
  return a + b; // return the sum
}
```

### Hata Yönetimi
```javascript
// ✅ İYİ: Açıklayıcı hata mesajları
if (!user) {
  throw new Error('User not found: Invalid user ID provided');
}

// ❌ KÖTÜ: Belirsiz hatalar
if (!user) {
  throw new Error('Error');
}
```

---

## 📞 İletişim

### 💬 Nerede Konuşuruz?

**GitHub Discussions** (Tercih edilen)
- Genel sorular ve tartışmalar
- Özellik önerileri
- Yardım istekleri

**GitHub Issues**
- Hata bildirimleri
- Görev takibi
- Özellik istekleri (detaylı)

**Pull Requests**
- Kod incelemeleri
- Teknik tartışmalar

### 📧 Doğrudan İletişim
- Güvenlik açıkları: [Sorumluluk bildirimi prosedürünü takip edin]
- Özel konular: Maintainer'lara mention yapın

### ⏱️ Yanıt Süreleri
- Issues: 2-5 iş günü
- Pull Requests: 3-7 iş günü
- Security issues: 24-48 saat

---

## ❓ Sık Sorulan Sorular

### Genel

**S: İlk katkımı nereden yapmalıyım?**
> `good-first-issue` etiketli konulardan başlayın. Dokümantasyon iyileştirmeleri de harika bir başlangıçtır.

**S: Programlama bilmiyorum, katkıda bulunabilir miyim?**
> Elbette! Dokümantasyon, çeviri, hata tespiti ve topluluk desteği çok değerlidir.

**S: PR'm ne kadar sürede incelenir?**
> Genellikle 3-7 iş günü içinde. Sabırlı olun, maintainer'lar gönüllü çalışır.

**S: PR'm reddedilirse ne olur?**
> Endişelenmeyin! Maintainer'lar neden reddedildiğini açıklar. Geri bildirimleri değerlendirip tekrar deneyebilirsiniz.

### Teknik

**S: Git conflict nasıl çözülür?**
```bash
git checkout main
git pull upstream main
git checkout your-branch
git rebase main
# Conflictleri manuel çözün
git add .
git rebase --continue
git push origin your-branch --force-with-lease
```

**S: Yanlış branch'e commit yaptım?**
```bash
# Commit'i geri al (değişiklikleri tut)
git reset --soft HEAD~1

# Doğru branch'e geç
git checkout correct-branch

# Tekrar commit yap
git commit -m "your message"
```

---

## 🎉 Teşekkür

Her katkınız, ne kadar küçük olursa olsun, topluluğumuz için değerlidir:
- ✨ Kod yazanlar
- 📖 Dokümantasyon yapanlar
- 🐛 Hata rapor edenler
- 💡 Fikir önerenler
- 🎨 Tasarım yapanlar
- 👥 Topluluğu destekleyenler

**Siz de bu ailenin bir parçası olduğunuz için teşekkür ederiz!** 💚

---

</details>

---

<details>
<summary><strong>🇬🇧 English Guide</strong></summary>
<p><strong>Welcome!</strong> This guide is designed for anyone who wants to contribute to the BKT-DevOps community. We're happy to have you join us!</p>

## 📋 İçindekiler | Table of Contents

- [Why Contribute?](#-why-contribute)
- [Types of Contributions](#-types-of-contributions)
- [Before You Start](#-before-you-start)
- [Contribution Process](#-contribution-process)
- [Code Standards](#-code-standards)
- [Communication](#-communication)

## 💫 Why Contribute?

Contributing to BKT-DevOps community:
- 🚀 **Professional growth** - Gain experience working on real-world projects
- 🤝 **Networking** - Connect with experts and expand your professional network
- 📚 **Portfolio** - Build tangible and measurable contributions for your CV
- 💪 **Community impact** - Develop solutions that benefit thousands
- 🎓 **Mentorship** - Receive feedback and guidance from experienced developers

## 🎨 Types of Contributions

### 🐛 Bug Reports
Discovered a bug in the project? Reporting it is a valuable contribution!

**How to report:**
1. Go to [Issues](../../issues) page
2. Select "Bug Report" template
3. Describe the bug in detail:
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - System information (OS, version, etc.)

### ✨ Feature Requests
Have an idea for a new feature? Share it with us!

**How to suggest:**
1. Check [Discussions](../../discussions) (are there similar suggestions?)
2. Open a new issue with "Feature Request" template
3. Detail your proposal:
   - What problem does it solve
   - How should it work
   - Who will benefit

### 📖 Documentation
Documentation improvements are among the most valuable contributions!

**What you can do:**
- Improve README files
- Add usage examples
- Write technical documentation
- Fix typos and grammar errors
- Provide Turkish translation support

### 💻 Code Contributions
If you want to contribute with code:

**Ideal start:**
- Topics labeled `good-first-issue`
- Tasks marked `help-wanted`
- TODOs mentioned in documentation

### 👥 Community Support
You can contribute without writing code:
- Answer others' questions
- Perform code reviews
- Share ideas in Discussions
- Help newcomers

---

## 🚀 Before You Start

### ✅ Prerequisites
- You must have a GitHub account
- Basic knowledge of Git
- Read our [Code of Conduct](CODE_OF_CONDUCT.md)
- Check project-specific requirements

### 📚 Recommended Reading
1. [README.md](README.md) - General information about the project
2. [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) - Community rules
3. [LICENSE](LICENSE) - License information
4. Project documentation (docs/ folder)

---

## 🔄 Contribution Process

### 1️⃣ Create or Select an Issue

**Browse existing issues:**
```
1. Go to Issues tab
2. Filter by labels
3. Find a topic you're interested in
4. Comment stating you want to work on it
```

**Open a new issue:**
- Make sure a similar issue doesn't exist
- Use the appropriate template
- Write a detailed and clear description

### 2️⃣ Fork the Repository

```bash
# Click "Fork" button on GitHub
# Then clone your forked repo
git clone https://github.com/YOUR-USERNAME/REPO-NAME.git
cd REPO-NAME

# Add upstream remote
git remote add upstream https://github.com/BKT-DevOps/REPO-NAME.git
```

### 3️⃣ Create a New Branch

**Branch naming conventions:**
```bash
# New feature
git checkout -b feature/brief-description

# Bug fix
git checkout -b bugfix/brief-description

# Documentation
git checkout -b docs/brief-description

# Performance improvement
git checkout -b perf/brief-description
```

**Examples:**
```bash
git checkout -b feature/add-user-authentication
git checkout -b bugfix/fix-login-validation
git checkout -b docs/update-api-documentation
```

### 4️⃣ Make Your Changes

**Best Practices:**
- ✅ Make small and focused changes
- ✅ Make separate commits for each logical change
- ✅ Follow code standards
- ✅ Add tests (if test framework exists)
- ✅ Update documentation

**Change cycle:**
```bash
# 1. Make changes
# ... work in your code editor ...

# 2. Check changes
git status
git diff

# 3. Test (varies by project)
# npm test
# pytest
# etc.

# 4. Commit (details below)
```

### 5️⃣ Commit Messages

**Format:**
```
<type>(<scope>): <subject>

<body (optional)>

<footer (optional)>
```

**Type prefixes:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation change
- `style:` - Code formatting (no logic change)
- `refactor:` - Code improvement
- `test:` - Adding/fixing tests
- `chore:` - Build, configuration, etc.
- `perf:` - Performance improvement

**✅ Good commit examples:**
```bash
feat(auth): add JWT token validation

fix(api): resolve null pointer exception in user service
Fixes #123

docs(readme): update installation instructions

refactor(utils): simplify date formatting function

test(auth): add unit tests for login endpoint
```

**❌ What to avoid:**
```bash
update code
fixed bug
changes
WIP
asdfgh
```

### 6️⃣ Push Changes

```bash
# Add changes to staging area
git add .

# Commit
git commit -m "feat: descriptive message"

# Push to your fork
git push origin feature/branch-name
```

### 7️⃣ Create Pull Request (PR)

**Steps to open PR:**
1. Go to your fork on GitHub
2. Click "Compare & pull request" button
3. Base repository: `BKT-DevOps/repo-name` `main`
4. Head repository: `username/repo-name` `feature-branch`

**PR title:**
```
[TYPE] Short and descriptive title

Examples:
[FEATURE] Add user authentication system
[BUGFIX] Fix memory leak in data processor
[DOCS] Update API documentation
```

**PR description template:**

```markdown
## 📝 Description
<!-- Briefly explain the purpose of this PR -->

## 🎯 Related Issue
<!-- Specify issue number -->
Closes #123
Relates to #456

## 🔄 Change Type
<!-- Check relevant boxes -->
- [ ] Bug fix (code change - fixes existing bug)
- [ ] New feature (code change - adds new functionality)
- [ ] Breaking change (affects existing features)
- [ ] Documentation update

## 📋 Changes
<!-- List your changes -->
- Change 1
- Change 2
- Change 3

## ✅ Checklist
<!-- Check completed steps -->
- [ ] Code is self-explanatory with comments added
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All tests pass
- [ ] Commit messages follow standards
- [ ] Branch is up to date (merged with main)

## 🧪 Tested
<!-- How did you test? -->
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual tests

## 📸 Screenshots (if applicable)
<!-- Add screenshots if UI changes -->

## 💬 Additional Notes
<!-- Special notes for reviewers -->
```

### 8️⃣ Code Review Process

**What to expect:**
1. ✅ **Automated checks** - CI/CD pipeline runs
2. 👀 **Review** - Maintainers review the code
3. 💬 **Feedback** - Questions and suggestions arrive
4. 🔄 **Iteration** - You make necessary changes
5. ✨ **Approval** - PR gets approved
6. 🎉 **Merge** - Your code is added to main branch

**Responding to feedback:**
- 🙏 Be polite and professional
- 💭 Consider suggestions
- 🤔 Ask about points you don't understand
- 🔄 Implement requested changes promptly

**Making changes:**
```bash
# Make changes based on feedback
git add .
git commit -m "refactor: apply code review suggestions"

# Push to same branch (PR updates automatically)
git push origin feature/branch-name
```

---

## 📏 Code Standards

### General Rules
- ✅ **Readability:** Code should be self-explanatory
- ✅ **DRY:** Don't Repeat Yourself
- ✅ **KISS:** Keep It Simple, Stupid
- ✅ **YAGNI:** You Aren't Gonna Need It
- ✅ **Consistency:** Follow the project's existing style

### File Organization
```
project-root/
├── docs/              # Documentation
├── src/               # Source code
├── tests/             # Test files
├── .github/           # GitHub workflows, templates
├── README.md          # Project description
├── CONTRIBUTING.md    # This file
├── CODE_OF_CONDUCT.md # Code of conduct
├── LICENSE            # License
└── .gitignore         # Git ignore rules
```

### Comments and Documentation
```javascript
// ✅ GOOD: Descriptive comment
// Calculate the total price including taxes and discounts
// @param basePrice - Original price before calculations
// @param taxRate - Tax rate as decimal (e.g., 0.18 for 18%)
function calculateTotal(basePrice, taxRate) {
  return basePrice * (1 + taxRate);
}

// ❌ BAD: Unnecessary comment
// This function adds two numbers
function add(a, b) {
  return a + b; // return the sum
}
```

### Error Handling
```javascript
// ✅ GOOD: Descriptive error messages
if (!user) {
  throw new Error('User not found: Invalid user ID provided');
}

// ❌ BAD: Vague errors
if (!user) {
  throw new Error('Error');
}
```

---

## 📞 Communication

### 💬 Where Do We Talk?

**GitHub Discussions** (Preferred)
- General questions and discussions
- Feature proposals
- Help requests

**GitHub Issues**
- Bug reports
- Task tracking
- Feature requests (detailed)

**Pull Requests**
- Code reviews
- Technical discussions

### 📧 Direct Contact
- Security vulnerabilities: [Follow responsible disclosure procedure]
- Private matters: Mention maintainers

### ⏱️ Response Times
- Issues: 2-5 business days
- Pull Requests: 3-7 business days
- Security issues: 24-48 hours

---

## ❓ Frequently Asked Questions

### General

**Q: Where should I make my first contribution?**
> Start with issues labeled `good-first-issue`. Documentation improvements are also a great start.

**Q: I don't know programming, can I contribute?**
> Absolutely! Documentation, translation, bug reporting, and community support are very valuable.

**Q: How long does it take to review my PR?**
> Typically within 3-7 business days. Be patient, maintainers work voluntarily.

**Q: What if my PR is rejected?**
> Don't worry! Maintainers will explain why. You can consider the feedback and try again.

### Technical

**Q: How to resolve Git conflicts?**
```bash
git checkout main
git pull upstream main
git checkout your-branch
git rebase main
# Manually resolve conflicts
git add .
git rebase --continue
git push origin your-branch --force-with-lease
```

**Q: I committed to the wrong branch?**
```bash
# Undo commit (keep changes)
git reset --soft HEAD~1

# Switch to correct branch
git checkout correct-branch

# Commit again
git commit -m "your message"
```

---

## 🎉 Thank You

Every contribution, no matter how small, is valuable to our community:
- ✨ Code writers
- 📖 Documentation creators
- 🐛 Bug reporters
- 💡 Idea proposers
- 🎨 Designers
- 👥 Community supporters

**Thank you for being part of this family!** 💚

---

</details>

---

## 📜 Lisans | License

**🇹🇷** Bu projeye yaptığınız tüm katkılar, repository'deki `LICENSE` dosyasında belirtilen lisans altında yayınlanacaktır. Katkıda bulunarak bu lisansı kabul etmiş olursunuz.

**🇬🇧** All contributions you make to this project will be published under the license specified in the `LICENSE` file in the repository. By contributing, you agree to this license.

---

<div align="center">

**Son güncelleme | Last updated:** Kasım 2025 | November 2025

Made with ❤️ by [BKT-DevOps](https://github.com/BKT-DevOps) Community

[![GitHub](https://img.shields.io/badge/GitHub-BKT--DevOps-181717?style=for-the-badge&logo=github)](https://github.com/BKT-DevOps)

</div>