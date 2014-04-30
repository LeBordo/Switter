json.array!(@sours) do |sour|
  json.extract! sour, :id, :swit_id, :username
  json.url sour_url(sour, format: :json)
end
