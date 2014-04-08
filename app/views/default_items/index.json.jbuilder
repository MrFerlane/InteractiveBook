json.array!(@default_items) do |default_item|
  json.extract! default_item, :book_id, :name, :description
  json.url default_item_url(default_item, format: :json)
end
