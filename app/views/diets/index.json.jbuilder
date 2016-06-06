json.array!(@diets) do |diet|
  json.extract! diet, :id, :univ_id, :name, :location, :date, :time, :diet, :extra
  json.url diet_url(diet, format: :json)
end
