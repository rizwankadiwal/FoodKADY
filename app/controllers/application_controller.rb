class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'application/application'
  def index
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
