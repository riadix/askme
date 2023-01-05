module QuestionsHelper
  def find_author(question)
    User.find_by(id: question.author_id)
  end
end
