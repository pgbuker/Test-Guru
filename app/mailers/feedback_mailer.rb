class FeedbackMailer < ApplicationMailer


  default to: 'kirill.bezik@gmail.com'

  def send_message(feedback)
    @message = feedback.message
    @user = feedback.user
    mail from: feedback.user.email

  end
end
