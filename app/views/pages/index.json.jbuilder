json.array!(@pages) do |page|
  json.extract! page, :book_id, :number, :text
  json.url page_url(page, format: :json)
end
