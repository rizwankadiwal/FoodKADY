class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'application/application'
  def index
    @banners = Banner.all
    @products_hotdeal = Product.where(:hotdeal => true).limit(6)
    @new_products = Product.order('created_at DESC').limit(8)

    #fruits vegetable block
    @fruits_vegetables_products = Product.joins(:categories).where(
        categories: { category_name: 'FRUITS & VEGETABLES' }).limit(8)
    @fruits_products = Product.joins(:categories).where(
        categories: { category_name: 'FRUITS' }).limit(8)
    @vegetables_products = Product.joins(:categories).where(
        categories: { category_name: 'VEGETABLES' }).limit(8)
    @salad_products = Product.joins(:categories).where(
        categories: { category_name: 'SALAD' }).limit(8)

    #dairy block
    @dairy_products = Product.joins(:categories).where(
        categories: { category_name: 'DAIRY' }).limit(8)

    #pantry block
    @pantry_products = Product.joins(:categories).where(
        categories: { category_name: 'PANTRY' }).limit(8)

    #sale_product block
    @sale_products = Product.where("sale_price is not null").limit(8)
  end

  #category page
  def category
    if params[:category]
      @products = Product.joins(:categories).where(
          categories: { id: params[:category] }
      ).all.paginate(page: params[:page], per_page: 20)
      @cat = Category.find(params[:category])
    else
      redirect_to root_url
    end
  end

  private
  def after_sign_in_path_for(resource)
    if resource.is_a?(SuperUser)
      :admin_root
    else
      root_url
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
