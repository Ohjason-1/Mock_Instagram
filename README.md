# Mock_Instagram

![Screenshot 2025-05-09 at 2 28 52 PM](https://github.com/user-attachments/assets/c62ba9f3-487f-4f77-8d77-4f447758eabf)

![Screenshot 2025-05-09 at 2 29 13 PM](https://github.com/user-attachments/assets/e50d09d2-e162-4aa0-aaed-a3e6c6b1c99b)

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

Description of each file based on the structure: [mock_insta_architecture.pdf](https://github.com/user-attachments/files/20129837/mock_insta_architecture.pdf)



### System Design

![Screenshot 2025-05-09 at 4 57 43 PM](https://github.com/user-attachments/assets/338db6ba-1c53-48c1-b45b-283379ccaba4)






