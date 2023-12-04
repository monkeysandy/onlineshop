# Ruby on Rails Online Store

This project is an online store built using Ruby on Rails, as demonstrated in our class lectures. It allows users to browse products, add them to a shopping cart, and place orders. The store features a search functionality and user authentication for admins.

## Features

### Product Management
- **Two Views for Product Data Resource**: Implemented two different views for interacting with product data.
- **Create Your Own Data**: Ability to add and manage products in the store.

### Shopping Cart and Order Functions
- **Shopping Cart**: Users can add products to a shopping cart and manage their cart before placing an order.
- **Order Functions**: Users can place orders for items in their shopping cart.

### User Authentication
- **Admin Authentication**: Admin users can log in to access and manage the store.

### Additional Functionalities

#### Product Search
- **Search Functionality**: Users can search for products by name and description. A search by price feature can be added as well.

#### Product Display and Interaction
- **Interactive Product Listings**: In the shopper's view, each product item is clickable, leading to a detailed view of the individual product.
- **Add to Cart**: From the individual product view, users can add the product to their shopping cart.

## Setup and Installation

To get this application up and running on your local machine, follow these steps:

### Install Dependencies

1. First, install the necessary Ruby gems:

```bash
bundle install
rails s
```
2. After starting the server, you can access the application in your web browser at http://localhost:3000.

## Usage

### User Features
- Account Creation: Go to the signup page to create a new account. Once signed up, you can log in to start shopping.
- Or use test account
  ```
  userid:test password:test
  ``` 
- Shopping: Browse through the products and add them to your shopping cart. Proceed to checkout to place your order.
- View Orders: Access your user profile to view your past orders.
- Search Products: Use the search feature to find products by name and price.
### Admin Features
- Admin Login: Log in with the 
  ```
  userid:admin password:123
  ``` 
  to access the admin panel.
- Order Management: As an admin, you can view and manage orders placed by users.
- Product Management: You can add new products to the store from the homepage.
### Navigating to Home
Click the logo in the banner at any time to return to the homepage.

## Contributing

Contributions to this project are welcome. Please follow the standard fork and pull request workflow. If you have any suggestions or encounter issues, feel free to open an issue or submit a pull request.

## License

