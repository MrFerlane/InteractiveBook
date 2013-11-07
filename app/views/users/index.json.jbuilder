json.array!(@users) do |user|
  json.extract! user, :name, :email, :password_digest, :is_admin, :is_writer
  json.url user_url(user, format: :json)
end
