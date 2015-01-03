json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :description, :when, :author
  json.url activity_url(activity, format: :json)
end
