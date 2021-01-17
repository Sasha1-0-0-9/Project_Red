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

  def show
    @product = Product.find(params[:id]).paginate(page: params[:page], per_page: 6)
  end

  def search
    @products = Product.where('name ILIKE ? OR description ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%").paginate(
      page: params[:page], per_page: 6
    )
    render 'products/index'
  end
end
