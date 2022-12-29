class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    @current_user = User.create(user_params)

    if @current_user.save
      session[:user_id] = @current_user.id
    end

    redirect_to root_path, notice: 'New user successfully created'
  end
end
