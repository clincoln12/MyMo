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
      render :new
    end
  end

  def index
    @subscription = current_user.subscriptions
  end

  def show
    @subscription = Subscription.find_by(id: params[:id])
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update(name: params[:subscription][:name], fee: params[:subscription][:fee], billing: params[:subscription][:billing])
    redirect_to subscription_path(@subscription)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to '/subscriptions'
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :fee, :billing)
  end
end
