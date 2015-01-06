class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    flash[:notice] = 'Activity was successfully created.' if @activity.save
    respond_with(@activity)
  end

  def update
    flash[:notice] = 'Activity was successfully updated.' if @activity.update(activity_params)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title, :description, :when, :author_id)
    end
end
