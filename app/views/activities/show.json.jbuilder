json.(@activity, :id, :title, :description, :when)
json.(@activity.author, :id, :first_name)
json.participants @activity.participants, :id, :first_name, :last_name, :email
