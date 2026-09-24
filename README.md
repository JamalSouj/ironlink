# Ascent - Coach and Client Fitness App

A robust Flutter application for fitness coaches and their clients, featuring program management, readiness tracking, messaging, and Stripe billing integration. Built following Clean Architecture principles.

## Architecture

This project strictly adheres to **Clean Architecture** separated by feature:

- `core/`: Shared utilities, error handling (`Failures`), routing, and themes.
- `features/<feature_name>/`:
  - `domain/`: Business logic, Entities, Use Cases, and Repository interfaces. (Independent of any external frameworks).
  - `data/`: Repository implementations, Models (Freezed/JSON Serializable), and Data Sources (Supabase).
  - `presentation/`: UI, Widgets, Pages, and State Management (BLoC/Cubit).

**State Management:** `flutter_bloc`
**Service Locator:** `get_it` & `injectable`
**Functional Error Handling:** `fpdart` (`Either<Failure, Success>`)
**Immutable Models:** `freezed` & `json_serializable`

## Getting Started

### Prerequisites

- Flutter SDK (>= 3.38.9)
- Dart SDK (>= 3.10.8)

### Setup & Code Generation

After cloning the repository, fetch dependencies and run code generation for Freezed models and Injectable services:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

## Running Tests & CI

This project includes comprehensive unit tests and widget tests. Error paths (e.g., `Left(Failure)`) are strictly tested for all repository methods and Use Cases.

### CI Commands

Before committing, ensure your code passes analysis and all tests:

```bash
# 1. Check for linting errors
flutter analyze

# 2. Run all tests
flutter test

# 3. Ensure code generation is up to date
dart run build_runner build
```

## Testing Guidelines

- **Use Cases & Repositories**: Mock dependencies using `mocktail`. Verify both `Right` and `Left` paths.
- **Bloc/Cubit**: Test state transitions using `bloc_test`.
- **Streams (`async*`)**: Use `expectLater(stream, emitsInOrder([...]))` for testing reactive flows.
- **Widget Tests**: Provide manual `MockBloc` instances (extending `Mock`) instead of using `bloc_test`'s `MockBloc` to avoid lifecycle and state interference during widget pumping. Ensure `stream` and `close` are stubbed.

