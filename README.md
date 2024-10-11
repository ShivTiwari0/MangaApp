# Webtoon Explorer

Welcome to **Webtoon Explorer**, an app built with Flutter that allows users to explore, read, and favorite webtoons from different genres!

This app uses **Cubit** for state management, **Dio** for API requests, and **Hive** for local data storage. It features a beautiful UI and a variety of functionalities, including a favorites section, genre-based filtering, and more.

## Features

- 🖼️ **Browse Webtoons**: Discover webtoons from various genres like Action, Romance, Comedy, and more.
- ⭐ **Favorite Webtoons**: Save your favorite webtoons for quick access later.
- 🔍 **Filter by Genre**: Browse webtoons by filtering through different genres.
- 🖥️ **Detailed Information**: View detailed information about each webtoon, including summary, total chapters, and more.
- 🎨 **Sleek UI**: Enjoy a modern UI with a black background, white text, and green accent colors.
- 💾 **Offline Storage**: Cached webtoons for offline access using Hive.
- ⚡ **Fast and Smooth**: Fast load times and smooth performance with Cubit state management.

## Screens

1. **Home Screen**
   - Displays webtoons categorized by genres.
   - Allows users to scroll through and select webtoons for more details.
  
2. **Details Screen**
   - Shows detailed information about the selected webtoon, such as its summary and total chapters.
  
3. **Favorites Screen**
   - Lists all webtoons that have been favorited by the user.

## Tech Stack

- **Flutter**: The app is built using Flutter for cross-platform compatibility.
- **Cubit**: State management using Cubit from the Bloc package.
- **Dio**: For handling API requests to fetch webtoons.
- **Hive**: Used for local storage, caching webtoons for offline access.
- **SharedPreferences**: Storing the user's favorite webtoons.

## Setup and Installation

To run the Webtoon Explorer app locally, follow these steps:

### Prerequisites

- Flutter SDK installed on your machine.
- An emulator or a real device to run the app.
- (Optional) Android Studio or Visual Studio Code for development.

### Installation Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ShivTiwari0/WebtoonExplorer.git


2. **Navigate to the project directory:**
cd WebtoonExplorer
Install the required dependencies:

3. **Install the required dependencies:**
flutter pub get


4. **Run the app::**
flutter run

**How to Use**
1.Launch the app on your emulator or device.
2.Explore the home screen and browse through the available webtoons.
3.Tap on a webtoon to view its details.
4.Add webtoons to your favorites by clicking on the heart icon.
5.Access your saved webtoons through the favorites screen.
6.Filter webtoons by selecting different genres using the genre tabs at the top.

**Folder Structure**
The project follows the MVC architecture pattern with well-structured layers:
lib/
│
├── core/
│   └── api.dart
│   └── ui.dart
│
├── data/
│   └── model/
│   └── repository/
│
├── logic/
│   └── cubit/
│   └── services/
│
├── presentation/
│   └── screen/
│   └── widgets/
│
└── main.dart
