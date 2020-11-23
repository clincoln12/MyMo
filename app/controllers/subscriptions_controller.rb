class SubscriptionsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    @subscription.service_id = 30
    if @subscription.save
      redirect_to @subscription
    else
      render :new
    end
  end

  def index
    @subscription = current_user.subscriptions
  end

  private

  def subscription_params
    params.require(:subscription).permit(:fee, :billing)
  end
end
