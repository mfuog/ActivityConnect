class CreateAdminService
  def call
    user = User.find_or_create_by!(username: ENV['ADMIN_USERNAME']) do |user|
    	user.email = ENV['ADMIN_EMAIL']
    	user.first_name = ENV['ADMIN_FIRSTNAME']
    	user.last_name = ENV['ADMIN_LASTNAME']
      user.password = ENV['ADMIN_PASSWORD']
      user.password_confirmation = ENV['ADMIN_PASSWORD']
      user.admin!
    end
  end
end
