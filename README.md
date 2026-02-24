<div align="center">

<img src="assets/images/sweny_logo.png" alt="SWENY Logo" width="120"/>

# SWENY
### AI Mental Health Companion for Developers

*Deteksi burnout lebih awal, jaga kesehatan mental, tetap dalam kondisi flow.*

</div>

---

## 📖 Deskripsi Aplikasi

**SWENY** (Software Engineer Wellbeing & Nurturing You) adalah aplikasi *AI Mental Health Companion* yang dirancang khusus untuk para **software developer Indonesia**. SWENY hadir untuk mendeteksi tanda-tanda burnout lebih awal, membantu developer memahami pola kerja mereka, dan memberikan pendampingan emosional berbasis kecerdasan buatan.

Permasalahan burnout di kalangan software developer sering kali terabaikan karena kurangnya alat bantu yang relevan dan mudah diakses. SWENY menjawab kebutuhan tersebut dengan pendekatan yang personal, conversational, dan berbasis data aktivitas coding.


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

## 📱 Screenshot Aplikasi (DEVICE IPHONE 17 PRO)


<div align="center">
  
# Aplikasi Masih menggunakan Data Dummy, Dikarenakan semua data dipass oleh teknologi sweny AI yg terintegrasi di IDE (Diluar konteks aplikasi mobile)

| Splash | 

<img width="469" height="845" alt="Screenshot 2026-02-24 at 18 59 33" src="https://github.com/user-attachments/assets/24c1c9ba-6c97-4ed1-9bdf-95f7fd3ae1f5" />


| Login |

<img width="457" height="847" alt="Screenshot 2026-02-24 at 19 03 12" src="https://github.com/user-attachments/assets/904f1763-7759-45e8-baed-a73c0055688a" />

| Register |

<img width="455" height="845" alt="Screenshot 2026-02-24 at 19 03 59" src="https://github.com/user-attachments/assets/4fc3bd09-2519-4c9b-b3c1-7f39a9ea7117" />

| Home |

<img width="473" height="850" alt="Screenshot 2026-02-24 at 19 04 48" src="https://github.com/user-attachments/assets/48668843-f701-45d7-9cf4-c950cbce2890" />

| ChatBot |

<img width="473" height="846" alt="Screenshot 2026-02-24 at 19 06 36" src="https://github.com/user-attachments/assets/9785ef83-88e5-4d53-bab8-a3a4c57e5e4a" />

| Insight |

<img width="475" height="847" alt="Screenshot 2026-02-24 at 19 06 55" src="https://github.com/user-attachments/assets/44241d78-a607-46e8-9173-a4484726fd11" />

| Profile |

<img width="463" height="845" alt="Screenshot 2026-02-25 at 07 04 09" src="https://github.com/user-attachments/assets/a2c71744-1ecd-4f44-b0dc-f5dbef5c5184" />

| Subscription |

<img width="458" height="844" alt="Screenshot 2026-02-25 at 07 02 55" src="https://github.com/user-attachments/assets/f36247eb-05a4-41b6-bfc4-583b14afd6ce" />


</div>

---

## 🛠️ Tech Stack

| Teknologi | Versi | Kegunaan |
|---|---|---|
| [Flutter](https://flutter.dev) | 3.38.5 | Cross-platform UI framework |
| [Dart](https://dart.dev) | ^3.10.4 | Bahasa pemrograman |
| [GetX](https://pub.dev/packages/get) | ^4.7.3 | State management, routing, DI |
| [Google Fonts](https://pub.dev/packages/google_fonts) | ^6.2.1 | Tipografi (Syne dan DM Sans) |

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

## 👥 Tim Pengembang

Dikembangkan sebagai bagian dari program **Tugas besar Motion Laboratoryk**.

---

## 📄 Lisensi

Proyek ini dibuat untuk keperluan akademik. Seluruh hak cipta dipegang developer

Link Video Penjelasan :

---

<div align="center">

**SWENY** · *Stay in Flow, Stay Healthy*

</div>
