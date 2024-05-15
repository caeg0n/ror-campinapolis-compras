class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def all_not_excluded_and_paused
    products1 = Product.where(status:'active')
    products2 = Product.where(status: nil)
    render json: products1+products2
  end

  def get_length
    render json: Product.where(organization_id:params[:id].to_i).count
  end

  def create
    product = Product.new(product_params)
    return render json: { message: 'created' }, status: :ok if product.save
    return render json: product.errors, status: :unprocessable_entity
  end

  def search
    product_name = search_params["product_name"]
    render json: Product.search_by_keyword(product_name)
  end


private

    def search_params
      params.require(:product).permit(:product_name)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category_id,:description, :price, :img,:organization_id,:status)
    end
end
