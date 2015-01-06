class CreateAdminService
  def call
    user = User.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |user|
    	user.username = ENV['ADMIN_USERNAME']
    	user.first_name = ENV['ADMIN_FIRSTNAME']
    	user.last_name = ENV['ADMIN_LASTNAME']
        user.password = ENV['ADMIN_PASSWORD']
        user.password_confirmation = ENV['ADMIN_PASSWORD']
        user.admin!
      end
  end
end
