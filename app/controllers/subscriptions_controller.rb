class SubscriptionsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:subscription_id] && @subscription = Subscription.find_by_id(params[:subscription_id])
    else
      @subscription = Subscription.new
    end
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to @subscription
    else
      flash.alert = @subscription.errors.full_messages[0]
      render :new
    end
  end

  def index
    @subscription = current_user.subscriptions
  end

  def show
    @subscription = current_user.subscriptions.find_by(id: params[:id])
    if @subscription == nil
      redirect_to subscriptions_path
    end
  end

  def edit
    @subscription = current_user.subscriptions.find_by(id: params[:id])
    if @subscription == nil
      redirect_to subscriptions_path
    end
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update(name: params[:subscription][:name], fee: params[:subscription][:fee], billing: params[:subscription][:billing])
    redirect_to subscription_path(@subscription)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to subscription_path
  end

  def alphabetical
    @subscription = current_user.subscriptions.alphabetical
  end

  def price
    @subscription = current_user.subscriptions.price
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :fee, :billing)
  end
end
