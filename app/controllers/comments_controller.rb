class CommentsController < ApplicationController
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

  private
    def comment_params
      params.require(:comment).permit(:text, :question_id)
    end
end
