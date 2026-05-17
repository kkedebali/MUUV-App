# MUUV-App 📝

Flutter ile geliştirilmiş, hazır API ile çalışan film/dizi izleme uygulaması.

## 🏗️ Proje Mimarisi (Clean Architecture)

Bu projede kodun sürdürülebilirliği ve test edilebilirliği için Clean Architecture prensipleri uygulanmıştır:

- **Data:** Repository implementations, Data Sources (Hive), ve Models (JSON/Hive-Entity mapping).
- **Domain:** Entities (Saf iş nesneleri), Use Cases (İş mantığı) ve Repository Interfaces.
- **Presentation:** UI (Screens/Widgets) ve State Management (Riverpod providers).

### 🚀 Kullanılan Teknolojiler
* **Framework:** Flutter
* **Database:** [Hive](https://pub.dev/packages/hive) (Hızlı ve hafif yerel veritabanı)
* **State Management:** [Riverpod](https://riverpod.dev/) (Modern ve güvenli durum yönetimi)

### ✨ Özellikler
* Favoriler
* Popüler, Yeni çıkan ve Aksiyon türleri (API isteği şimdilik 1 sayfa, 20 film ile sınırlı)
* MUUVFlow (geliştirme aşamasında) 

### ✨ Ekran görüntüleri
<img width="300" alt="Simulator Screenshot - iPhone 16e - 2026-05-04 at 19 31 17" src="https://github.com/user-attachments/assets/b5938c73-bad8-4c3f-8749-d5efc9e69808" />
<img width="300" alt="Simulator Screenshot - iPhone 16e - 2026-05-03 at 00 39 39" src="https://github.com/user-attachments/assets/d2923733-fc5e-498c-b224-722c1f304430" />
