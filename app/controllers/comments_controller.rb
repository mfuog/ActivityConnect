class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    puts comment_params
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id if current_user
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    respond_with(@comment)
  end

  def update
    flash[:notice] = 'Comment was successfully updated.' if @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
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
