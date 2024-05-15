class PrintController < ApplicationController
  #before_action :set_product, only: [:show, :update, :destroy]

  def index
    render :file => "view/print/_print.html.erb"
    #format.html { render "_print }
    # products = Product.all
    # render json: products
  end


  
  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category,:description, :price, :img,:organization_id)
    end
end
