json.array!(@trackings) do |tracking|
  json.extract! tracking, :id, :session_id, :product_id, :page_name, :detail
  json.url tracking_url(tracking, format: :json)
end
