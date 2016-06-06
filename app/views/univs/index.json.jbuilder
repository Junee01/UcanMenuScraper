json.array!(@univs) do |univ|
  json.extract! univ, :id, :univ_name
  json.url univ_url(univ, format: :json)
end
