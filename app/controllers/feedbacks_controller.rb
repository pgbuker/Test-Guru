class FeedbacksController < ApplicationController
  before_action :authenticate_user!

 
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      flash[:notice] = t('.success')
      FeedbackMailer.send_message(@feedback).deliver_now
    else
      flash[:alert] = t('.failure')
    end
    redirect_to new_feedback_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
