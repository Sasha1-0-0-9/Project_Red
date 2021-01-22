class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 6)
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
                end
    if params[:sort] == 'lowPrice'
      @products = Product.order(price: :ASC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'highPrice'
      @products = Product.order(price: :DESC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'alphabetAsc'
      @products = Product.order(title: :ASC).paginate(page: params[:page], per_page: 6)
    elsif params[:sort] == 'alphabetDesc'
      @products = Product.order(title: :DESC).paginate(page: params[:page], per_page: 6)
    elsif params[:min] || params[:max]
      @products = Product.where(price: [params[:min]].first..[params[:max]].last).paginate(page: params[:page],
                                                                                           per_page: 6)
    end
  end

  def new
    @product = Product.new
  end

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

  def edit; end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('name ILIKE ? OR description ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%").paginate(
      page: params[:page], per_page: 6
    )
    render 'products/index'
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
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
    params.require(:product).permit(:title, :description, :available, :price)
  end
end
