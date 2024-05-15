class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :update, :destroy]

 
  def index
    temp_result = {}
    temp_result["delivery"] = []
    temp_result["orders"] = []
    result = []
    if deliveryman_id
      deliveries = Delivery.where(deliveryman_id:deliveryman_id)
      deliveries.each do |delivery|
        temp_result["delivery"] << delivery
        orders = delivery.orders
        orders.split(",").map { |s| s.to_i }.each do |order_id|
          order = Order.find(order_id)
          temp_result["orders"] << order
        end
        result << temp_result.clone
        temp_result["delivery"] = []
        temp_result["orders"] = []
      end
      render json: result
    else
      render json: :nothing,status: :unprocessable_entity
    end

  end

  def get_deliveries_lenght
    pa = params.permit(['deliveryman_id'])
    id = pa['deliveryman_id']
    render json: Delivery.where(deliveryman_id:id).count
  end

  # def show
  #   render json: @delivery
  # end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      render json: @delivery, status: :created, location: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @delivery.update(delivery_params)
  #     render json: @delivery
  #   else
  #     render json: @delivery.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
    arr = ["canceled","fail"]
    orders = @delivery.orders
    orders.split(",").map { |s| s.to_i }.each do |order_id|
      order = Order.find(order_id)
      #if not arr.include?(order.salesman_state)
        order.salesman_state = "waiting"
        order.delivery_state = "accepted_to_camp"
        order.save
      #end
    end
    @delivery.destroy
  end

  private
    
    def deliveryman_id
      param = params.permit(:param)
      param["param"] 
    end 
    
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    def delivery_params
      params.require(:delivery).permit(:orders, :origin_id, :deliveryman_id)
    end

end
