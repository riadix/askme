class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registration successful!'
    else
      flash.now[:alert] = 'Please check the information you gave'

      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'Details updated'
    else
      flash.now[:alert] = 'Error saving'

      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end
end
