json.(@activity, :id, :title, :description, :proposed_time)
json.(@activity.author, :id, :first_name)
json.participants @activity.participants, :id, :first_name, :last_name, :email
