# Ascent - Professional Coach & Client Fitness Platform

![Flutter Version](https://img.shields.io/badge/Flutter-3.38.9-02569B?logo=flutter)
![Dart Version](https://img.shields.io/badge/Dart-3.10.8-0175C2?logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-brightgreen)
![State Management](https://img.shields.io/badge/State_Management-BLoC-blue)
![Database](https://img.shields.io/badge/Backend-Supabase-3ECF8E?logo=supabase)
![Payments](https://img.shields.io/badge/Payments-Stripe-6772E5?logo=stripe)
![License](https://img.shields.io/badge/License-MIT-purple)

Ascent is a robust, production-ready Flutter application designed for fitness coaches and their clients. It features comprehensive program management, real-time messaging, client readiness tracking, and integrated Stripe billing.

## ✨ Features

### For Coaches
*   **Client Roster Management:** Track active clients, monitor their fatigue levels, and send personalized invites.
*   **Program Builder:** Create and duplicate macrocycles, mesocycles, and daily workout sessions with prescribed sets and loads.
*   **Progression Trees:** Build visual progression models for skills (e.g., Calisthenics) and track client advancement.
*   **Real-time Messaging:** Communicate with clients instantly using Supabase Realtime channels.
*   **Automated Billing:** Integrated Stripe subscription management via Supabase Edge Functions.

### For Clients
*   **Daily Readiness Check-ins:** Log sleep, soreness, and stress to calculate readiness scores before workouts.
*   **Workout Logging:** Interactive, offline-tolerant session logging with RPE tracking and auto-advancement.
*   **Progression Tracking:** View assigned skill progression trees, upcoming milestones, and unlock criteria.
*   **Fatigue Dashboard:** Monitor acute-to-chronic workload ratios to prevent overtraining.

---

## 🏗 Architecture & Tech Stack

This project strictly adheres to **Clean Architecture** principles, ensuring modularity, scalability, and high testability. The codebase is separated by feature:

*   `core/`: Shared utilities, error handling (`Failures`), routing (GoRouter), and custom UI themes.
*   `features/<feature_name>/`:
    *   `domain/`: Core business logic, Entities, Use Cases, and Repository interfaces. Completely independent of external frameworks.
    *   `data/`: Repository implementations, Models (Freezed/JSON Serializable), and Data Sources mapping to Supabase RPCs and tables.
    *   `presentation/`: UI components, Pages, and State Management (BLoC/Cubit).

### Key Libraries
*   **State Management:** `flutter_bloc`
*   **Dependency Injection:** `get_it` & `injectable`
*   **Functional Error Handling:** `fpdart` (`Either<Failure, Success>`)
*   **Data Immutability:** `freezed` & `json_serializable`
*   **Backend & Real-time:** `supabase_flutter`

---

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK (>= 3.38.9)
*   Dart SDK (>= 3.10.8)
*   A Supabase Project & Stripe Account (for backend integration)

### Setup & Installation

1.  **Clone the repository**
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run Code Generation:** (Required for Freezed models and Injectable routing)
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
4.  **Environment Configuration:**
    *   Copy `.env.example` to `.env` (or configure your variables).
    *   Provide your `SUPABASE_URL`, `SUPABASE_PUBLISHABLE_KEY`, and `STRIPE_PUBLISHABLE_KEY`.
5.  **Run the app:**
    ```bash
    flutter run
    ```

---

## 🧪 Testing & CI/CD

This project is built with rigorous quality assurance, featuring **100% error-path coverage** for all repositories and use cases.

### Running Tests

Before committing, ensure the code passes static analysis and all tests:

```bash
# 1. Check for linting errors (Zero-warning policy)
flutter analyze

# 2. Run the exhaustive test suite (Unit, Bloc, and Widget tests)
flutter test
```

### Testing Methodologies
*   **Domain & Data Layers**: Mock dependencies using `mocktail`. Both `Right` (success) and `Left` (failure) branches are explicitly tested.
*   **Presentation Layer**: State transitions and async events are verified using `bloc_test`.
*   **Widget Tests**: UI components are tested using manual `MockBloc` instances to prevent lifecycle interference, ensuring robust rendering of `loading`, `error`, and `success` states.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
