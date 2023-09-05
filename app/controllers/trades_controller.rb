class TradesController < ApplicationController

  before_action :filter_trades

  def index; end

  def generate_gain
    @possible_gain = TradeGenerationService.new(data: @trades, date: date).call
  end

  private

  def date
    return Date.current unless params[:date].present?

    params[:date].to_date
  end

  def filter_trades
    @trades = Trade.where(time: date.beginning_of_day..date.end_of_day)
  end
end
