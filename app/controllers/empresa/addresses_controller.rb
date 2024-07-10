module Empresa
  class AddressesController < ApplicationController
    include ResponseHandler

    def get_address_by_id
      id = get_address_by_id_params[:id].to_i 
      address = Address.find(id) if id > 0
      if address
        return render_json_response(obj:address, state: ResponseHandler::STATES[:success])
      else
        return render_json_response(state: ResponseHandler::STATES[:not_found])
      end
    end

  private

    def get_address_by_id_params
      params.permit(:id,:format)
    end

  end
end
