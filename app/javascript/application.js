// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



document.addEventListener('turbo:load', function() {
    document.getElementById('banner-icons').addEventListener('click', function(event) {
      if (document.getElementById('cart-icon').contains(event.target)) {
        var cartDropdown = document.getElementById('cart-dropdown');
        cartDropdown.style.display = cartDropdown.style.display === 'block' ? 'none' : 'block';
      }
    });
  }
);
  
  
  
