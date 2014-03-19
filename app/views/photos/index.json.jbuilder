json.array!(@photos) do |photo|
  json.extract! photo, :id, :user_id, :date, :comment
  json.url photo_url(photo, format: :json)
end
