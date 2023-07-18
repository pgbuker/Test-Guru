class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    return redirect_to test_passage_path(@test_passage), alert: t('.choose_without_answer') unless params[:answer_ids] 
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgeService.new(@test_passage).call
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
