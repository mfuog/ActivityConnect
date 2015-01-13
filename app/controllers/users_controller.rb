class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_caretaker_access, only: :destroy
  before_action :restrict_user_access, except: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to :back, :notice => "User updated."
    else
      redirect_to :back, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def restrict_user_access
    if current_user.user?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def restrict_caretaker_access
    if current_user.caregiver?
      redirect_to :back, alert: "Access denied"
    end
  end

  def secure_params
    params.require(:user).permit(:role, :caregiver_id)
  end

end
