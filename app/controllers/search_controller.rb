class SearchController < ApplicationController
 def search
  @search_terms = params[:q]

  @products = Product.where("product_name LIKE ?", "%#{@search_terms}%")
   #@cat = Category.find(:)
   end
end
