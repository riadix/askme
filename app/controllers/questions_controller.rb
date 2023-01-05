class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[update destroy edit]

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    question_params[:author_id] = current_user[:id] if current_user

    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'New question created'
    else
      flash.now[:alert] = 'Please enter the question'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    @question.update(question_params)

    redirect_to user_path(@question.user), notice: 'Question saved'
  end

  def destroy
    @user = @question.user

    @question.destroy

    redirect_to user_path(@user), notice: 'Question deleted'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
