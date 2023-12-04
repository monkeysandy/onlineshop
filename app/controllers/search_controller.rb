class SearchController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    search_term = params[:query].strip
    @results = Product.where("name LIKE ?", "%#{search_term}%")

    # If the search term is a valid number, also search in the price column
    if is_number?(search_term)
      max_price = search_term.to_d
      @results = @results.or(Product.where("price <= ?", max_price))
    end
  end

  private

  # Helper method to check if a string is a valid number
  def is_number?(string)
    true if Float(string) rescue false
  end
end
