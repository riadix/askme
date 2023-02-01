class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit]
  before_action :set_question_for_current_user, only: %i[update destroy edit]

  # hashtags
  after_action :hashtag_check, only: %i[create update]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user

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
    @questions = Question.order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).first(10)
    @hashtags = Hashtag.order(created_at: :desc).first(10)
  end

  def new
    @user = User.find_by!(nickname: params[:user_nickname])
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

  # hashtag
  def hashtag_check
    hashtags = @question.body.scan(/#\w+/)
    return true if hashtags.blank?

    hashtags.each do |tag|
      if Hashtag.where(name: tag).present?
        @new_hashtag = Hashtag.find_by(name: tag)
      else
        @new_hashtag = Hashtag.create(name: tag)
      end
      @new_hashtag.questions += [@question]
    end
  end
end
