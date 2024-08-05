# event_app
This is a Flutter-based Events App designed using the Clean Architecture principles.
<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/d808bac7-1519-4e6c-b08f-f5b2389d6a37" alt="Image 1" width="300px">
    </td>
    
  </tr>

</table>


## Architecture

The app follows the **Clean Architecture** principles, which aim to separate the code into layers, making it more maintainable, testable, and scalable. The main layers are:

- **Presentation**: This layer includes the UI code and the state management.
- **Domain**: This layer contains the business logic, including use cases and entities.
- **Data**: This layer handles data retrieval, whether from local storage or network sources, and converts it into entities that the domain layer can use.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter

### Installation

1. Clone the repository:
   ```bash
   git clone https://sufiyansakkeer/Event-App/events-app.git
   cd events-app

2. Get the dependencies:
```bash
flutter pub get
```

3. Run the app:
   ```bash
   flutter run



