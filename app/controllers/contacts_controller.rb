class ContactsController < ApplicationController

  def create
    contact = Contact.new(contact_params)
    return render json: {message: "ok"}, status: :ok if contact.is_organization == !contact.is_deliveryman and contact.save! 
    return render json: {message: "error", number:1}, status: :unprocessable_entity #422
    rescue ActiveRecord::RecordInvalid => e
      render json: { message: "error", errors: contact.errors.full_messages, number:2 }, status: :unprocessable_entity
  end
  
  private
    def contact_params
      params.require(:contact).permit(:phone_number, :is_deliveryman, :is_organization)
    end

end
