class PaymentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @subscription = Subscription.find(params[:subscription_id])
    if params[:payment_id]
      @payment = Payment.find_by_id(params[:payment_id])
    else
      @payment = Payment.new
    end
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.subscription_id = params[:subscription_id]
    
    if @payment.save
      redirect_to subscription_payment_path(params[:subscription_id], @payment)
    else
      render :new
    end
  end

  def index
    @subscription = Subscription.find(params[:subscription_id])
    @payments = current_user.payments
  end

  def show
    @payment = Payment.find_by(id: params[:id])
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update(billing: params[:payment][:billing], status: params[:payment][:status])
    redirect_to payment_path(@payment)
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    redirect_to subscription_payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:billing, :status, :credit_card_id)
  end
end
