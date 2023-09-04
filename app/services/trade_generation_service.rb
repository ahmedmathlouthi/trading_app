class TradeGenerationService
  def initialize(data:, date:)
      @data = data
      @date = date.to_date
  end

  def call 
    generate_gain
  end

  private

  def generate_gain
    return 0 unless filtered_data.present?

    lowest_price, highest_price = filtered_data.pluck(:value).minmax

    filtered_data.count * ( highest_price - lowest_price )
  end

  def filtered_data
    @data.where(time: @date.beginning_of_day..@date.end_of_day)
  end
end