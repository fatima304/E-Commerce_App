# Laza - E-Commerce Mobile App

A modern and sleek mobile commerce application built with **Flutter**, designed to provide users with a seamless shopping experience. This app is inspired by the **Laza E-commerce UI Kit** design and implements a clean architecture pattern with BLoC state management.


## 🚀 How to Run the App

### Prerequisites
- Flutter SDK (version 3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device/emulator or iOS device/simulator

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/ecommerce_app.git
   cd ecommerce_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # For Android APK
   flutter build apk --release
   
   # For iOS
   flutter build ios --release
   ```

### Troubleshooting
- If you encounter dependency issues, run `flutter clean` followed by `flutter pub get`
- For Android build issues, ensure you have the latest Android SDK installed
- For iOS build issues, ensure you have Xcode installed (macOS only)

## ✨ Implemented Features

### 🔐 Authentication System
- **User Registration** - Create new accounts with email verification
- **User Login** - Secure authentication with email and password
- **Forgot Password** - Password recovery with OTP verification
- **OTP Verification** - Email verification for registration and password reset
- **User Profile** - Display user name in drawer after registration

### 🏠 Home & Navigation
- **Splash Screen** - App initialization and loading
- **Home Screen** - Featured products, categories, and product grid
- **Bottom Navigation** - Easy navigation between main sections
- **Drawer Menu** - Side navigation with user profile and menu options
- **Category Browsing** - Browse products by categories

### 🛍️ Product Management
- **Product Listing** - Display all available products
- **Product Details** - Detailed product view with images and descriptions
- **Product Search** - Search functionality for finding products
- **Category Filtering** - Filter products by categories

### ❤️ Wishlist System
- **Add to Wishlist** - Save favorite products
- **Wishlist Screen** - View all saved items
- **Remove from Wishlist** - Remove unwanted items
- **Wishlist Navigation** - Easy access from drawer menu

### 🛒 Shopping Cart
- **Add to Cart** - Add products to shopping cart
- **Cart Management** - View, update, and remove cart items
- **Quantity Adjustment** - Modify item quantities
- **Price Calculation** - Automatic total price calculation

### 📍 Address Management
- **Add Address** - Add new shipping addresses
- **Address List** - View all saved addresses
- **Address Selection** - Choose delivery address for orders

### 💳 Order Processing
- **Cart Checkout** - Proceed with order placement
- **Coupon System** - Apply discount coupons
- **Order Confirmation** - Confirm order details
- **Order Tracking** - Track order status

### 🎨 UI/UX Features
- **Responsive Design** - Optimized for different screen sizes
- **Dark Mode Support** - Toggle between light and dark themes
- **Loading States** - Proper loading indicators
- **Error Handling** - Graceful error handling with user feedback
- **Image Loading** - Safe image loading with placeholders
- **Keyboard Handling** - Proper keyboard behavior on forms

## 🌐 API Endpoints

The app communicates with a REST API hosted at `https://accessories-eshop.runasp.net/api`

### Authentication Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register a new user account |
| POST | `/auth/login` | Login with email and password |
| POST | `/auth/verify-email` | Verify email with OTP code |
| POST | `/auth/forgot-password` | Request password reset |
| POST | `/auth/reset-password` | Reset password with OTP |
| POST | `/auth/refresh-token` | Refresh authentication token |
| POST | `/auth/logout` | Logout current user |

### Product & Category Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/categories` | Get all product categories |
| GET | `/products` | Get all available products |

### Shopping Cart Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/cart` | Get user's cart items |
| POST | `/cart/items` | Add item to cart |
| PUT | `/cart/items/{Id}` | Update cart item quantity |
| DELETE | `/cart/items/{Id}` | Remove item from cart |

### Additional Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/coupons` | Get available discount coupons |
| GET | `/addresses` | Get user's saved addresses |
| POST | `/addresses` | Add new shipping address |

## 🏗️ Architecture & Tech Stack

### Architecture Pattern
- **Clean Architecture** - Separation of concerns with data, domain, and presentation layers
- **BLoC Pattern** - State management using flutter_bloc
- **Dependency Injection** - Service locator pattern with get_it

### Key Technologies
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language
- **BLoC** - State management
- **Dio** - HTTP client for API communication
- **SharedPreferences** - Local data storage
- **Retrofit** - Type-safe HTTP client
- **GetIt** - Dependency injection

### Project Structure
```
lib/
├── core/                 # Core utilities and shared code
│   ├── di/              # Dependency injection setup
│   ├── helper/          # Helper classes and utilities
│   ├── network/         # Network configuration
│   ├── routes/          # App routing
│   ├── theme/           # App theming
│   └── widgets/         # Reusable widgets
├── features/            # Feature-based modules
│   ├── auth/           # Authentication feature
│   ├── home/           # Home and product features
│   ├── details/        # Product details
│   ├── orders/         # Cart and order management
│   ├── wishlist/       # Wishlist functionality
│   └── splash/         # Splash screen
└── main.dart           # App entry point
```

## 🔧 Configuration

### Environment Setup
- **Base URL**: `https://accessories-eshop.runasp.net/api`
- **Flutter SDK**: ^3.9.2
- **Dart SDK**: Included with Flutter

### Android Configuration
- **Minimum SDK**: API level 21 (Android 5.0)
- **Target SDK**: Latest stable version
- **Network Security**: Configured for HTTP/HTTPS requests

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Acknowledgments

- Design inspired by **Laza E-commerce UI Kit**
- Built with ❤️ using Flutter
- Thanks to all contributors who helped make this project possible

## 📞 Support

If you have any questions or need help, please:
- Open an issue on GitHub
- Contact the development team
- Check the documentation

---

**Happy Shopping! 🛍️**

## 📱 Screenshots

<img width="1080" height="2424" alt="Screenshot_1760268583" src="https://github.com/user-attachments/assets/e4134c00-1952-4c98-8876-44615a934776" />
<img width="1080" height="2424" alt="Screenshot_1760268494" src="https://github.com/user-attachments/assets/c5727341-f88f-4ffc-9b10-be307d569261" />
<img width="1080" height="2424" alt="Screenshot_1760268489" src="https://github.com/user-attachments/assets/3ea28760-0762-4bf2-8edd-6975cb919c27" />
<img width="1080" height="2424" alt="Screenshot_1760268485" src="https://github.com/user-attachments/assets/b05f61a9-9206-4d45-9dc2-38998b03ddfb" />
<img width="1080" height="2424" alt="Screenshot_1760268478" src="https://github.com/user-attachments/assets/9fb43437-6b96-413a-8acd-8d26c5de5c9d" />
<img width="1080" height="2424" alt="Screenshot_1760268378" src="https://github.com/user-attachments/assets/22d949f3-890a-4c3d-9b37-e940235f00d0" />
<img width="1080" height="2424" alt="Screenshot_1760268276" src="https://github.com/user-attachments/assets/7cb4e28e-e31e-472b-a724-80228ec113d3" />
<img width="1080" height="2424" alt="Screenshot_1760268238" src="https://github.com/user-attachments/assets/eeb9b40a-beef-4314-8066-e2ed6d925e99" />

<img width="1080" height="2424" alt="Screenshot_1760268236" src="https://github.com/user-attachments/assets/5376ae25-931a-4484-8052-16169aaad5ff" />
<img width="1080" height="2424" alt="Screenshot_1760268215" src="https://github.com/user-attachments/assets/01afc05b-5dd9-42fd-9d01-1e5623c8b9ec" />
