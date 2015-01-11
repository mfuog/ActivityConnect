class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: :show

  respond_to :html, :json

  # GET /comments/:id
  # GET /comments/:id.json
  def show
    @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id if current_user
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body, :activity_id)
    end
end
