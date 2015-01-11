class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    respond_with(@activity)
  end

  # GET /activities/:id
  # GET /activities/:id.json
  def show
    @activity
    @comments = @activity.comments.all
    @comment = @activity.comments.build
    @isAuthor = current_user == @activity.author
    @isParticipant = @activity.participant?(current_user)

    respond_with(@activity)
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    respond_to :html
  end

  # GET /activities/:id/edit
  def edit
    unless current_user == @activity.author
      redirect_to activity_path(@activity.id)
    end
    respond_to :html
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    flash[:notice] = 'Activity was successfully created.' if @activity.save
    respond_with(@activity)
  end

  # PATCH/PUT /activities/:id
  # PATCH/PUT /activities/:id.json
  def update
    flash[:notice] = 'Activity was successfully updated.' if @activity.update(activity_params)
    respond_with(@activity)
  end

  # DELETE /activities/:id
  # DELETE /activities/:id.json
  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :description, :when, :author_id)
    end
end
