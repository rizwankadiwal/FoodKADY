class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'application/application'
  def index
    @banners = Banner.all
    @products_hotdeal = Product.where(:hotdeal => true).limit(6)
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
