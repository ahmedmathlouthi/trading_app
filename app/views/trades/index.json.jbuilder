
json.trades do 
  json.array! @trades do |trade|
    json.extract! trade, :id, :value
    json.time trade.time.iso8601
  end
end