json.(@activity, :id, :title, :description, :when)
json.author @activity.author, :id, :email, :first_name, :last_name, :role