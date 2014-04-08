json.array!(@character_items) do |character_item|
  json.extract! character_item, :character_id, :default_item_id, :value
  json.url character_item_url(character_item, format: :json)
end
