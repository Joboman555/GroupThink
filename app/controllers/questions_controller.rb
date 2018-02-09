class QuestionsController < ApplicationController
  def index
    if params[:link_id]
      @questions = Question.where(link_id: params[:link_id])
    else
      @questions = Question.all
    end

    respond_to do |format|
      format.html
      format.js # execute index.js.erb
    end
  end

  def show
    @question = Question.find(params[:id])
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

  private
    def question_params
      params.require(:question).permit(:title, :text, :link_id)
    end
end
