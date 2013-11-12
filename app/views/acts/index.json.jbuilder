json.array!(@acts) do |act|
  json.extract! act, :page_id, :description, :success_page, :fail_page, :time_fail_page, :required_time
  json.url act_url(act, format: :json)
end
