class ParticipationsController < ApplicationController
  #before_action :set_participation, only: [:create]
  before_action :authenticate_user!

  # POST /participations
  def create
    @participation = Participation.new()
    @participation.user_id = current_user.id if current_user
    @participation.activity_id = params[:activity_id]
    flash[:notice] = 'Activity participation was successfully created.' if @participation.save
    redirect_to activity_path(params[:activity_id])
  end

  private
    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:user_id, :activity_id)
    end
end
