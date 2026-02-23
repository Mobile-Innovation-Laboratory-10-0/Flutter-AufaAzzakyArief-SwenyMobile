<div align="center">

<img src="assets/images/sweny_logo.png" alt="SWENY Logo" width="120"/>

# SWENY
### AI Mental Health Companion for Developers

*Deteksi burnout lebih awal, jaga kesehatan mental, tetap dalam kondisi flow.*

[![Flutter](https://img.shields.io/badge/Flutter-3.38.5-02569B?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.4-0175C2?style=flat-square&logo=dart)](https://dart.dev)
[![GetX](https://img.shields.io/badge/GetX-4.7.3-8A2BE2?style=flat-square)](https://pub.dev/packages/get)
[![Version](https://img.shields.io/badge/Version-1.0.0-success?style=flat-square)](pubspec.yaml)

</div>

---

## 📖 Deskripsi Aplikasi

**SWENY** (Software Engineer Wellbeing & Nurturing You) adalah aplikasi *AI Mental Health Companion* yang dirancang khusus untuk para **software developer Indonesia**. SWENY hadir untuk mendeteksi tanda-tanda burnout lebih awal, membantu developer memahami pola kerja mereka, dan memberikan pendampingan emosional berbasis kecerdasan buatan.

Permasalahan burnout di kalangan software developer sering kali terabaikan karena kurangnya alat bantu yang relevan dan mudah diakses. SWENY menjawab kebutuhan tersebut dengan pendekatan yang personal, conversational, dan berbasis data aktivitas coding.

> *"SWENY ada untuk memastikan kamu tidak hanya produktif, tapi juga sehat secara mental."*

---

## ✨ Fitur Utama

### 🔐 Autentikasi
| Fitur | Deskripsi |
|---|---|
| **Login** | Masuk dengan email & password, atau via Google Sign-In |
| **Register** | Buat akun baru dengan validasi input lengkap |
| **Lupa Password** | Kirim link reset password ke email terdaftar |

### 🏠 Dashboard
- **Burnout Score Ring** — visualisasi skor burnout harian dengan indikator warna (hijau/biru/kuning/merah)
- **Quick Stats** — ringkasan jam coding hari ini, streak, dan level energi secara real-time
- **Aksi Cepat** — navigasi langsung ke Chat, Insights, dan Subscription

### 🤖 Chat AI (SWENY)
- Percakapan interaktif dengan AI yang memahami konteks developer
- Indikator *typing* animasi saat AI sedang memproses respons
- Bubble chat dengan timestamp dan desain percakapan modern

### 📊 Insights
- **Bar Chart Burnout** — visualisasi skor burnout harian sepanjang minggu dengan kode warna dinamis
- **Period Filter** — tampilkan data Minggu Ini, Bulan Ini, atau 3 Bulan terakhir
- **Statistik Ringkas** — rata-rata jam coding dan hari dengan burnout tertinggi (*peak burnout*)

### 👤 Profil
- Tampilan profil pengguna dengan avatar inisial
- Manajemen akun: Edit Profil, Pengaturan Notifikasi
- Badge langganan aktif
- Tentang SWENY & Logout

### 💎 Subscription
- **Free** — akses fitur dasar tanpa biaya
- **Individual** — analisis mendalam + export PDF (Rp 49.000/bulan) dengan 7-hari trial gratis
- **Enterprise** — solusi tim dengan onboarding khusus

---

## 📱 Screenshot Aplikasi

> **Petunjuk:** Tambahkan screenshot ke folder `docs/screenshots/` lalu ganti path di bawah ini.

<div align="center">

| Splash | Onboarding | Login |
|:---:|:---:|:---:|
| <img src="docs/screenshots/splash.png" width="200" alt="Splash Screen"/> | <img src="docs/screenshots/onboarding.png" width="200" alt="Onboarding"/> | <img src="docs/screenshots/login.png" width="200" alt="Login"/> |

| Register | Lupa Password | Dashboard |
|:---:|:---:|:---:|
| <img src="docs/screenshots/register.png" width="200" alt="Register"/> | <img src="docs/screenshots/forgot_password.png" width="200" alt="Lupa Password"/> | <img src="docs/screenshots/dashboard.png" width="200" alt="Dashboard"/> |

| Chat AI | Insights | Profil |
|:---:|:---:|:---:|
| <img src="docs/screenshots/chat.png" width="200" alt="Chat AI"/> | <img src="docs/screenshots/insights.png" width="200" alt="Insights"/> | <img src="docs/screenshots/profile.png" width="200" alt="Profil"/> |

| Subscription | | |
|:---:|:---:|:---:|
| <img src="docs/screenshots/subscription.png" width="200" alt="Subscription"/> | | |

</div>

---

## 🛠️ Tech Stack

| Teknologi | Versi | Kegunaan |
|---|---|---|
| [Flutter](https://flutter.dev) | 3.38.5 | Cross-platform UI framework |
| [Dart](https://dart.dev) | ^3.10.4 | Bahasa pemrograman |
| [GetX](https://pub.dev/packages/get) | ^4.7.3 | State management, routing, DI |
| [Google Fonts](https://pub.dev/packages/google_fonts) | ^6.2.1 | Tipografi (Syne + DM Sans) |

---

## 🏗️ Struktur Proyek

```
sweny/
├── lib/
│   ├── main.dart                        # Entry point aplikasi
│   └── app/
│       ├── common/
│       │   ├── theme/
│       │   │   └── app_colors.dart      # Design token warna
│       │   └── widgets/
│       │       ├── sweny_button.dart    # Reusable button (4 varian, 3 ukuran)
│       │       └── sweny_text_field.dart # Reusable text field dengan animasi
│       ├── modules/
│       │   ├── splash/                  # Splash screen
│       │   ├── onboarding/              # 3-slide onboarding
│       │   ├── login/                   # Halaman login
│       │   ├── register/                # Halaman registrasi
│       │   ├── forgot_password/         # Reset password
│       │   ├── home/                    # Shell utama (IndexedStack 4 tab)
│       │   ├── chat/                    # Tab chat AI
│       │   ├── insights/                # Tab insights & statistik
│       │   ├── profile/                 # Tab profil pengguna
│       │   └── subscription/            # Halaman langganan
│       └── routes/
│           ├── app_pages.dart           # Definisi semua route + binding
│           └── app_routes.dart          # Konstanta nama route
├── assets/
│   └── images/
│       └── sweny_logo.png
└── pubspec.yaml
```

Setiap modul mengikuti pola **Clean Architecture GetX**:
```
modul/
  ├── bindings/   # Dependency injection
  ├── controllers/ # Business logic & state (GetxController)
  └── views/       # UI (GetView)
```

---

## 🚀 Cara Menjalankan Aplikasi

### Prasyarat

Pastikan kamu sudah menginstall:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) versi **3.x** atau lebih baru
- [Dart SDK](https://dart.dev/get-dart) `^3.10.4`
- Android Studio / VS Code dengan ekstensi Flutter
- Perangkat fisik atau emulator (Android/iOS)

Verifikasi instalasi Flutter:
```bash
flutter doctor
```

---

### Langkah Instalasi

**1. Clone repository**
```bash
git clone https://github.com/username/sweny.git
cd sweny
```

**2. Install dependensi**
```bash
flutter pub get
```

**3. Pastikan perangkat/emulator tersedia**
```bash
flutter devices
```

**4. Jalankan aplikasi**
```bash
# Mode debug (development)
flutter run

# Pilih perangkat spesifik
flutter run -d <device_id>

# Mode release (production)
flutter run --release
```

---

### Build Aplikasi

```bash
# Build APK Android (debug)
flutter build apk --debug

# Build APK Android (release)
flutter build apk --release

# Build App Bundle (Google Play)
flutter build appbundle

# Build untuk iOS (butuh macOS + Xcode)
flutter build ios

# Build untuk Web
flutter build web
```

> **Catatan iOS:** Buka `ios/Runner.xcworkspace` di Xcode, pilih Team pada Signing & Capabilities sebelum build ke perangkat fisik.

---

### Konfigurasi Tambahan

**Android NDK** (jika muncul error NDK):
```bash
rm -rf ~/Library/Android/sdk/ndk/<versi-bermasalah>
flutter clean && flutter pub get
```

**Reset build cache:**
```bash
flutter clean
flutter pub get
flutter run
```

---

## 🎨 Design System

SWENY menggunakan design system dark-theme yang konsisten:

| Token | Warna | Keterangan |
|---|---|---|
| `bgBase` | `#020B18` | Background utama |
| `bgCard` | `#0D1F33` | Background kartu |
| `bgElevated` | `#1A2E45` | Background elemen elevated |
| `primary` | `#2D7DD2` | Warna aksen utama |
| `success` | `#3DDC84` | Indikator positif/aman |
| `warning` | `#FFB547` | Indikator peringatan |
| `error` | `#FF4757` | Indikator bahaya/error |

**Tipografi:**
- **Syne** (Bold 700–800) → judul & heading
- **DM Sans** (Regular 400, SemiBold 600) → body text & UI

---

## 👥 Tim Pengembang

Dikembangkan sebagai bagian dari program **Telkom University / Bandung Techno Park**.

---

## 📄 Lisensi

Proyek ini dibuat untuk keperluan akademik. Seluruh hak cipta dipegang oleh tim pengembang.

---

<div align="center">

Made with ❤️ for Developer Mental Health

**SWENY** · *Stay in Flow, Stay Healthy*

</div>
