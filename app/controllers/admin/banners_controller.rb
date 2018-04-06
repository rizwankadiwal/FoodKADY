module Admin
  class BannersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @banners = Banner.paginate(:page => params[:page], :per_page => 10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Banner.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:slideshow_banner_title,
                                     :slideshow_banner_subtitle,
                                     :created_at,
                                     :updated_at,
                                     :banner_image_file_name,
                                     :banner_image_content_type,
                                     :banner_image_file_size,
                                     :banner_image_updated_at,
                                     :banner_link)
    end

  end
end
