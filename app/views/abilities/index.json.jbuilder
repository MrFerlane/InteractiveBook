json.array!(@abilities) do |ability|
  json.extract! ability, :character_id, :name, :description
  json.url ability_url(ability, format: :json)
end
