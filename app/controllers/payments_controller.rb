class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :update, :destroy]

  def list_all_methods
    render json: Payment.all
  end

  # def index
  #   @payments = Payment.all
  #   render json: @payments
  # end

  # def show
  #   render json: @payment
  # end

  # def create
  #   @payment = Payment.new(payment_params)
  #   if @payment.save
  #     render json: @payment, status: :created, location: @payment
  #   else
  #     render json: @payment.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @payment.update(payment_params)
  #     render json: @payment
  #   else
  #     render json: @payment.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @payment.destroy
  # end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:name, :icon, :payment_type)
    end
end
