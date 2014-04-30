json.array!(@sweets) do |sweet|
  json.extract! sweet, :id, :username
  json.url sweet_url(sweet, format: :json)
end
