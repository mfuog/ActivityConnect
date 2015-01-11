class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:destroy]
  before_action :authenticate_user!

  # POST /participations
  def create
    @participation = Participation.new()
    @participation.user_id = current_user.id if current_user
    @participation.activity_id = params[:activity_id]
    flash[:notice] = success_message('created') if @participation.save
    redirect_to activity_path(params[:activity_id])
  end

  # DELETE /participations/:id
  def destroy
    flash[:notice] = success_message('deleted') if @participation.destroy
    redirect_to activity_path(params[:activity_id])
  end
  private
    def set_participation
      @participation = Participation.find_by_user_id_and_activity_id(current_user.id, params[:activity_id])
    end

    def participation_params
      params.require(:participation).permit(:user_id, :activity_id)
    end

    def success_message(action)
      "Activity participation was successfully #{action}."
    end
end
