class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def index
    @comments = Comment.all
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    respond_to do |format|
      format.html { redirect_to @comment}
      format.js # render comments/create.js.erb
    end
  end

  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'You have to be logged in to write a comment!. This helps us prevent spam. Sorry for the inconvenience!'
      end
    end

  private
    def comment_params
      params.require(:comment).permit(:text, :question_id).merge(user: current_user)
    end
end
