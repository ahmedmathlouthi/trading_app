class TradesController < ApplicationController

  before_action :get_trades

  def index;end


  def generate_gain
    date = params[:date]
    @possible_gain = TradeGenerationService.new(data: @trades, date: date).call
  end

  private 

  def get_trades
    @trades = Trade.all
  end
end
