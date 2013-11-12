json.array!(@conditions) do |condition|
  json.extract! condition, :act_id, :source_class, :source_name, :condition_class, :value
  json.url condition_url(condition, format: :json)
end
