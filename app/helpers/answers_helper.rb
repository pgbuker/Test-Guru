module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      "Редактировать ответ"
    else
      "Создать новый ответ"
    end
  end
end
