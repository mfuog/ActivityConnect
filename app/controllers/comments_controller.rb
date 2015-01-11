class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: :show

  # POST /comments
  # POST /comments.json
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
