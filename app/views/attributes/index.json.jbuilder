json.array!(@attributes) do |attribute|
  json.extract! attribute, :character_id, :name, :description, :count
  json.url attribute_url(attribute, format: :json)
end
