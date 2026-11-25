# AGENT.md — CALOREAT Mobile

Guidance for AI coding agents working in `caloreat_mobile` (`pbp-kelompok-d4/CALOREAT-mobile`).

## Project Overview

**CALOREAT Mobile** is a Flutter nutrition-tracking and daily calorie-calculator app supporting Sustainable Living and *Isi Piringku* portion guidance. It communicates with the CALOREAT Django REST Framework (DRF) backend deployed on PWS so mobile and web share one database.

- **Backend Base URL**: `https://muhammad-fachri54-caloreat.pws.cs.ui.ac.id`
- **Design Reference (Figma)**: https://www.figma.com/design/URF88q06htUJHL5Ft8GSpO/Caloreat-Mobile?node-id=0-1&t=6lXdprLIPiPiZoZx-1

---

## Tech Stack & Critical Conventions

- **SDK**: Dart `^3.12.2` / Flutter (Material 3 enabled via `useMaterial3: true`).
- **UI Package (Important)**: This project uses decoupled `material_ui: ^1.2.0`. Always import:
  ```dart
  import 'package:material_ui/material_ui.dart';
  ```
  Do **not** mix in `package:flutter/material.dart` unless explicitly needed and verified with `flutter analyze`.
- **Typography**: `google_fonts: ^8.2.1` using `GoogleFonts.outfit()`.
- **Linting**: `flutter_lints: ^6.0.0` configured in `analysis_options.yaml` (`build/**` and platform folders are excluded from analysis).
- **Assets**: Registered in `pubspec.yaml` (currently `assets/image/logo_caloreat.png`). Register any new asset paths there before referencing them.

---

## Directory Structure

```text
lib/
├── main.dart                  # App entry point, ThemeData, home: MyHomePage()
├── screens/
│   ├── home.dart              # MyHomePage (tab 0)
│   ├── catalog.dart           # CatalogPage (tab 1)
│   ├── calorie.dart           # CaloriePage (tab 2)
│   ├── portion.dart           # PortionPage (tab 3)
│   ├── reviews.dart           # ReviewsPage (tab 4)
│   └── auth.dart              # AuthPage (pushed from AppBars profile button)
└── widgets/
    ├── app_bar.dart           # AppBars (shared PreferredSizeWidget top bar)
    └── bottom_navbar.dart     # BottomNavBar (shared 5-tab bottom navigation bar)
```

When expanding the project, organize new code consistently:
- Data models: `lib/models/`
- API/auth clients & helpers: `lib/services/`
- Feature screens: `lib/screens/`
- Reusable UI components: `lib/widgets/`

---

## Team Modules & Branch Workflow

This is a 5-member team repository (`main` + feature branches such as `auth`, `bar`, `catalog`, `count`). Keep edits scoped to the requested module and avoid modifying unrelated screens:

| Module | Scope | Primary Files |
|---|---|---|
| **Auth, Profile & Admin** | Login, register, user profile, admin portal | `lib/screens/auth.dart` |
| **Home, Reviews & Chrome** | Daily summary, streak, quick search, reviews, `AppBars`, `BottomNavBar` | `lib/screens/home.dart`, `lib/screens/reviews.dart`, `lib/widgets/app_bar.dart`, `lib/widgets/bottom_navbar.dart` |
| **Calorie Calculator & Tracker** | BMR/TDEE calculation, daily intake logs | `lib/screens/calorie.dart` |
| **Food Nutrition Catalog** | Food list, search, pagination, macro/micronutrient details | `lib/screens/catalog.dart` |
| **Portion Guide** | *Isi Piringku* portion guidance & serving references | `lib/screens/portion.dart` |

---

## Theme & Design Tokens

Defined in `lib/main.dart` and `lib/widgets/app_bar.dart`:

- **Scaffold Background**: `Color(0xFFFFFAE9)` 
- **Seed / Accent Gold**: `Color(0xFFEFB60A)`
- **Primary Ink / Title Text**: `Color(0xFF2A2108)`
- **Font Family**: `GoogleFonts.outfit().fontFamily`
- **Material 3**: `useMaterial3: true`

Use `Theme.of(context)` colors and text styles where possible rather than inventing mismatched palette colors.
If you want to another color that is not available yet, create it on `lib/main.dart` first

---

## Navigation & Shared Chrome

### Top Bar (`lib/widgets/app_bar.dart`)
- `AppBars({super.key, this.showProfileButton = true})` implements `PreferredSizeWidget` with height `80`.
- Displays `assets/image/logo_caloreat.png` + `caloreats` title and an optional profile avatar button that pushes `AuthPage`.
- Pass `AppBars(showProfileButton: false)` on auth/secondary screens where the profile button should be hidden.

### Bottom Navigation (`lib/widgets/bottom_navbar.dart`)
- `BottomNavBar` uses `BottomNavigationBar(type: BottomNavigationBarType.fixed)` 
- Tab switching uses `Navigator.pushReplacement` with a zero-duration `PageRouteBuilder` and ignores taps on the active tab (`if (index == currentIndex) return;`).
- `BottomNavBar` also supports an optional `onTap` callback if the app later migrates to a stateful `IndexedStack` shell.
- Top-level tab screens include both `appBar: AppBars()` and `bottomNavigationBar: const BottomNavBar(currentIndex: <index>)`.
- Secondary/modal/detail/auth screens (like `AuthPage`) are navigated to via `Navigator.push(context, MaterialPageRoute(...))` and omit `BottomNavBar`.

---

## Backend API & User Roles

Base URL: `https://muhammad-fachri54-caloreat.pws.cs.ui.ac.id` (JSON over HTTP via DRF).

### Documented Endpoints (from `README.md`)

| Endpoint | Method | Purpose |
|---|---|---|
| `/api/auth/register/` | `POST` | Register a new account |
| `/api/auth/login/` | `POST` | Verify email & password; returns auth token |
| `/api/auth/logout/` | `POST` | Invalidate server token (end session) |
| `/api/auth/me/` | `GET` | Fetch currently authenticated user |
| `/api/catalog/` | `GET` | Food catalog with search (`?q=`), pagination (`?page=`), macro & micronutrient details |
| `/api/v1/reviews/` | `GET` | List reviews; supports `?star=1..5` and `?mine=true` |
| `/api/v1/reviews/` | `POST` | Create a review (authenticated) |
| `/api/v1/reviews/<uuid:review_id>/` | `GET` | Fetch single review detail |
| `/api/v1/reviews/<uuid:review_id>/` | `PUT` / `PATCH` | Edit a review |
| `/api/v1/reviews/<uuid:review_id>/` | `DELETE` | Delete a review |

*(Additional endpoints for Calorie Tracker and Portion Guide will be added to `README.md` as those modules are implemented.)*

### User Roles & Access Rules
- **Guest User**: Can browse Home, search/view Food Catalog, view Portion Guide, read/filter Reviews (read-only), and register/login.
- **Authenticated User**: Full Guest access plus Profile editing, personalized Home summary/streak, Calorie Tracker logging, and CRUD on their own Reviews.
- **Superuser**: Manage Food Catalog & Portion Guide content, and moderate Reviews (delete other users' reviews).

Always handle guest/unauthenticated states gracefully in the UI (hide or gate write actions, prompt login instead of throwing errors).

---

## Verification Commands

Run from the repository root (`caloreat_mobile/`):

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

For quick headless/browser verification:
```bash
flutter build web --no-wasm-dry-run
```

---

## Agent Coding Rules

1. **Run `flutter analyze`** after editing Dart files and ensure zero errors and no new warnings/lints.
2. **Use `const` constructors** for immutable widgets and `const` widgets where possible.
3. **Never commit secrets or hardcoded credentials/tokens**; store session tokens securely at runtime.
4. **Handle async UI states**: show loading indicators, empty states, and user-friendly error messages for all network calls; guard `BuildContext` usage after `await` with `if (!context.mounted) return;`.
5. **Accessibility basics**: ensure interactive targets are at least `48x48` dp, provide semantic labels/tooltips for icon-only buttons, avoid fixed heights on text containers that break text scaling, and maintain readable contrast against `#FFFAE9`.
6. **Respect scope**: avoid refactoring unrelated files, renaming existing routes/classes used by teammates, or modifying `README.md` unless requested.
7. **Never add, commit, and push directly to git**. Let user manually do any git related stuff.
8. **Always implement clean and organize code structure**. If the code in a file is too long, refactor it into a smaller pieces. 
