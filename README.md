# Mock_Instagram


### System Design

```
                    ┌─────────────┐
                    │     App     │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │ ContentView │
                    └──────┬──────┘
                           │
           ┌───────────────┴───────────────┐
           │                               │
   ┌───────▼───────┐               ┌───────▼───────┐
   │  Login Flow   │               │   Main Flow   │
   └───────┬───────┘               └───────┬───────┘
           │                               │
           │                     ┌─────────┼─────────┐
  ┌────────▼─────────┐          │         │         │
  │                  │    ┌─────▼─┐ ┌─────▼─┐ ┌─────▼─┐
  │   AuthService    │    │ Feed  │ │Search │ │Upload │
  │                  │    └───────┘ └───────┘ └───────┘
  └────────┬─────────┘          │
           │                ┌────▼────┐
     ┌─────▼─────┐          │         │
     │  Firebase │          │Services │
     └───────────┘          └─────────┘
```

## Getting Started

### Prerequisites

- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+
- CocoaPods or Swift Package Manager

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/mock-instagram.git
   ```

2. Install dependencies:
   ```
   cd mock-instagram
   pod install
   ```
   
   (or using Swift Package Manager through Xcode)

3. Open the `.xcworkspace` file in Xcode

4. Create a Firebase project and add your GoogleService-Info.plist

5. Build and run the application

## Features in Detail

### Authentication

The app uses Firebase Authentication for user management, with a complete registration and login flow.

### Feed

The feed displays posts from all users with like and comment functionality.

### Profile

Users can view their own profile or others' profiles, including:
- Profile stats (followers, following, posts)
- Grid view of posted images
- Follow/unfollow functionality
- Profile editing

### Post Upload

Users can select images from their library and upload posts with captions.

### Notifications

Real-time notifications for:
- Likes on posts
- Comments on posts
- New followers

## Future Enhancements

- Direct messaging
- Stories functionality
- Reels/short video content
- Enhanced search with hashtags
- Location tagging for posts
