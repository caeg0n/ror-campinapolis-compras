class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update]

  def index
    pa = params.permit(['device_id'])
    id = pa['device_id']
    if (id)
      addresses = Address.where(device_id: id)
      render json: addresses, status: :ok
      return
    end    
    render json: "erro", status: :unprocessable_entity
  end

  # def index
  #   pa = params.permit(['device_id','get_length'])
  #   id = pa['device_id']
  #   gl = pa["get_length"]
  #   if (id)
  #     addresses = Address.where(device_id: id)
  #   else
  #     addresses = Address.all
  #   end
    
  #   if not gl.nil?
  #     resp = Address.where(device_id:id).count.to_i
  #     render json: resp
  #   else
  #     render json: addresses
  #   end
  # end

  # def show
  #   render json: @address
  # end

  def create
    device_id = address_params[:device_id]
    name = address_params[:name]
    title = address_params[:title]
    cel = address_params[:cel]
    address = address_params[:address_detail]
    if device_id.present? and title.present? and name.present? and cel.present? and address.present? 
      @address = Address.new()
      @address.device_id = device_id
      @address.title = title
      @address.name = name
      @address.cel = cel
      @address.address = address
      if @address.save
        render json: @address, status: :created, location: @addresses
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    device_id = address_params[:device_id]
    id = address_params[:id]
    if device_id.present? and id.present?
      @address = Address.where(device_id:device_id,id:id)
      if @address.destroy(id)
        render json: nil, status: :no_content
      else
        render json: 'error', status: :unprocessable_entity
      end
    end
  end

  # def update
  #   if @address.update(address_params)
  #     render json: @address
  #   else
  #     render json: @address.errors, status: :unprocessable_entity
  #   end
  # end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:device_id, :name,:title , :cel, :address_detail,:id,:format)
    end
    
end
