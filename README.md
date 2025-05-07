# 📍 Realtime Location App with SignalR

A Flutter application built using **Clean Architecture**, **Cubit (flutter_bloc)**, **SignalR**, and **GetIt + Injectable** for dependency injection. The app demonstrates real-time location sharing with a modular and testable architecture.

---

## 🏠 Home Screen Features

### 🔌 Connection Status
- Displays the **current connection status**: Connected / Disconnected.
- Automatically updates when the SignalR connection state changes.

### 📍 Send Location
- Dropdown to **select a predefined location**.
- **Send Location** button is only enabled when connected.
- Sends the selected location to the server via SignalR.

### 🛰️ Receive Location
- Listens for **incoming broadcasted locations** from the server.
- Displays the received location in a list view.

---

## 🧼 Clean Architecture Highlights

### 🧠 Domain Layer
- Contains core business logic and interfaces.
- Includes:
    - `Entities` (e.g., `Location`)
    - `UseCases` (e.g., `SendLocation`, `ReceiveLocation`, `ListenToConnectionStatus`)
    - `Repositories` (abstract contracts)

### 🔌 Data Layer
- Implements domain contracts using external dependencies.
- Manages:
    - `SignalRServiceImpl` to handle SignalR connection
    - Server interactions

### 🎨 Presentation Layer
- Built using `flutter_bloc` (`Cubit`) for reactive UI.
- Displays UI states based on Cubit output.
- Provides user interactions like sending and receiving location.

### 🧰 Dependency Injection
- Set up with:
    - `get_it` for service locator
    - `injectable` for automatic DI code generation
- Uses annotations like:
    - `@LazySingleton` for long-lived services
    - `@Injectable` for Cubits and UseCases

---

## 📦 Use Cases

| Use Case | Description |
|----------|-------------|
| `SendLocationUseCase` | Sends selected location to server |
| `ReceiveLocationUseCase` | Registers callback for received locations |
| `ListenToConnectionStatusUseCase` | Listens to connection state changes |

---

## 🧪 Testing

This architecture allows easy testing of:

- ✅ **Cubits** – UI state management
- ✅ **UseCases** – Business logic
- ✅ **Repositories** – With mock data
- ✅ **SignalRService** – Inject a mock `HubConnection` to simulate connection

> Use packages like `mockito` or `mocktail` to mock dependencies for unit tests.

---

## 🔧 Packages Used

- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) – State management
- [`get_it`](https://pub.dev/packages/get_it) – Service locator
- [`injectable`](https://pub.dev/packages/injectable) – Dependency injection
- [`signalr_core`](https://pub.dev/packages/signalr_core) – SignalR client for Flutter

---

## 🏁 Getting Started

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

lib/
├── data/
│   └── repositories/
│       └── signalr_service_impl.dart
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── cubits/
│   └── screens/
└── core/
    └── di/
        └── injector.dart

