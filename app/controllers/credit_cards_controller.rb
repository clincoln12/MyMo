class CreditCardsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:credit_card_id] && @credit_card = CreditCard.find_by_id(params[:credit_card_id])
    else
      @credit_card = CreditCard.new
    end
  end

  def create
    @credit_card = current_user.credit_cards.build(credit_card_params)
    if @credit_card.save
      redirect_to @credit_card
    else
      render :new
    end
  end

  def index
    @credit_card = current_user.credit_cards
  end

  def show
    @credit_card = CreditCard.find_by(id: params[:id])
  end

  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  def update
    @credit_card = CreditCard.find(params[:id])
    @credit_card.update(company: params[:credit_card][:company], digits: params[:credit_card][:digits])
    redirect_to credit_card_path(@credit_card)
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])
    @credit_card.destroy
    redirect_to '/credit_cards'
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(:company, :digits)
  end
end
