class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    render inline: 'Вопрос: <%= Question.find(params[:id]).body %>'
  end

  def index
    render inline: 'Вопросы теста: <%= @test.questions.pluck(:body) %>'
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: 'Вопрос: <%= @question.inspect %> - создан и записан!'
    else
      render plain: 'Error'
    end
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
