json.array!(@pictures) do |picture|
  json.extract! picture, :title
  json.url picture_url(picture, format: :json)
end
