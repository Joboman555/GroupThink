class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  def index
    if params[:link_id]
      @questions = Question.where(link_id: params[:link_id])
      @link_id = params[:link_id]
    else
      @questions = Question.all
    end

    respond_to do |format|
      format.html # show all questions
      format.js # execute index.js.erb
    end
  end

  def show
    @question = Question.find(params[:id])
    @comments = Comment.where(question_id: @question.id)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @question = Question.new(question_params)

    @question.save
    respond_to do |format|
      format.html { redirect_to @question}
      format.js # render a questions/create.js.erb
    end
  end

  def update
    @question = Question.find(params[:id])
    vote = @question.vote_of(current_user)

    if params[:type] == 'upvote'
      change = 1
    elsif params[:type] == 'downvote'
      change = -1
    elsif params[:type] == 'unvote'
      change = 0
    end

    if !vote
      vote = Vote.new(score: change, submission_type: :question, user: current_user, submission_id: params[:id])
    else
      # undo old vote
      @question.score = @question.score - vote.score
      vote.score = change
    end
    vote.save!
    @question.score = @question.score + change
    @question.save!

    respond_to do |format|
      format.html
      format.js
    end
  end

  def hide
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'You have to be logged in to do that. This helps us prevent spam. Sorry for the inconvenience!'
      end
    end

  private
    def question_params
      params.require(:question).permit(:title, :text, :link_id, :type).merge(user: current_user)
    end
end
