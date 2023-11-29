# SwiftUI Navigation Example for iOS 14

## Overview
This sample iOS project is designed to demonstrate the use of SwiftUI navigation in iOS 14. It showcases a typical use case of a list-detail navigation pattern, where users can view a list of items, add new items, and edit existing ones. The project is built with Swift and employs modern SwiftUI concepts.

## Features
- **Navigation View:** Utilizes `NavigationView` for stack-based navigation.
- **List and Detail Views:** Implements `ItemListView` to display items and `ItemDetailView` for editing item details.
- **Custom Modifiers:** Includes custom view modifiers like `TappableRowViewModifier` and `NavButtonViewModifier` to enhance navigation and user interface.
- **State Management:** Uses `ItemListDataModel` as an observable object for state management across views.
- **SwiftUI Concepts:** Demonstrates SwiftUI concepts like `@StateObject`, `@Binding`, view modifiers, and more.

## Installation
1. **Clone the Repository**: Clone this repository to your local machine using `git clone`.
2. **Open the Project**: Open the `.xcodeproj` file in Xcode.
3. **Run the Project**: Select an iOS Simulator or a connected iOS device and run the project.

## Usage
- **Viewing Items**: The `ItemListView` displays a list of items. Each item can be tapped to view and edit its details.
- **Adding New Items**: Tap the 'plus' button in the navigation bar to add a new item.
- **Editing Items**: Select an item from the list to edit its name in the `ItemDetailView`.
- **Navigation**: The project demonstrates forward and backward navigation along with modal presentation.

## Screenshots


## Contributing
Contributions to improve this example are welcome. Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## License
This project is open-source and available under the [MIT License](LICENSE).
