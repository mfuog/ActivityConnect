json.(@user, :id, :first_name, :last_name, :email)
json.joint @user.joint_activities, :id, :title
json.authored @user.authored_activities, :id, :title
