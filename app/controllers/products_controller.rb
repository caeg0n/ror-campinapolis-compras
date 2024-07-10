class ProductsController < ApplicationController
  include ResponseHandler

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

  def destroy
    product_id = product_params["id"]
    product = Product.find_by(id: product_id)
    if product
      product.destroy
      return render_json_response(state: ResponseHandler::STATES[:destroyed])
    else
      return render_json_response(state: ResponseHandler::STATES[:fail])
    end
  end

  def pause_product
    product_id = product_params["id"]
    status = product_params["status"]
    product = Product.find_by(id: product_id)
    if product
      product.status = status
      product.save
      return render_json_response(state: ResponseHandler::STATES[:paused]) if status == "paused"
      return render_json_response(state: ResponseHandler::STATES[:active]) if status == "active"
    else
      return render_json_response(state: ResponseHandler::STATES[:fail])
    end
  end

private

    def search_params
      params.require(:product).permit(:product_name)
    end

    def product_params
      params.require(:product).permit(:id,:name, :category_id,:description, :price, :img,:organization_id,:status)
    end
end
