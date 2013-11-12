json.array!(@time_controls) do |time_control|
  json.extract! time_control, :book_id, :started_time, :end_time, :is_time_included
  json.url time_control_url(time_control, format: :json)
end
