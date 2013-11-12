json.array!(@items) do |item|
  json.extract! item, :character_id, :name, :description, :count
  json.url item_url(item, format: :json)
end
