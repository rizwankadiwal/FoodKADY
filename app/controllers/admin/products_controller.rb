module Admin
  class ProductsController < Admin::ApplicationController


    def import
      Product.import(params[:file])
      redirect_to root_url, notice: 'Products Imported'
    end

    # GET /products
    # GET /products.json
    def index
      @products = Product.all
    end


    # POST /products
    # POST /products.json
    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
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
                                      category_ids: [])
    end
  end
end
