class FeedbackMailer < ApplicationMailer

  before_action { @mailer = params[:email] }

  default to: 'kirill.bezik@gmail.com'

  def send_message(feedback)
    @message = feedback.message
    mail from: @mailer
  end
end
