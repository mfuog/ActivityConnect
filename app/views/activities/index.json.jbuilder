json.array!(@activities) do |activity|
	json.(activity, :id, :title, :description, :when)
  json.url activity_url(activity, format: :json)
end
