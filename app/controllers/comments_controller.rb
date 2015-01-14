class CommentsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  # GET /activities/:id/comments.json
  def index
    @comments = Comment.where(commenter_id: params[:activity_id])
    respond_to :json
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id if current_user
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    redirect_to activity_path(@comment.activity_id)
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body, :activity_id)
    end
end
