module Admin
  class ProductsController < Admin::ApplicationController

    # GET /products
    # GET /products.json
    def index
      @products = Product.paginate(:page => params[:page], :per_page => 30)
      respond_to do |format|
        format.html
        format.csv { send_data @products.to_csv, filename: "products-#{Date.today}"}
      end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :sku, :is_available,
                                      :taxable_class, :description, :price,
                                      :cost, :notes, :product_image, :stock_quantity,
                                      :sale_price, :hotdeal, category_ids: [])
    end
  end
end
