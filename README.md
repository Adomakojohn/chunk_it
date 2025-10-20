# Chunkit

Chunkit is a Flutter application designed to transform long YouTube videos into a series of short, engaging, TikTok-style video chunks. This app provides a simple and intuitive interface for users to select, cut, and view their favorite moments from any YouTube video.

## Core Features

-   **YouTube Video Fetching:** Seamlessly fetch any public YouTube video by simply pasting its URL.
-   **Video Downloading:** Download videos in various resolutions to your device for offline processing.
-   **Intelligent Chunking:**
    -   **Manual Mode:** Precisely select the start and end times for each chunk.
    -   **Automatic Mode:** Automatically segment the video into equal-duration chunks.
-   **TikTok-Style Feed:** Experience the generated chunks in a vertical, swipeable video feed.
-   **Local Storage & Sharing:** Save your favorite chunks directly to your device and share them with friends.

## Architectural Overview

This project follows the **Clean Architecture** principles, separating the codebase into three distinct layers: `data`, `domain`, and `presentation`. This separation of concerns ensures that the app is scalable, maintainable, and testable.

-   **`lib/core`:** This directory contains the application's core components, including dependency injection, theme, constants, and network information.
-   **`lib/features`:** Each feature of the application (e.g., `video`, `auth`, `settings`) is a self-contained module with its own `data`, `domain`, and `presentation` layers.

### Technical Stack

-   **State Management:** `flutter_bloc` for predictable state management.
-   **Dependency Injection:** `get_it` and `injectable` for managing dependencies and decoupling components.
-   **Networking:** `dio` for robust network requests and `youtube_explode_dart` for interfacing with YouTube.
-   **Video Processing:** `ffmpeg_kit_flutter` for efficient video cutting and processing.
-   **UI:** `video_player` for video playback and `cached_network_image` for caching thumbnails.

## App Flow & Technical Implementation

1.  **Video Ingestion:**
    -   The user provides a YouTube URL.
    -   The `youtube_explode_dart` library is used to extract the video's metadata and available streams.

2.  **Video Download:**
    -   The user selects their preferred video quality.
    -   The selected video stream is downloaded to the device's local storage using `path_provider`.

3.  **Chunk Definition:**
    -   The downloaded video is displayed in a `video_player`.
    -   The user can then define the chunks either manually (by marking start/end points) or automatically (by specifying a duration).

4.  **Video Segmentation:**
    -   A list of chunk definitions is passed to the `ffmpeg_kit_flutter` library.
    -   For each chunk, an `ffmpeg` command is executed to cut the video without re-encoding, ensuring fast processing.

5.  **Chunk Playback:**
    -   The resulting video chunks are displayed in a `PageView` widget, creating a vertical, TikTok-style feed.

## Getting Started

To get started with this project, you will need to have the Flutter SDK installed. You can find instructions on how to do this [here](https://flutter.dev/docs/get-started/install).

Once you have the Flutter SDK installed, you can clone this repository and run the following command to install the dependencies:

```bash
flutter pub get
```

Then, you can run the app on a connected device or simulator using the following command:

```bash
flutter run
```

## Future Plans

-   **User Accounts:** Implement user accounts to allow users to save their favorite chunks and videos.
-   **Cloud Sync:** Sync user data across multiple devices.
-   **Social Sharing:** Add more options for sharing chunks on social media.
-   **Advanced Editing:** Add more advanced video editing features, such as adding text and filters to chunks.
