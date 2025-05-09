# Mock_Instagram

### Features

- User Authentication: Complete email/password authentication flow with Firebase
- Feed View: Dynamic scrolling feed of posts with like and comment functionality
- Post Creation: Camera integration and post uploading with captions
- Profile Management: View/edit profiles, follow/unfollow users
- Real-time Notifications: Like, comment, and follow notifications
- Explore Page: Discover and search for other users
- Comments System: Add and view comments on posts

### Technology Stack

- Frontend: SwiftUI for modern declarative UI
- Architecture: MVVM (Model-View-ViewModel) design pattern
- Backend: Firebase
  - Authentication for user management
  - Cloud Firestore for database operations
  - Firebase Storage for media storage
- Image Handling: PhotosUI for media selection and Kingfisher for image caching

### Architecture
#### The app follows the MVVM (Model-View-ViewModel) architecture:
- Models: Represent data structures (User, Post, Comment, etc.)
- Views: UI components built with SwiftUI
- ViewModels: Handle business logic and data operations
- Services: Manage data operations with Firebase

### System Design
<img width="691" alt="Screenshot 2025-05-08 at 11 29 46 PM" src="https://github.com/user-attachments/assets/4dd4ffbe-fe66-4494-b901-bed7c5c47edf" />




