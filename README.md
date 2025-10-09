# Laza - E-Commerce Mobile App

A sleek and modern mobile commerce app built with **Flutter**, designed to offer users a seamless shopping experience.  
This app is inspired by the **Laza E-commerce UI Kit** design.  

---

## ✨ Features & Screens (Design-based)

Based on the design from Figma, the app likely includes:

- **Authentication Screens** — Login, Register, Forgot Password, OTP Verification.  
- **Home / Featured Products Screen** — Highlights deals, banners, and featured products.  
- **Product List / Category Screen** — Browse products under categories (e.g. electronics, fashion, etc.).  
- **Product Details Screen** — View product images, description, price, reviews, and “Add to Cart / Wishlist” options.  
- **Cart Screen** — Items in cart, quantity adjustment, total price, remove item.  
- **Checkout Screen** — Place orders, confirm order.  
---

## 🌐 API Endpoints

| Feature                  | Method        | Endpoint                                     | Description                                  |
|---------------------------|---------------|-----------------------------------------------|-----------------------------------------------|
| Register                  | POST          | `/auth/register`                             | Create a new user account                     |
| Login                     | POST          | `/auth/login`                                | Log in with email and password                |
| Verify Email (OTP)        | POST          | `/auth/verify-email`                         | Verify user email with OTP code               |
| Refresh Token             | POST          | `/auth/refresh-token`                        | Refresh user authentication token             |
| Forgot Password           | POST          | `/auth/forgot-password`                      | Request password reset                        |
| Logout                    | POST          | `/auth/logout`                               | Log out the current user                      |
| Get Categories            | GET           | `/categories`                                | Retrieve all product categories               |
| Get Products              | GET           | `/products`                                  | Retrieve all available products               |
| Get Cart                  | GET           | `/cart`                                     | Retrieve all items in the user's cart         |
| Add Item to Cart          | POST          | `/cart/items`                               | Add a new item to the cart                    |
| Update / Delete Cart Item | PUT / DELETE | `/cart/items/{Id}`                          | Update or remove an item in the cart          |
| Get Coupons               | GET           | `/coupons`                                  | Retrieve available coupons                    |
| Manage Addresses          | GET / POST    | `/addresses`                                | Retrieve or add shipping addresses            |

> 📝 **Base URL:** `https://accessories-eshop.runasp.net/api`
