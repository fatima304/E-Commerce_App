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

| Feature                  | Method   | Endpoint                          | Description                                  |
|---------------------------|----------|------------------------------------|-----------------------------------------------|
| Register                  | POST     | `/auth/register`                  | Create a new user account                     |
| Login                     | POST     | `/auth/login`                     | Log in with email and password                |
| OTP Verification          | POST     | `/auth/verify-otp`                | Verify user email with OTP code              |
| Get Products              | GET      | `/products`                       | Retrieve all available products               |
| Get Categories            | GET      | `/categories`                     | Retrieve all product categories               |
| Get Products by Category  | GET      | `/categories/{id}/products`      | Retrieve products belonging to a category     |
| Get Product Details       | GET      | `/products/{id}`                  | Retrieve details of a specific product        |
| Wishlist - Add / Get      | POST/GET | `/wishlist`                       | Add to or retrieve wishlist                   |
| Cart - Add / Get         | POST/GET | `/cart`                           | Add to or retrieve cart items                 |
| Cart - Update Item        | PUT/PATCH| `/cart/{id}`                      | Update quantity of an item in the cart        |
| Cart - Remove Item        | DELETE   | `/cart/{id}`                      | Remove an item from the cart                  |
| Checkout / Place Order    | POST     | `/orders/checkout`               | Complete the purchase process                 |
| Order History             | GET      | `/orders`                        | Retrieve user's previous orders               |
| Order Details             | GET      | `/orders/{id}`                   | Retrieve details of a specific order          |

