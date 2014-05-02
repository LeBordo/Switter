json.array!(@doortags) do |doortag|
  json.extract! doortag, :id, :swit_id, :tag
  json.url doortag_url(doortag, format: :json)
end
