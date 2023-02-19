module QuestionsHelper
  def question_header(question, test)
    if question.persisted?
      "Редактировать #{question.test.title} вопрос"
    else
      "Создать новый #{test.title} вопрос"
    end
  end
end
