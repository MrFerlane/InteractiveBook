json.array!(@default_attributes) do |default_attribute|
  json.extract! default_attribute, :book_id, :name, :description
  json.url default_attribute_url(default_attribute, format: :json)
end
