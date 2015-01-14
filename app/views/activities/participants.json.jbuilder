json.array!(@activity.participants) do |p|
    json.(p, :id, :first_name, :last_name, :email, :gender, :age, :interests, :address, :longitude, :latitude)
  json.url activity_url(p, format: :json)
end