json.(@activity, :id, :title, :description, :when)
json.author @activity.author, :id, :username, :first_name, :last_name, :role, :email