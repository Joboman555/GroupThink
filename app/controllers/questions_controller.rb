class QuestionsController < ApplicationController
  def index
    if params[:link_id]
      @questions = Question.where(link_id: params[:link_id])
    else
      @questions = Question.all
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
    redirect_to(@question)
  end

  private
    def question_params
      params.require(:question).permit(:title, :text, :link_id)
    end
end
