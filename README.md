
# Very Good Coffee App

This is a simple Flutter app that loads coffee images from the internet and allows users to save their favorite coffee images locally for offline viewing.

## Features

- Load random coffee images from the network.
- Save coffee images for offline viewing.
- View and delete saved coffee images.

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/udaykumaruking/very_good_coffee_app.git
   ```

2. Navigate to the project folder:

   ```bash
   cd very_good_coffee_app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app on a connected device:

   ```bash
   flutter run
   ```

## API

The coffee images are fetched from the public API: [Coffee API](https://coffee.alexflipnote.dev)

## Folder Structure

The project is organized as follows:

```
lib/
├── components/
│   └── **bottom_nav_bar.dart**  
│       - This file defines the bottom navigation bar component, which allows users to navigate between different sections of the app, such as the image loader and saved images pages.
├── constants/
│   └── **app_constants.dart**  
│       - Contains constant values used across the application, such as API URLs and other fixed values that are referenced in multiple places.
├── models/
│   └── **coffee_image.dart**  
│       - Defines the data model for a coffee image. It represents the structure of the image object, including properties like the image URL, date saved, and other relevant metadata.
├── providers/
│   └── **coffee_image_provider.dart**  
│       - Manages the state of coffee images using the Provider package. This file handles the logic for fetching, saving, and deleting coffee images, and keeps the UI in sync with changes.
├── repositories/
│   └── **coffee_image_repository.dart**  
│       - Handles data persistence and storage logic. This includes saving coffee images locally to the device and retrieving them when the app is offline or on demand.
├── screens/
│   ├── **favorites_page.dart**  
│   │   - Displays a list of favorite coffee images that have been saved by the user. It provides a scrollable, list view of all stored images.
│   ├── **home_page.dart**  
│   │   - The main entry page for the app. It likely includes navigation logic and high-level elements like the bottom navigation bar.
│   ├── **image_loader_screen.dart**  
│   │   - Displays the coffee image loaded from the network. This screen fetches a new coffee image from the API and allows users to save the image if they wish.
├── services/
│   └── **coffee_image_service.dart**  
│       - Contains the logic for making network requests to fetch coffee images from the API. It communicates with the coffee image API and sends the results to the provider.
└── **main.dart**  
    - The entry point of the Flutter app. This file initializes the app, sets up the routes, and provides the initial screen that users see when the app starts.
```
### Detailed Overview:

- **components/**: 
  - Contains reusable UI components like navigation bars, buttons, and other shared widgets that are used across multiple screens in the app.
  
- **constants/**: 
  - Holds any constant values, such as API endpoints, fixed parameters, or theme-related constants. These constants are used throughout the application and help centralize configuration values.
  
- **models/**: 
  - Defines the data structure for the app. In this case, it includes a model for coffee images, representing properties like image URLs, timestamps, and any additional metadata required for displaying or saving the image.

- **providers/**: 
  - Manages the application state using the **Provider** pattern. This layer ensures the separation of logic from the UI, managing tasks like fetching images, saving state, and handling updates that affect the UI.

- **repositories/**: 
  - Responsible for local data storage, including saving and retrieving coffee images. The repository pattern ensures the persistence of data even when the app is offline, providing easy access to saved images.

- **screens/**: 
  - Contains the different UI pages (or screens) that make up the app's user interface, such as the home screen, image loader screen, and the saved images screen.

- **services/**: 
  - Handles network requests and external data fetching. This layer is responsible for fetching images from the Coffee API and delivering the data to the provider, ensuring a clear separation between data acquisition and business logic.

- **main.dart**: 
  - The main entry point of the Flutter app. It sets up the initial routes, initializes the app, and defines how the different screens are connected and displayed when the app starts.


## Testing

The app includes unit and widget tests. To run tests, use the following command:

```bash
flutter test
```

## Contributing

Contributions are welcome! If you want to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/YourFeature`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push to the branch: `git push origin feature/YourFeature`.
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications.
- [Provider](https://pub.dev/packages/provider) - State management solution for Flutter apps.
- [HTTP](https://pub.dev/packages/http) - A composable, Future-based library for making HTTP requests.

---
