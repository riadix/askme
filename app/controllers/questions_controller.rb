class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'New question created'
    else
      flash.now[:alert] = 'Please enter the question'

      render :new
    end
  end

  def update
    @question.update(question_params)

    redirect_to user_path(@question.user), notice: 'Question saved'
  end

  def destroy
    @user = @question.user

    @question.destroy

    redirect_to user_path(@user), notice: 'Question deleted'
  end

  def show
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

  def question_params
    params.require(:question).permit(:body, :user_id, :hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
