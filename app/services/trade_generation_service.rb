class TradeGenerationService
  def initialize(data:, date:)
      @data = data
      @date = date
  end

  def call
    generate_gain
  end

  private

  def generate_gain
    return 0 unless @data.present?

    lowest_price, highest_price = @data.pluck(:value).minmax

    @data.count * ( highest_price - lowest_price )
  end
end