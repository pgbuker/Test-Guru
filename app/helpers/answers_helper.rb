module AnswersHelper
  def answer_header(_question, answer)
    if answer.persisted?
      "Создать новый #{answer.question.body} ответ"
    else
      "Редактировать #{answer.question.body} ответ"
    end
  end
end
