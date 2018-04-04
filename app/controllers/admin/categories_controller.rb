module Admin
  class CategoriesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Category.
    #     page(params[:page]).
    #     per(10)
    # end

    def index
      @categories = Category.all
      respond_to do |format|
        format.html
        format.csv { send_data @categories.to_csv, filename: "categories-#{Date.today}"}
      end

      @products = Product.all
    end
    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Category.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
