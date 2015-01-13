json.array!(@activities) do |activity|
	json.(activity, :id, :title, :description, :proposed_time)
  json.url activity_url(activity, format: :json)
end
