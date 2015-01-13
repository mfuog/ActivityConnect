json.(@user, :id, :first_name, :last_name, :gender, :age, :interests, :email, :address, :longitude, :latitude)
json.joined @user.joined_activities, :id, :title
json.authored @user.authored_activities, :id, :title
