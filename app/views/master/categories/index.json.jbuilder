json.array!(@master_categories) do |master_category|
  json.extract! master_category, :id, :name
  json.url master_category_url(master_category, format: :json)
end
