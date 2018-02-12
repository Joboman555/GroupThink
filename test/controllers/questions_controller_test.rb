require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "submitting form should create new model" do
    assert_nil Question.find_by(title: "This is a test question")
    post "/questions", params: { question: { title: "This is a test question", text: "Lorem ipsum upsum" } }
    assert_not_nil Question.find_by(title: "This is a test question")
  end
end
