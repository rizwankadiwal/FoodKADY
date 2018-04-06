class FrontEndCategoryController < ApplicationController
  def category
    if params[:category]
      @products = Product.where(category: params[:category]).paginate(page: params[:page], per_page: 20)
      @products = Product.joins(:categories).where(
          categories: { id: params[:category] }
      ).all.paginate(page: params[:page], per_page: 20)
      @cat = Category.find(params[:category])
    else
      redirect_to root_url
    end

  end
end
