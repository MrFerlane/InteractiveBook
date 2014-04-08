json.array!(@default_abilities) do |default_ability|
  json.extract! default_ability, :book_id, :name, :description
  json.url default_ability_url(default_ability, format: :json)
end
