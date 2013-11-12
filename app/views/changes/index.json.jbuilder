json.array!(@changes) do |change|
  json.extract! change, :act_id, :source_class, :source_name, :change_class, :change_way, :value
  json.url change_url(change, format: :json)
end
