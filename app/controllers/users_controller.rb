class UsersController < ApplicationController
  before_action :logged_in_user, :load_user, :correct_user, only: %i(show)

  def show
    if @user.student?
      redirect_to @user.student
    elsif @user.tutor?
      redirect_to @user.tutor
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Bạn đã đăng ký thành công"
      log_in @user
      if @user.tutor?
        redirect_to new_tutor_path
      else
        redirect_to new_student_path
      end
    else
      render :new
    end
  end

  def destroy
    current_user.destroy
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to current_user
  end

  def correct_user
    return if current_user?(@user)
    redirect_to current_user
  end
end
