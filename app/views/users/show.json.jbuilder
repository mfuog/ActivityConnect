json.(@user, :id, :first_name, :last_name, :email, :address, :longitude, :latitude)
json.joint @user.joint_activities, :id, :title
json.authored @user.authored_activities, :id, :title
