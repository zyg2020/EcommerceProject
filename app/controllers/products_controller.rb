class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  # products_path
  def index
    @products = Product.order(created_at: :desc).page(params[:page])
  end

  # new_products_products_path
  def new_products
    @products = Product.where("created_at > ?",
                              3.days.ago).order(created_at: :desc).page(params[:page])
  end

  # recently_updated_products_path
  def recently_updated
    @products = Product.where("updated_at > created_at").where("updated_at > ?",
                                                               3.days.ago).order(created_at: :desc).page(params[:page])
  end

  # on_sale_products_path
  def on_sale
    @products = Product.where.not(previous_price: nil).order(created_at: :desc).page(params[:page])
  end

  def search
    puts "category_name: " + params[:category_name]
    puts "name: " + params[:name]

    if params[:category_name].present?
      products_no_filtered = Product.joins(:categories).where(categories: { name: [params[:category_name]] })
    else
      products_no_filtered = Product.all
    end

    if params[:name] && params[:name] != ""
      wildcard_search = "%#{params[:name]}%"
      products_no_filtered = products_no_filtered.where("products.name LIKE ?", wildcard_search)
    end
    @products = products_no_filtered.order(created_at: :desc).page(params[:page])
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :previous_price)
  end
end
