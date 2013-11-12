json.array!(@books) do |book|
  json.extract! book, :user_id, :name, :description, :status
  json.url book_url(book, format: :json)
end
