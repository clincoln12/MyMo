class PaymentsController < ApplicationController
  before_action :redirect_if_not_logged_in, :check_if_user_owns_payment

  def new
    @subscription = Subscription.find(params[:subscription_id])
    if params[:payment_id]
      @payment = Payment.find_by_id(params[:payment_id])
    else
      @payment = Payment.new
    end
  end

  def edit
    @subscription = Subscription.find(params[:subscription_id])
    @payment = payment
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.subscription_id = params[:subscription_id]
    
    if @payment.save
      redirect_to subscription_payment_path(params[:subscription_id], @payment)
    else
      flash.alert = @payment.errors.full_messages[0]
      render :new
    end
  end

  def index
    @subscription = Subscription.find(params[:subscription_id])
    @payments = current_user.payments.where(subscription_id: @subscription.id)
  end

  def show
    @payment = payment
  end

  def update
    @payment = payment
    @payment.update(billing: params[:payment][:billing], status: params[:payment][:status])
    redirect_to subscription_payments_path
  end

  def destroy
    @payment = payment
    @payment.destroy
    redirect_to subscription_payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:billing, :status, :credit_card_id)
  end

  def payment
    Payment.find(params[:id])
  end

  def check_if_user_owns_payment
    @subscription = Subscription.find(params[:subscription_id])
    redirect_to subscriptions_path unless @subscription.user == current_user
  end
end
