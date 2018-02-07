class DocsController < ApplicationController
  def index
    @questions = Question.all
  end
end
