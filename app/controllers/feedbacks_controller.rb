class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      flash[:notice] = t('.success')
      FeedbackMailer.with(email:  @feedback.email).send_message(@feedback).deliver_now
    else
      flash[:alert] = t('.failure')
    end
    redirect_to new_feedback_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
