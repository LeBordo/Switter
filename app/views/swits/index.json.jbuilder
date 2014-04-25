json.array!(@swits) do |swit|
  json.extract! swit, :id, :body, :author, :likes, :unlike
  json.url swit_url(swit, format: :json)
end
