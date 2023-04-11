class GistsController < ApplicationController
  

  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call


  if result.html_url.present?
    current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
    flash[:notice] = t('.success', url: result.html_url)
  else
    flash[:alert] = t('.failure')
  end

    redirect_to @test_passage

  end

  private

  def set_test_passage
    @test_passage = TestPassage.last
  end

end
